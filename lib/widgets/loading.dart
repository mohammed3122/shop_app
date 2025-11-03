import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, required this.isScreen});

  final bool isScreen;
  @override
  Widget build(BuildContext context) {
    return isScreen
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: Colors.black),
                SizedBox(height: 10),
                Text('Loading...', style: TextStyle(fontSize: 20)),
              ],
            ),
          )
        : CircularProgressIndicator(color: Colors.black);
  }
}
