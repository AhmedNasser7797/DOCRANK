import 'package:flutter/material.dart';

class Loading {
  loading(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.blue),
                  strokeWidth: 4.0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
