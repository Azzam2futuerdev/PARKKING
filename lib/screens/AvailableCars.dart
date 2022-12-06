// @dart=2.9
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottie_animation/components/rounded_button.dart';
import 'package:lottie_animation/models/Constants.dart';
import 'checkout.dart';


class AvailableCars extends StatefulWidget {


  const AvailableCars({Key key}) : super(key: key);
  @override
  _AvailableCarsState createState() => _AvailableCarsState();
}

class _AvailableCarsState extends State<AvailableCars> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF90ADC6),
        title: Align(
          alignment: Alignment(-0.3, 0.0,),
          child: Text('Available Cars'),
        )
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('Cars').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              return ListView.builder(
                  padding: new EdgeInsets.all(8.0),
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot info = snapshot.data.docs[index];
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(children: <Widget>[
                        ListTile(
                          title: Text( info['Name']+' Car', style: kHeadingStyle),
                          subtitle: Text(
                            info['Model']+" "+info['Color'],
                            style: TextStyle(
                              color: greyColor,
                            ),
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Image(
                              image: NetworkImage(info['Image']),
                              width: 100.0,
                              height: 250.0,
                            ),
                          ),
                        ),

                        // CachedNetworkImage(
                        //   imageUrl: info['Image'],
                        //   placeholder: (context, url) => CircularProgressIndicator(),
                        //   errorWidget: (context, url, error) => Icon(Icons.error),
                        // ),
                        Row(
                          //Divider line
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                                child: Divider(color: greyColor),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.0, left: 20.0, right: 20.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      child: Text(
                                        info['Price'].toString(),
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 22.0, fontWeight: FontWeight.bold),
                                      ),
                                    ),

                                    Container(
                                      child: Text(
                                        'Total'+' JD',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: greyColor,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ),
                                    RoundedButton(title: 'BOOK NOW', colour:Color(0xFFFAD02C) , onPressed:(){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Checkout(info:info)));
                                    } ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    );
                  });
            }),
      ),
    );
  }
}

