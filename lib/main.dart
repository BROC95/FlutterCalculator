import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My calculator',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'My calculator with flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Operacion { sumar, restar, mul, div }

class _MyHomePageState extends State<MyHomePage> {
  int _total = 0;
  // int _suma = 0;
  // int num1 = 0;

  final _num1 = TextEditingController();
  final _num2 = TextEditingController();

  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _suma++;
  //   });
  // }
  //   void _sumar() {
  //   setState(() {
  //     _suma = int.parse(_num1.text) + int.parse(_num2.text);
  //   });
  // }

  void _calcular(Enum operacion) {
    setState(() {
      switch (operacion) {
        case Operacion.sumar:
          _total = int.parse(_num1.text) + int.parse(_num2.text);
          break;
        case Operacion.restar:
          _total = int.parse(_num1.text) - int.parse(_num2.text);
          break;
        case Operacion.mul:
          _total = int.parse(_num1.text) * int.parse(_num2.text);
          break;
        case Operacion.div:
          _total = int.parse(_num1.text) ~/ int.parse(_num2.text);
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),

      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                TextFormField(
                  controller: _num1,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Input the first number'),
                ),
                const SizedBox(
                  height: 14,
                ),
                TextFormField(
                  controller: _num2,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Input the second number'),
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    // icon: const Icon(Icons.calculate, size: 20),
                    onPressed: () {
                      _calcular(Operacion.sumar);
                    },
                    // label:  const Text('+'),
                    child: const Text('+'),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    // icon: const Icon(Icons.calculate, size: 20),
                    onPressed: () {
                      _calcular(Operacion.restar);
                    },
                    // label:  const Text('+'),
                    child: const Text('-'),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    // icon: const Icon(Icons.calculate, size: 20),
                    onPressed: () {
                      _calcular(Operacion.mul);
                    },
                    // label:  const Text('+'),
                    child: const Text('*'),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    // icon: const Icon(Icons.calculate, size: 20),
                    onPressed: () {
                      _calcular(Operacion.div);
                    },
                    // label:  const Text('+'),
                    child: const Text('/'),
                  ),
                  const SizedBox(
                    width: 16,
                  )
                ]),
                Text(
                  'Total es $_total',
                  // style: Theme.of(context).textTheme.headline4,
                  style: const TextStyle(
                      fontSize: 20, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          )),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
