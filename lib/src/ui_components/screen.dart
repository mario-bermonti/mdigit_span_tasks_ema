import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final Widget children;

  final AppBar? appBar;

  const Screen({super.key, required this.children, this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              children,
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[300],
    );
  }
}
