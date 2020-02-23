import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uply/ui/widgets/UplySuccess.dart';

import '../../style.dart';

class JobSuggestions extends StatefulWidget {
  @override
  _JobSuggestionsState createState() => _JobSuggestionsState();
}

class _JobSuggestionsState extends State<JobSuggestions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: semi_transparent,
      body: Container(
//        decoration: BoxDecoration(
//          borderRadius: BorderRadius.circular(15.0),
//          color: semi_transparent,
//        ),
        color: semi_transparent,
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle
                .of(context)
                .loadString("mock_data/jobs.json"),
            builder: (context, snapshot) {
              var response = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return JobCard(
                    index: index,
                    title: response[index]['title'],
                    description: response[index]['description'],
                    skills: response[index]['skills'],
                    degree: response[index]['degree'],
                  );
                },
                itemCount: response == null ? 0 : response.length,
              );
            },
          ),
        ),
      ),
    );
  }
}

class JobCard extends StatefulWidget {

  @required final int index;
  @required final String title;
  @required final String description;
  @required final List skills;
  @required final String degree;

  const JobCard({Key key, this.index, this.title, this.description, this.skills, this.degree}) : super(key: key);

  @override
  _JobCardState createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  @override
  Widget build(BuildContext context) {

    void _dialog(String body) async {
      switch (await showDialog(
        context: context,
        builder: (BuildContext context, {barrierDismissible: false}) {
          return new UplySuccess(body: body);
        },
      )) {}
    }

    _onApplyForJobButtonPressed() async {
      _dialog('Successfully applied!');
    }

    return Card(
      margin: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(widget.title, style: Theme.of(context).textTheme.title,),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(widget.description, style: Theme.of(context).textTheme.body2,),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(widget.degree, style: Theme.of(context).textTheme.subhead,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              direction: Axis.horizontal,
              children: widget.skills.map((dynamic skill) => Chip(
                label: Text(skill),
              )).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            child: RaisedButton(
              onPressed: () async {
                _onApplyForJobButtonPressed();
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
                  constraints: const BoxConstraints(minWidth: 60.0, minHeight: 35.0),
                  height: 50.0,
                  alignment: Alignment.center,
                  child: const Text(
                    'Interested',
                    style: TextStyle(fontSize: 20, color: white, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15.0,),
        ],
      ),
    );
  }
}

