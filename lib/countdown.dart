import 'dart:async';

import 'package:flutter/material.dart';

class Countdownpage extends StatefulWidget {
  const Countdownpage({Key? key}) : super(key: key);

  @override
  State<Countdownpage> createState() => _CountdownpageState();
}

class _CountdownpageState extends State<Countdownpage> {
  Duration duration = Duration();
  late Timer timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  void addTime() {
    final addseconds = 1;
    setState(() {
      final seconds = duration.inSeconds + addseconds;
      duration = Duration(seconds: seconds);
    });
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(child: buildTime()),
      );

  buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Text('$hours:$minutes:$seconds');
  }
}
