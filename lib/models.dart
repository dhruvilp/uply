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
///               PEOPLE
///=======================================

@JsonSerializable(nullable: false)
class Address {
  final String street;
  final String city;
  final String state;
  final String zip;
  final String country;

  Address(this.street, this.city, this.state, this.zip, this.country);

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable(nullable: false)
class Education {
  final String degree;
  final String school;
  final String major;
  final String graduationDate;

  Education(this.degree, this.school, this.major, this.graduationDate);

  factory Education.fromJson(Map<String, dynamic> json) => _$EducationFromJson(json);
  Map<String, dynamic> toJson() => _$EducationToJson(this);
}

@JsonSerializable(nullable: false)
class Skill {
  final String name;
  final String level;

  Skill(this.name, this.level);

  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);
  Map<String, dynamic> toJson() => _$SkillToJson(this);
}

@JsonSerializable(nullable: false)
class People {
  final int id;
  final String email;
  final String firstName;
  final String middleName;
  final String lastName;
  final Address address;
  final List<Education> education;
  final List<Skill> skills;

  People(this.id, this.email, this.firstName, this.middleName, this.lastName, this.address, this.education, this.skills);

  factory People.fromJson(Map<String, dynamic> json) => _$PeopleFromJson(json);
  Map<String, dynamic> toJson() => _$PeopleToJson(this);
}