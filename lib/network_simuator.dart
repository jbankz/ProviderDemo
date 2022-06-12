import 'dart:math';

/// This class will serve as a network simulator
/// this will cause some delayer for 5 seconds then returns an integer number randomly

class NetworkSimulator {
  final _rand = Random();

  Future<int> returnNumber() async {
    /// simulate a delay for 5sec
    await Future.delayed(const Duration(seconds: 2));
    return _rand.nextInt(100);
  }
}
