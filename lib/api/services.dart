import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  FirebaseService() {
    initFirebase();
  }

  initFirebase() async {
    final FirebaseApp app = await FirebaseApp.configure(
        name: 'flight-app-mock',
        options: Platform.isIOS
            ? const FirebaseOptions(
                googleAppID: '1:963416107699:ios:bbe13d4e61356956',
                gcmSenderID: '963416107699',
                databaseURL: 'https://flight-app-mock-84869.firebaseio.com/',
              )
            : const FirebaseOptions(
                googleAppID: '1:963416107699:android:dbfe8b5554a51f10',
                apiKey: 'AIzaSyCfglVyKGKrp6gOMSZWrRkeli2bZN9JdL8',
                databaseURL: 'https://flight-app-mock-84869.firebaseio.com/',
              ));
  }

  Stream<QuerySnapshot> getLocations() {
    return Firestore.instance.collection('locations').snapshots();
  }

  Stream<QuerySnapshot> getCities() {
    return Firestore.instance
        .collection('cities')
        .orderBy('newPrice')
        .snapshots();
  }

  Stream<QuerySnapshot> getDeals() {
    return Firestore.instance.collection('deals').snapshots();
  }
}
