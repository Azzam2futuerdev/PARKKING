// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  deleteData(docId) {
    FirebaseFirestore.instance
        .collection('CompleteProfile')
        .doc(docId)
        .delete()
        .catchError((e) {
      print(e);
    });
  }
  deletedata(docId){
    FirebaseFirestore.instance
        .collection('Cars')
        .doc(docId)
        .delete()
        .catchError((e) {
      print(e);
    });
  }
}

