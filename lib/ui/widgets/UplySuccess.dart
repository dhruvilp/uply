import 'package:flutter/material.dart';

import '../../style.dart';

class UplySuccess extends StatelessWidget {
  final String body;

  const UplySuccess({Key key, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      backgroundColor: white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: Icon(
        Icons.check_circle,
        color: green,
        size: 80.0,
      ),
      content: Text(
        body,
        style: TextStyle(
          fontSize: 18,
          color: pink,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          splashColor: white,
          height: 40.0,
          color: pink,
          onPressed: () {
            Navigator.pop(context, true);
          },
          padding: const EdgeInsets.all(14.0),
          child: const Text(
            'OK',
            style: TextStyle(
                fontSize: 16, color: white, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
