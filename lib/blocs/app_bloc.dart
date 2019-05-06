import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flight_ticket_app/api/services.dart';
import 'package:flight_ticket_app/blocs/bloc_provider.dart';
import 'package:flight_ticket_app/main.dart';
import 'package:rxdart/rxdart.dart';

class AppBloc extends BlocBase {
  FirebaseService firebaseService;

  String fromLocation, toLocation;
  List<String> locations = List();

  StreamController<String> fromLocationController = PublishSubject<String>();
  StreamController<String> toLocationController = PublishSubject<String>();
  StreamController<List<String>> locationsController =
      PublishSubject<List<String>>();
  StreamController<QuerySnapshot> citiesSnapshotController =
      StreamController<QuerySnapshot>();
  StreamController<int> citiesCounterController = StreamController<int>();

  StreamSink<String> get addFromLocation => fromLocationController.sink;

  Stream<String> get fromLocationStream => fromLocationController.stream;

  StreamSink<List<String>> get addLocationsList => locationsController.sink;

  Stream<List<String>> get locationsStream => locationsController.stream;

  StreamSink<String> get addToLocation => toLocationController.sink;

  Stream<String> get toLocationStream => toLocationController.stream;

  StreamSink<QuerySnapshot> get citiesSnapshot => citiesSnapshotController.sink;

  Stream<QuerySnapshot> get citiesSnapshotStream =>
      citiesSnapshotController.stream;

  StreamSink<int> get citiesCounter => citiesCounterController.sink;

  Stream<int> get citiesCounterStream => citiesCounterController.stream;

  AppBloc() {
    firebaseService = FirebaseService();
    fromLocationStream.listen((location) {
      fromLocation = location;
    });

    toLocationStream.listen((location) {
      toLocation = location;
    });

    firebaseService.getCities().listen((event) {
      citiesSnapshot.add(event);
      citiesCounter.add(event.documents.length);
    });

    firebaseService.getLocations().listen((event) {
      addLocations(event.documents);
    });
  }

  addLocations(List<DocumentSnapshot> snapshots) {
    locations?.clear();
    for (int i = 0; i < snapshots.length; i++) {
      final Location location = Location.fromSnapshot(snapshots[i]);
      locations.add(location.name);
    }

    addLocationsList.add(locations);
    addFromLocation.add(locations[0]);
  }

  @override
  void dispose() {
    fromLocationController.close();
    toLocationController.close();
    locationsController.close();
    citiesSnapshotController.close();
    citiesCounterController.close();
  }
}
