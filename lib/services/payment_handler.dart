import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/scheduler.dart';
import 'package:lottie_animation/models/order_model.dart';
import 'package:lottie_animation/screens/homescreen.dart';

class BillingFields {
  static String get firstName => 'firstName';

  static String get lastName => 'lastName';

  static String get streetAddress => 'streetAddress';

  static String get locality => 'locality';

  static String get postalCode => 'postalCode';

  static String get region => 'region';
}

class PaymentHandler {
  String amount;
  String carDetails;

  PaymentHandler({required this.amount,required this.carDetails});

  final FirebaseAuth auth = FirebaseAuth.instance;

  final kWebBraintreeLink='https://us-central1-parkking-ac6fa.cloudfunctions.net';
  static final String kWebBraintreeToken = 'sandbox_jyvyvxfx_prggfcx7z89rz3zn';

  String customerId = '';
  String orderId = '';

  var headers = {
    'content-type': 'application/json',
  };
  var token = kWebBraintreeToken;

  Future<void> getClientToken(context) async {
    customerId = auth.currentUser?.uid ?? '';
    if (customerId != '') {
      var res = await http.get(
          Uri.parse('$kWebBraintreeLink/widgets/token/$customerId'),
          headers: headers);
      if (res.statusCode == 200) {
        var x = jsonDecode(res.body);
        token = x['token'] ?? token;
      }
    }
    if (!kIsWeb) getMobilePaymentNonce(context);
  }

  void getMobilePaymentNonce(context) async {
    final request = BraintreeDropInRequest(
      amount: amount,
      vaultManagerEnabled: true,
      clientToken: token.toString(),
      collectDeviceData: true,
      paypalRequest: BraintreePayPalRequest(),
    );
    BraintreeDropInResult? result = await BraintreeDropIn.start(request);
    var nonce = result?.paymentMethodNonce.nonce;
    print(nonce);
    checkout(nonce!);
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Homescreen()),
      );
    });
  }

  void checkout(String nonce) async {
    bool newUser = false;
    if (customerId != '') {
      var res = await http.get(
          Uri.parse('$kWebBraintreeLink/widgets/customer/$customerId'),
          headers: headers);
      if (res.body.contains('notFoundError')) {
        var userData = {
          "id": customerId,
          BillingFields.firstName: 'nassem',
          BillingFields.lastName: 'hasasneh',
          BillingFields.streetAddress: 'amman',
          BillingFields.locality: 'amman',
          BillingFields.region: 'jordan',
          BillingFields.postalCode: '200921',
          "payment_method_nonce": nonce
        };
        var res = await http.post(
            Uri.parse('$kWebBraintreeLink/widgets/create-customer'),
            headers: headers,
            body: json.encode(userData));

        if (res.statusCode != 200) {
          throw Exception('http.post error: statusCode= ${res.statusCode}');
        }
        var transactionData = {
          "amount": double.parse(amount),
          "customerId": customerId
        };
        res = await http.post(
            Uri.parse('$kWebBraintreeLink/widgets/checkout-id'),
            headers: headers,
            body: json.encode(transactionData));
        if (res.statusCode == 200) {
          orderId = json.decode(res.body)['transaction']['id'];
        }
        else {
          throw Exception('http.post error: statusCode= ${res.statusCode}');
        }
        newUser = true;
      }
    }
    if (!newUser) {
      var transactionData = {
        "amount": double.parse(amount),
        "payment_method_nonce": nonce,
      };
      var res = await http.post(
          Uri.parse('$kWebBraintreeLink/widgets/checkout'),
          headers: headers,
          body: json.encode(transactionData));
      if (res.statusCode == 200) {
        orderId = json.decode(res.body)['transaction']['id'];
      }
        else {
        throw Exception('http.post error: statusCode= ${res.statusCode}');
      }
    }
    await storeOrder(
      Order(
        id: orderId,
        amount: amount,
        carDetails: carDetails,
        date: DateTime.now().toString(),
        customerId: customerId,
      ),
    );
  }

  static Future<String?>? storeOrder(Order order) async {
    FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    DocumentReference _reference =
        await _fireStore.collection('Orders').add(order.toMap());
    return _reference.id;
  }
}
