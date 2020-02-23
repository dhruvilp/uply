// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Application _$ApplicationFromJson(Map<String, dynamic> json) {
  return Application(
    json['id'] as int,
    json['jobId'] as int,
    json['personId'] as int,
    json['status'] as String,
  );
}

Map<String, dynamic> _$ApplicationToJson(Application instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jobId': instance.jobId,
      'personId': instance.personId,
      'status': instance.status,
    };

Job _$JobFromJson(Map<String, dynamic> json) {
  return Job(
    json['id'] as int,
    json['title'] as String,
  );
}

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

CustomJob _$CustomJobFromJson(Map<String, dynamic> json) {
  return CustomJob(
    json['id'] as int,
    json['title'] as String,
    json['description'] as String,
    json['skills'] as List,
  );
}

Map<String, dynamic> _$CustomJobToJson(CustomJob instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'skills': instance.skills,
    };

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    json['street'] as String,
    json['city'] as String,
    json['state'] as String,
    json['zip'] as String,
    json['country'] as String,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'street': instance.street,
      'city': instance.city,
      'state': instance.state,
      'zip': instance.zip,
      'country': instance.country,
    };

Education _$EducationFromJson(Map<String, dynamic> json) {
  return Education(
    json['degree'] as String,
    json['school'] as String,
    json['major'] as String,
    json['graduationDate'] as String,
  );
}

Map<String, dynamic> _$EducationToJson(Education instance) => <String, dynamic>{
      'degree': instance.degree,
      'school': instance.school,
      'major': instance.major,
      'graduationDate': instance.graduationDate,
    };

Skill _$SkillFromJson(Map<String, dynamic> json) {
  return Skill(
    json['name'] as String,
    json['level'] as String,
  );
}

Map<String, dynamic> _$SkillToJson(Skill instance) => <String, dynamic>{
      'name': instance.name,
      'level': instance.level,
    };

People _$PeopleFromJson(Map<String, dynamic> json) {
  return People(
    json['id'] as int,
    json['email'] as String,
    json['firstName'] as String,
    json['middleName'] as String,
    json['lastName'] as String,
    Address.fromJson(json['address'] as Map<String, dynamic>),
    (json['education'] as List)
        .map((e) => Education.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['skills'] as List)
        .map((e) => Skill.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PeopleToJson(People instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'address': instance.address,
      'education': instance.education,
      'skills': instance.skills,
    };
