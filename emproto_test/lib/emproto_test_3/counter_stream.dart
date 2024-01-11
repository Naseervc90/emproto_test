import 'dart:async';

import 'package:flutter/material.dart';

class CounterStream extends StatefulWidget {
  @override
  _CounterStreamState createState() => _CounterStreamState();
}

class _CounterStreamState extends State<CounterStream> {
  late StreamController<int> _streamController;
  late Stream<int> _timerStream;
  late int _count;

  @override
  void initState() {
    super.initState();
    _count = 0;

    // Create a StreamController to handle the stream of counts
    _streamController = StreamController<int>();

    // Create a periodic timer that updates the stream every second
    _timerStream = Stream.periodic(const Duration(seconds: 1), (count) {
      _count++;
      _streamController.add(_count);
      return _count;
    });

    // Start the timer
    _timerStream.listen((count) {});
  }

  @override
  void dispose() {
    // Close the StreamController when the widget is disposed
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Timer App'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: _streamController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                'Count: ${snapshot.data}',
                style: TextStyle(fontSize: 24),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
