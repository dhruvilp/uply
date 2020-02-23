import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uply/models.dart';
import 'package:uply/secrets.dart';
import 'package:uply/ui/widgets/exceptions.dart';

import 'defaults.dart';


final client = new http.Client();
final kHeader = {"Content-Type": "application/json"};

///========================================================
///                     HTTP Requests
///========================================================

Future<http.Response> getRequest(String endPoint, dynamic kHeaders) {
  return client.get(BASE_URL + endPoint, headers: kHeaders)
      .timeout(const Duration(seconds: 10));
}

Future<http.Response> postRequest(String endPoint, dynamic kHeaders, dynamic kBody) async {
  var encodedBody = jsonEncode(kBody);
  var result = await client.post(BASE_URL + endPoint, headers: kHeaders, body: encodedBody)
      .timeout(const Duration(seconds: 10));
  return result;
}

Future<http.Response> putRequest(String endPoint, dynamic kHeaders, dynamic kBody) async {
  var encodedBody = jsonEncode(kBody);
  var result = await client.post(BASE_URL + endPoint, headers: kHeaders, body: encodedBody)
      .timeout(const Duration(seconds: 10));
  return result;
}


///========================================================
///                   FETCHING FUNCTIONS
///========================================================

/// GET Request
Future<Application> fetchApplications() async {
  var response = await getRequest(
    "/applications",
    {
      "Content-Type": "application/json",
      "Authorization": "Bearer $API_KEY"
    },
  );
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return Application.fromJson(data);
  } else {
    print('Something went wrong!');
  }
}

Future<Job> fetchJobById(int kJobId) async {
  var response = await getRequest(
    "/jobs/$kJobId",
    {
      "Content-Type": "application/json",
      "Authorization": "Bearer $API_KEY"
    },
  );
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return Job.fromJson(data);
  } else {
    print('Something went wrong!');
  }
}
Future<People> fetchPersonById(String kPersonId) async {
  var response = await getRequest(
    "/people/$kPersonId",
    {
      "Content-Type": "application/json",
      "Authorization": "Bearer $API_KEY"
    },
  );
  if (response.statusCode == 200) {
    return People.fromJson(jsonDecode(response.body));
  } else if(response.statusCode == 404){
    throw UserNotFound();
  }
}

/// POST request
Future<Application> createApplication(int kJobId, int kPersonId, String kStatus) async {
  var response = await postRequest(
    "/applications",
    {
      "Content-Type": "application/json",
      "Authorization": "Bearer $API_KEY"
    },
    {
      "jobId": kJobId,
      "personId": kPersonId,
      "status": kStatus
    }
  );
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return Application.fromJson(data);
  } else {
    print('Something went wrong!');
  }
}

/// POST request
Future<People> createUser(String nFirstName, String nLastName, String nEmail, String eduDegree,
    String eduSchool, String eduMajor, String eduGradDate) async {
  var response = await postRequest(
      "/people",
      {
        "Content-Type": "application/json",
        "Authorization": "Bearer $API_KEY"
      },
      {
        "email": nEmail,
        "firstName": nFirstName,
        "lastName": nLastName,
        "address": {
          "street": "123 50th Ave",
          "city": "NYC",
          "state": "New York",
          "zip": "49946",
          "country": "USA"
        },
        "education": [
          {
            "degree": eduDegree,
            "school": eduSchool,
            "major": eduMajor,
            "graduationDate": eduGradDate
          }
        ],
        "skills": [
          {
            "name": "Java",
            "level": "Expert"
          },
          {
            "name": "AWS",
            "level": "Beginner"
          },
          {
            "name": "Databases",
            "level": "Expert"
          }
        ]
      }
  );
  if (response.statusCode == 201) {
    return People.fromJson(jsonDecode(response.body));
  } else if(response.statusCode == 400) {
    throw BadRequest();
  } else if(response.statusCode == 404) {
    throw CompanyNotFound();
  } else {
    throw SomethingWentWrong();
  }
}
