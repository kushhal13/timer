import 'package:flutter/material.dart';
import 'package:stopwatch/widgets/timer_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StopWatch(title: 'Flutter Demo Home Page'),
    );
  }
}

class StopWatch extends StatefulWidget {
  const StopWatch({super.key, required this.title});

  final String title;

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimerCountDown(),
          ],
        ));
  }
}
