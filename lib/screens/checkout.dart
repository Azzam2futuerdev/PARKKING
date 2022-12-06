import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie_animation/services/payment_handler.dart';

class Checkout extends StatelessWidget {
  final DocumentSnapshot info;

  const Checkout({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 30,
        ),
        // height: 174,
        decoration: BoxDecoration(

          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          // boxShadow: [
          //   BoxShadow(
          //     offset: Offset(0, -15),
          //     blurRadius: 20,
          //     color: Color(0xFFDADADA).withOpacity(0.15),
          //   )
          //],
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'PARKKING',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333652),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                width:600,
                  height: 60,

                decoration: BoxDecoration(
                    color: Color(0xFFE9EAEC),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),

                child: Text(
                  'Booking Information:',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                width:600,
                height: 60,
                decoration: BoxDecoration(
                    color: Color(0xFFE9EAEC),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Text(
                  info['Name'],
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                width:600,
                height: 60,
                decoration: BoxDecoration(
                    color: Color(0xFFE9EAEC),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Text(
                  info['Model'],
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                width:600,
                height: 60,
                decoration: BoxDecoration(
                    color: Color(0xFFE9EAEC),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Text(
                  info['Color'],
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.fromLTRB(75, 30, 0, 0),
                //margin: EdgeInsets.fromLTRB(10, 0, 0 ,0),
                decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.all(Radius.circular(11))),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Total:\n",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 21.0, color: Colors.black,),
                        children: [
                          ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 90, 55),
                      child: SizedBox(
                        child: Text(
                          "JD${info['Price'].toString()}",
                          style: TextStyle(color: Colors.black,
                              decoration: TextDecoration.none,
                          fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children:[ ElevatedButton(
                    child: Text(
                      'Check Out',
                      style: TextStyle(fontSize: 15,),
                    ),
                    onPressed: () {
                      PaymentHandler(
                          amount: info['Price'].toString(),
                          carDetails: info['Name'] +
                              '-' +
                              info['Model'] +
                              '-' +
                              info['Color'])
                          .getClientToken(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary:Colors.blueGrey,
                      elevation: 5,
                      padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 25),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
