// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie_animation/components/rounded_button.dart';
import 'package:lottie_animation/models/Car.dart';
import 'package:lottie_animation/services/Delete_doc.dart';

class AddCars extends StatefulWidget {
  @override
  _AddCarsState createState() => _AddCarsState();
}

class _AddCarsState extends State<AddCars> {
  Car car= Car();
  void initState() {
    _carList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addDialog(context);
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      body: _carList(),
    );
  }
  Future<bool> addDialog(BuildContext context) async {
    return showDialog(
      useSafeArea: true,
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
             insetPadding: EdgeInsets.symmetric(vertical: 50),
            title: Text(
              'Add Car',
              style: TextStyle(fontSize: 15),
            ),
            content: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(hintText: 'Enter car Color'),
                  onChanged: (value) {
                    car.Color = value;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Enter car Image Url'),
                  onChanged: (value) {
                    car.Image = value;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Enter car Model'),
                  onChanged: (value) {
                    car.Model = value;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Enter car Name'),
                  onChanged: (value) {
                    car.Name = value;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Enter car Price'),
                  onChanged: (value) {
                   car.Price = value;
                  },
                ),
              ],
            ),
            actions: <Widget>[
              RoundedButton(
                title: 'Add',
                colour: Colors.blue,
                onPressed: () async {
                  await FirebaseFirestore.instance
                      .collection('Cars')
                      .add({'Color':car.Color ,
                    'Image': car.Image,
                    'Model':car.Model,
                    'Name':car.Name,
                    'Price':car.Price,
                  });
                  dialogTrigger(context);
                  initState();
                  //Navigator.of(context).pop();
                  }, //onpressed
              )
            ],
          );
        });
  }
  Future<bool> updateDialog(BuildContext context, selectedDoc, data) async {
    return showDialog(
      useSafeArea: true,
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SafeArea(
            child: AlertDialog(
              title: Text(
                'Update Data',
                style: TextStyle(fontSize: 15),
              ),
              content: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Enter car Price'),
                    initialValue: data['Price'],
                    onChanged: (value) {
                      car.Price = value;
                    },
                  ),
                ],
              ),
              actions: <Widget>[
                RoundedButton(
                  title: 'Update',
                  colour: Colors.blue,
                  onPressed: () {
                    Map<String, dynamic> carData = {
                      'Price':car.Price
                    };
                    FirebaseFirestore.instance.collection('Cars').doc(selectedDoc).update(carData);
                    dialogTrigger(context);
                    initState();
                    //Navigator.of(context).pop();
                  }
                  )
              ],
            ),
          );
        });
  }
  Future<bool> dialogTrigger(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Job Done',
              style: TextStyle(fontSize: 15),
            ),
            content: Text('Added'),
            actions: <Widget>[
              RoundedButton(
              title: 'Alright',
                colour: Colors.blue,
                onPressed: (){
                  Navigator.of(context).pop();
                },
          )
            ],
          );
        });
  }
  Widget _carList() {
    return StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Cars').snapshots(),
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                padding: EdgeInsets.all(5.0),
                itemBuilder: (context, i) {
                  DocumentSnapshot carinfo = snapshot.data.docs[i];
                  return new ListTile(
                    title: Text(carinfo['Name'] +" "+carinfo['Model']),
                    subtitle: Text(carinfo['Price']),
                    onTap: (){
                      updateDialog(context, snapshot.data.docs[i].id, snapshot.data.docs[i]);
                    },
                    onLongPress: () {
                      DatabaseService().deletedata(snapshot.data.docs[i].id);
                    },
                  );
                });
          });

  }
}



