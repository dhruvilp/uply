import 'package:flutter/material.dart';
import 'package:uply/models.dart';

import '../../style.dart';

class Profile extends StatefulWidget {

  final People person;

  const Profile({Key key, this.person}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  TextStyle _kStyle = TextStyle(fontSize: 18.0, color: pink, fontWeight: FontWeight.w700,);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10.0),
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text('First Name', style: Theme.of(context).textTheme.subhead,),
                    subtitle:  Text(widget.person.firstName, style: _kStyle),
                  ),
                  ListTile(
                    title: Text('Last Name', style: Theme.of(context).textTheme.subhead,),
                    subtitle:  Text(widget.person.lastName, style: _kStyle,),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Icon(Icons.person_pin, size: 80.0,),
              ),
            ),
          ],
        ),
        ListTile(
          title: Text('Email', style: Theme.of(context).textTheme.subhead,),
          subtitle:  Text(widget.person.email.toLowerCase(), style: _kStyle,),
        ),
        ListTile(
          title: Text('Address', style: Theme.of(context).textTheme.subhead, maxLines: null,),
          subtitle:  Text('${widget.person.address.street}, ${widget.person.address.city}, ${widget.person.address.state}, ${widget.person.address.zip}, ${widget.person.address.country}', style: _kStyle,),
        ),
        ListTile(
          title: Text('Degree/School', style: Theme.of(context).textTheme.subhead,),
          subtitle:  Text("${widget.person.education.first.degree} from ${widget.person.education.first.school}", style: _kStyle,),
        ),
        ListTile(
          title: Text('Major', style: Theme.of(context).textTheme.subhead,),
          subtitle:  Text(widget.person.education.first.major, style: _kStyle,),
        ),
        ListTile(
          title: Text('Grad Date', style: Theme.of(context).textTheme.subhead,),
          subtitle:  Text(widget.person.education.first.graduationDate, style: _kStyle,),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
          child: Text('Skills', style: Theme.of(context).textTheme.subhead,),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            direction: Axis.horizontal,
            children: widget.person.skills.map((Skill skill) => Chip(
              label: Text(skill.name),
            )).toList(),
          ),
        ),
      ],
    );
  }
}
