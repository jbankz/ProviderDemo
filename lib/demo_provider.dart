import 'package:flutter/foundation.dart';

import 'network_simuator.dart';

class CounterProvider with ChangeNotifier {
  final _simulator = NetworkSimulator();

  bool _loading = false;
  bool get loading => _loading;

  int _index = 0;
  int get index => _index;

  /// decide to show a loader or not
  void _showLoading(bool show) {
    _loading = show;
    notifyListeners();
  }

  /// generate random number
  void generateRandomNumbers() async {
    _showLoading(true);

    _index = await _simulator.returnNumber();

    _showLoading(false);
  }
}
