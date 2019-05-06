import 'dart:async';

import 'package:flight_ticket_app/blocs/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class HomeScreenBloc extends BlocBase {
  StreamController<bool> flightSelectedController = PublishSubject<bool>();

  Function(bool) get updateFlightSelection => flightSelectedController.sink.add;

  Stream<bool> get isFlightSelectedStream => flightSelectedController.stream;

  @override
  void dispose() {
    flightSelectedController.close();
  }
}
