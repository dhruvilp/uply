import 'package:flutter/material.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:uply/services.dart';
import 'package:uply/style.dart';
import 'package:uply/ui/pages/login.dart';
import 'package:uply/ui/widgets/UplySuccess.dart';
import 'package:uply/ui/widgets/UplyWarning.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final _kFirstNameCont = new TextEditingController();
  final _kLastNameCont = new TextEditingController();
  final _kEmailCont = new TextEditingController();
  final _kDegreeCont = new TextEditingController();
  final _kSchoolCont = new TextEditingController();
  final _kMajorCont = new TextEditingController();
  final _kGradDateCont = new TextEditingController();

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

    _onSignUpButtonPressed() async {
      if(_kFirstNameCont.text.isEmpty || _kLastNameCont.text.isEmpty || _kDegreeCont.text.isEmpty || _kEmailCont.text.isEmpty  || _kMajorCont.text.isEmpty  || _kGradDateCont.text.isEmpty || _kSchoolCont.text.isEmpty ){
        var error = 'Error:\n All the fields are required!';
        _dialog(error);
      }
      else {
        var newUser = await createUser(_kFirstNameCont.text, _kLastNameCont.text, _kEmailCont.text, _kDegreeCont.text, _kSchoolCont.text, _kMajorCont.text, _kGradDateCont.text);
        if(newUser != null){
          UplySuccess(body: 'Successfully created a user!');

          Navigator.pop(context);
        }
        else{
          _dialog('Something went wrong while creating a new user!');
        }
      }
    }

    Widget _newDataForm(BuildContext context){
      return KeyboardAvoider(
        child: Card(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: _formKey,
              autovalidate: true,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: new TextFormField(
                      autocorrect: true,
                      maxLines: null,
                      textInputAction: TextInputAction.done,
                      textCapitalization: TextCapitalization.sentences,
                      controller: _kFirstNameCont,
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                        hasFloatingPlaceholder: true,
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: new TextFormField(
                      autocorrect: true,
                      maxLines: null,
                      textInputAction: TextInputAction.done,
                      textCapitalization: TextCapitalization.sentences,
                      controller: _kLastNameCont,
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                        hasFloatingPlaceholder: true,
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: new TextFormField(
                      autocorrect: true,
                      maxLines: null,
                      textInputAction: TextInputAction.done,
                      textCapitalization: TextCapitalization.sentences,
                      controller: _kEmailCont,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hasFloatingPlaceholder: true,
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: new TextFormField(
                      autocorrect: true,
                      maxLines: null,
                      textInputAction: TextInputAction.done,
                      textCapitalization: TextCapitalization.sentences,
                      controller: _kDegreeCont,
                      decoration: const InputDecoration(
                        labelText: 'Degree',
                        hasFloatingPlaceholder: true,
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: new TextFormField(
                      autocorrect: true,
                      maxLines: null,
                      textInputAction: TextInputAction.done,
                      textCapitalization: TextCapitalization.sentences,
                      controller: _kSchoolCont,
                      decoration: const InputDecoration(
                        labelText: 'School',
                        hasFloatingPlaceholder: true,
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: new TextFormField(
                      autocorrect: true,
                      maxLines: null,
                      textInputAction: TextInputAction.done,
                      textCapitalization: TextCapitalization.sentences,
                      controller: _kMajorCont,
                      decoration: const InputDecoration(
                        labelText: 'Major',
                        hasFloatingPlaceholder: true,
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: new TextFormField(
                      autocorrect: true,
                      maxLines: null,
                      textInputAction: TextInputAction.done,
                      textCapitalization: TextCapitalization.sentences,
                      controller: _kGradDateCont,
                      decoration: const InputDecoration(
                        labelText: 'Grad Date',
                        hasFloatingPlaceholder: true,
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                    child: RaisedButton(
                      onPressed: () async {
                        _onSignUpButtonPressed();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      splashColor: white,
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: const BoxDecoration(
                          gradient: pink_gradient,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        child: Container(
                          constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                          height: 67.0,
                          alignment: Alignment.center,
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 25, color: white, fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      key: _scaffoldKey,
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
      body: _newDataForm(context),
    );
  }
}
