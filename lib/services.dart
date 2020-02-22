import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:uply/example.secrets.dart';
import 'package:uply/models.dart';

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
Future<Application> fetchApplications(int id) async {
  var response = await getRequest(
    "/applications/"+ id,
    {
      "Content-Type": "application/json",
      HttpHeaders.authorizationHeader: API_KEY
    },
  );
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return Application.fromJson(data);
  } else {
    print('Something went wrong!');
  }
}
Future<Application> fetchApplications(int kJobId) async {
  var response = await getRequest(
    "/applications"+ kJobID,
    {
      "Content-Type": "application/json",
      HttpHeaders.authorizationHeader: API_KEY
    },
  );
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return Application.fromJson(data);
  } else {
    print('Something went wrong!');
  }
}
Future<Application> fetchApplications(int personid) async {
  var response = await getRequest(
    "/applications/"+ personid,
    {
      "Content-Type": "application/json",
      HttpHeaders.authorizationHeader: API_KEY
    },
  );
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return Application.fromJson(data);
  } else {
    print('Something went wrong!');
  }
}

/// POST request
Future<Application> createApplication(int kJobId, int kPersonId, String kStatus) async {
  var response = await postRequest(
    "/applications",
    {
      "Content-Type": "application/json",
      HttpHeaders.authorizationHeader: API_KEY
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
