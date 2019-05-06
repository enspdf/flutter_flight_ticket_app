import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flight_ticket_app/api/services.dart';
import 'package:flight_ticket_app/blocs/bloc_provider.dart';

class FlightListBloc implements BlocBase {
  StreamController<QuerySnapshot> dealsController =
      StreamController<QuerySnapshot>();

  StreamSink<QuerySnapshot> get dealSink => dealsController.sink;

  Stream<QuerySnapshot> get dealsStream => dealsController.stream;

  FlightListBloc(FirebaseService firebaseService) {
    firebaseService.getDeals().listen((event) {
      dealSink.add(event);
    });
  }

  @override
  void dispose() {
    dealsController.close();
  }
}
