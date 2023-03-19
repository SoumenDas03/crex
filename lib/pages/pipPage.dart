import 'dart:math';

import 'package:floating/floating.dart';
import 'package:flutter/material.dart';

class pipPage extends StatefulWidget {
  const pipPage({Key? key, required this.teamName})
      : super(key: key);

  final String teamName;

  @override
  State<pipPage> createState() => _pipPageState();
}

class _pipPageState extends State<pipPage> with WidgetsBindingObserver {
  final floating = Floating();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    floating.dispose();
    super.dispose();
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState lifecycleState) {
  //   if (lifecycleState == AppLifecycleState.inactive) {
  //     floating.enable(aspectRatio: Rational.square());
  //   }
  // }

  Future<void> enablePip(BuildContext context) async {
    final rational = Rational.square();
    final screenSize =
        MediaQuery.of(context).size * MediaQuery.of(context).devicePixelRatio;

    final status = await floating.enable(
      aspectRatio: rational,
      sourceRectHint: Rectangle<int>(
        0,
        0,
        screenSize.width.toInt(),
        screenSize.width ~/ rational.aspectRatio,
      ),
    );
    debugPrint('PiP enabled? $status');
  }

  @override
  Widget build(BuildContext context) {
    enablePip(context);
    return PiPSwitcher(
        childWhenEnabled: Container(
          child: Text(widget.teamName),
        ),
        childWhenDisabled: Scaffold(
          body: Container(
            child: Center(child: CircularProgressIndicator()),
          ),
        ));
  }
}
