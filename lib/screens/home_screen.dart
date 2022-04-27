import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String headerTitle = "Hola Mundo...";
  final String firstRowText = "Bienvenido a tu app de contador";
  int counter = 0;

  void increment() => setState(() {
        counter++;
      });
  void decrement() => setState(() {
        if (counter > 0) {
          counter--;
        }
      });
  void restart() => setState(() {
        if (counter != 0) {
          counter = 0;
        }
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(headerTitle), backgroundColor: Colors.brown[700]),
      body: HomePageBody(
        counter: counter,
        firstRowText: firstRowText,
      ),
      floatingActionButton: HomePageButtons(
        decrement: decrement,
        increment: increment,
        restart: restart,
      ),
    );
  }
}

class HomePageBody extends StatelessWidget {
  final int counter;
  final String firstRowText;

  const HomePageBody(
      {Key? key, required this.counter, required this.firstRowText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(firstRowText, style: const TextStyle(fontSize: 19)),
        Text("Has hecho click $counter veces",
            style: TextStyle(fontSize: 22, color: Colors.brown[700]))
      ],
    ));
  }
}

class HomePageButtons extends StatelessWidget {
  final Function increment;
  final Function decrement;
  final Function restart;

  const HomePageButtons(
      {Key? key,
      required this.increment,
      required this.decrement,
      required this.restart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      FloatingActionButton(
        child: const Text("-",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 40)),
        onPressed: () => decrement(),
        backgroundColor: Colors.brown[700],
      ),
      FloatingActionButton(
        child: const Icon(
          Icons.restart_alt,
          size: 32,
        ),
        onPressed: () => restart(),
        backgroundColor: Colors.brown[700],
      ),
      FloatingActionButton(
        child: const Icon(
          Icons.add_circle_outline_outlined,
          size: 32,
        ),
        onPressed: () => increment(),
        backgroundColor: Colors.brown[700],
      )
    ]);
  }
}
