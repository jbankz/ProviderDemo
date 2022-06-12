import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/demo_provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CounterProvider())],
      child: MaterialApp(
        title: 'Provider Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Push the button to generate a random number',
            ),
            Consumer<CounterProvider>(
              builder: (_, counter, __) {
                if (counter.counterEnum == CounterEnum.busy) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (counter.counterEnum == CounterEnum.failed) {
                  return Text('${counter.index} is an Odd number',
                      style: const TextStyle(color: Colors.red, fontSize: 34));
                }
                if (counter.counterEnum == CounterEnum.success) {
                  return Text(
                    '${counter.index} is an Even number',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            context.read<CounterProvider>().generateRandomNumbers(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
