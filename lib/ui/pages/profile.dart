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

  TextStyle _kStyle = TextStyle(fontSize: 18.0, color: grey_mid, fontWeight: FontWeight.w600,);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10.0),
      children: <Widget>[
        ListTile(
          leading: Text('First Name', style: Theme.of(context).textTheme.subhead,),
          title:  Text(widget.person.firstName, style: _kStyle),
        ),
        ListTile(
          leading: Text('Last Name', style: Theme.of(context).textTheme.subhead,),
          title:  Text(widget.person.lastName, style: _kStyle,),
        ),
        ListTile(
          leading: Text('Email', style: Theme.of(context).textTheme.subhead,),
          title:  Text(widget.person.email, style: _kStyle,),
        ),
        ListTile(
          leading: Text('Address', style: Theme.of(context).textTheme.subhead, maxLines: null,),
          title:  Text('${widget.person.address.street}, ${widget.person.address.city}, ${widget.person.address.state}, ${widget.person.address.zip}, ${widget.person.address.country}', style: _kStyle,),
        ),
        ListTile(
          leading: Text('Degree', style: Theme.of(context).textTheme.subhead,),
          title:  Text(widget.person.education.first.degree, style: _kStyle,),
        ),
        ListTile(
          leading: Text('School', style: Theme.of(context).textTheme.subhead,),
          title:  Text(widget.person.education.first.school, style: _kStyle,),
        ),
        ListTile(
          leading: Text('Major', style: Theme.of(context).textTheme.subhead,),
          title:  Text(widget.person.education.first.major, style: _kStyle,),
        ),
        ListTile(
          leading: Text('Grad Date', style: Theme.of(context).textTheme.subhead,),
          title:  Text(widget.person.education.first.graduationDate, style: _kStyle,),
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
