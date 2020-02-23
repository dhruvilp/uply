import 'package:flutter/material.dart';
import 'package:uply/services.dart';
import 'package:uply/ui/home.dart';
import 'package:uply/ui/pages/signup.dart';
import 'package:uply/ui/widgets/UplyWarning.dart';

import '../../defaults.dart';
import '../../style.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    void _dialog(String body) async {
      switch (await showDialog(
        context: context,
        builder: (BuildContext context, {barrierDismissible: false}) {
          return new UplyWarning(body: body);
        },
      )) {}
    }

    _onLoginButtonPressed() async {
      if(_usernameController.text.isEmpty){
        var error = 'Error:\n Missing username!';
        _dialog(error);
      }
      else {
        var kPerson = await fetchPersonById(_usernameController.text);
        _usernameController.text = null;
        if(kPerson != null){
          Navigator.of(context).pushAndRemoveUntil(
            new MaterialPageRoute(builder: (BuildContext context) => Home(person: kPerson,)),
            ModalRoute.withName('/home'),
          );
        }
        else{
          Navigator.of(context).pushAndRemoveUntil(
            new MaterialPageRoute(builder: (BuildContext context) => SignUp()),
            ModalRoute.withName('/signup'),
          );
        }
      }
    }

    Widget loginForm() {
      return ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(25.0),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 30.0, bottom: 10.0),
            child: Image.asset(
              kAppIconTransparent,
              height: 150.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Text(
              kAppTitle,
              style: Theme.of(context).textTheme.display2,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 75.0),
            child: Text(
              kAppSubTitle,
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              style: TextStyle(
                  fontSize: 20, color: Theme.of(context).primaryColor),
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username *',
                fillColor: Theme.of(context).primaryColor,
                hasFloatingPlaceholder: true,
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: cyan, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            child: RaisedButton(
              onPressed: () async {
                _onLoginButtonPressed();
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              splashColor: white,
              padding: EdgeInsets.all(0.0),
              child: Ink(
                decoration: const BoxDecoration(
                  gradient: cyan_gradient,
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                child: Container(
                  constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                  height: 67.0,
                  alignment: Alignment.center,
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 25, color: white, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SignUp(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'Signup?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                  color: Theme.of(context).primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      );
    }
    return Scaffold(
      body: loginForm(),
    );
  }
}
