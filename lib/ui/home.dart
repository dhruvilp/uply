import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'package:uply/models.dart';
import 'package:uply/ui/pages/login.dart';
import 'package:uply/ui/pages/profile.dart';
import 'package:uply/ui/widgets/WidgetProjection.dart';

import '../style.dart';

class Home extends StatefulWidget {

  final People person;

  const Home({Key key, this.person}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: Theme.of(context).textTheme.title,),
        brightness: Brightness.light,
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(GroovinMaterialIcons.logout, color: Theme.of(context).primaryColor),
            color: Theme.of(context).scaffoldBackgroundColor,
            splashColor: pink,
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  new MaterialPageRoute(builder: (BuildContext context) => Login()),
                  ModalRoute.withName('/login'));
            },
          ),
        ],
      ),
      body: Profile(person: widget.person,),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => WidgetProjectionPage(),
            ),
          );
        },
        child: Center(
          child: Icon(
            GroovinMaterialIcons.augmented_reality,
            size: 35.0,
          ),
        ),
        elevation: 4.0,
        splashColor: white,
        isExtended: false,
        backgroundColor: Theme.of(context).accentColor,
      ),
    );
  }
}
