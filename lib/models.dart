import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

///=======================================
///             APPLICATION
///=======================================

@JsonSerializable(nullable: false)
class Application {
  final int id;
  final int jobId;
  final int personId;
  final String status;

  Application(this.id, this.jobId, this.personId, this.status);

  factory Application.fromJson(Map<String, dynamic> json) => _$ApplicationFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicationToJson(this);
}


///=======================================
///                 Job
///=======================================

@JsonSerializable(nullable: false)
class Job {
  final int id;
  final String title;

  Job(this.id, this.title);

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
  Map<String, dynamic> toJson() => _$JobToJson(this);
}

@JsonSerializable(nullable: false)
class CustomJob {
  final int id;
  final String title;
  final String description;
  final List skills;

  CustomJob(this.id, this.title, this.description, this.skills);

  factory CustomJob.fromJson(Map<String, dynamic> json) => _$CustomJobFromJson(json);
  Map<String, dynamic> toJson() => _$CustomJobToJson(this);
}


///=======================================
///             APPLICATION
///=======================================

@JsonSerializable(nullable: false)
class People {
  final int id;
  final int jobId;
  final int personId;

  People(this.id, this.jobId, this.personId, this.status);

  factory People.fromJson(Map<String, dynamic> json) => _$PeopleFromJson(json);
  Map<String, dynamic> toJson() => _$PeopleToJson(this);
}