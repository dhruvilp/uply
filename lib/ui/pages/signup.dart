import 'package:flutter/material.dart';
import 'package:uply/style.dart';
import 'package:uply/ui/pages/login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up', style: Theme.of(context).textTheme.title,),
        brightness: Brightness.light,
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: charcoal_light,),
          onPressed: (){
            Navigator.of(context).pushAndRemoveUntil(
              new MaterialPageRoute(builder: (BuildContext context) => Login()),
              ModalRoute.withName('/login'),
            );
          },
        ),
      ),
      body: Center(
        child: Container(
          child: Text('SignUp Page'),
        ),
      ),
    );
  }
}
