import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'network_simuator.dart';

/// possible states an app can be in
enum CounterEnum { idle, busy, success, failed }

class CounterProvider with ChangeNotifier {
  final _simulator = NetworkSimulator();

  CounterEnum _counterEnum = CounterEnum.idle;
  CounterEnum get counterEnum => _counterEnum;

  int _index = 0;
  int get index => _index;

  /// decide to show a loader or not
  void _showLoading(CounterEnum cE) {
    _counterEnum = cE;
    notifyListeners();
  }

  /// generate random number and this numbers are expected to be even numbers
  void generateRandomNumbers(BuildContext c) async {
    try {
      _showLoading(CounterEnum.busy);

      _index = await _simulator.returnNumber();

      if (_index % 2 == 0) {
        _counterEnum = CounterEnum.success;
      } else {
        _counterEnum = CounterEnum.failed;
      }
    } catch (e) {
      /// incase of an unintended error
      /// handle appropriately here
      _counterEnum = CounterEnum.failed;
    }
    _showLoading(_counterEnum);
  }
}
