import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/rendering.dart';

// ignore: camel_case_types
class audio_player extends StatefulWidget {
  const audio_player({super.key});

  @override
  State<audio_player> createState() => _audio_playerState();
}

// ignore: camel_case_types
class _audio_playerState extends State<audio_player> {
  // ignore: prefer_const_constructors
  final player = audio_player();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  @override
  void dispose() {
    super.dispose();
  }

  String? time(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [if (duration.inHours > 0) hours, minutes, seconds].join('.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/virat.jpg',
              width: 100,
            ),
            Slider(
              value: position.inSeconds.toDouble(),
              onChanged: (value) async {},
            )
          ],
        ),
      ),
    );
  }
}
