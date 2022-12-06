// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie_animation/components/rounded_button.dart';
import 'package:lottie_animation/screens/homescreen.dart';
import 'package:lottie_animation/services/validation_services.dart';
import 'package:lottie_animation/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CompleteProfile extends StatefulWidget {
  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {

  final _formKey = GlobalKey<FormState>();

  AppUser user = AppUser();



  @override
  Widget build(BuildContext context) {
    //TODO update what details you want

    //for showing loading
    bool loading = false;

    user.Uid=FirebaseAuth.instance.currentUser.uid;
    return Form(
      key:_formKey,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            SafeArea(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                      Color(0xFF333652),
                      Colors.black.withOpacity(.1),
                    ])),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'PARKKING',
                    style: TextStyle(
                      fontSize: 27.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    //TODO update this
                    'Complete your Profile',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                          width: double.infinity,
                          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                height: 22,
                                width: 22,
                                child: Icon(
                                  Icons.account_box,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ],
                          )),
                      Container(
                          height: 70,
                          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                          child: TextFormField(
                            onChanged: (value) {
                              user.name = value;
                            },
                            validator: ValidationService().nameValidator,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintText: 'Name',
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.white70)),
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                          width: double.infinity,
                          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                height: 22,
                                width: 22,
                                child: Icon(
                                  Icons.phone_android,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ],
                          )),
                      Container(
                          height: 70,
                          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                          child: TextFormField(
                              onChanged: (value) {
                                user.phone_number = value;
                              },
                              validator: ValidationService().contactValidator,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  hintText: 'Phone Number',
                                  focusedBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.white70)),
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                    ],
                  ),
                  // national id number
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                          width: double.infinity,
                          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                height: 22,
                                width: 22,
                                child: Icon(
                                  Icons.account_box,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ],
                          )),
                      Container(
                          height: 70,
                          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                          child: TextFormField(
                            onChanged: (value) {
                              user.idnumber = value;
                            },
                            validator: ValidationService().IDValidator,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintText: 'ID Number',
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.white70)),
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          )),
                    ],
                  ),
                  // national id number
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                          width: double.infinity,
                          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                height: 22,
                                width: 22,
                                child: Icon(
                                  Icons.account_box,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ],
                          )),
                      Container(
                          height: 70,
                          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                          child: TextFormField(
                            onChanged: (value) {
                              user.licensenumber = value;
                            },
                            validator: ValidationService().licenseValidator,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintText: 'License Number',
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.white70)),
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          )),
                    ],
                  ),
                  // national id number
                  SizedBox(
                    height: 20,
                  ),
                  RoundedButton(
                    title: 'Save',
                    colour: Colors.blueAccent,
                    onPressed: () async{
                      if (_formKey.currentState.validate()) {
                         await FirebaseFirestore.instance
                            .collection('CompleteProfile')
                            .add({'Uid':user.Uid ,
                          'name': user.name,
                          'phone_number':user.phone_number,
                          'idnumber': user.idnumber,
                          'licensenumber':user.licensenumber,
                        });
                      }
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

