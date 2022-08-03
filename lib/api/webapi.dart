import 'dart:convert';
import 'package:http/http.dart' as http;

String webApiUrl = 'https://youtubecategory.com/corsairapi.php';

Future<dynamic> getResponse() async {
  dynamic result;
  http.Response response;
  // try {
  response = http.Response('', 404);
  while (response.statusCode == 404) {
    response = await http.get(Uri.parse(webApiUrl)).timeout(const Duration(seconds: 6)).onError((error, stackTrace) {
      return Future.error(AResult(result: 103, message: 'Network error'));
    });
  }
  if (response.statusCode == 200) {
    if (response.body.isNotEmpty) {
      Map parseJson = json.decode(response.body);
      print('RESPONSE ::: $parseJson');
      if (parseJson['message'] == "Success") {
        result = (parseJson['data']);
      } else {
        return Future.error(AResult(result: 103, message: parseJson['message']));
      }
    } else {
      return Future.error(AResult(result: 103, message: 'body is empty'));
    }
  } else {
    return Future.error(AResult(result: 103, message: response.body));
  }
  return result;
}

Future<List<Score>> getScoreData() async {
  List<Score> scoreList = [];
  await getResponse().then((value) {
    scoreList = (value as List).map((item) => Score.fromJson(item)).toList();
  });
  return scoreList;
}

Future setScoreData(String name, int point) async {
  http.Response response;
  response = await http
      .post(
        Uri.parse(webApiUrl),
        body: {'name': '$name', 'point': '$point'},
      )
      .timeout(const Duration(seconds: 6))
      .onError((error, stackTrace) {
        return Future.error(AResult(result: 103, message: 'Network error'));
      });
  if (response.statusCode == 200) {
    if (response.body.isNotEmpty) {
      Map parseJson = json.decode(response.body);
      print('RESPONSE ::: $parseJson');
      if (parseJson['message'] == "Success") {
        print('success DATAAAAAAAAAAAAAAAAA');
      } else {
        return Future.error(AResult(result: 103, message: parseJson['message']));
      }
    } else {
      return Future.error(AResult(result: 103, message: 'body is empty'));
    }
  } else {
    return Future.error(AResult(result: 103, message: response.body));
  }
}

AResult aResultFromJson(String str) => AResult.fromJson(json.decode(str));
String aResultToJson(AResult data) => json.encode(data.toJson());

class AResult {
  AResult({
    this.result = 0,
    this.message = '',
  });

  late int result;
  late String message;

  factory AResult.fromJson(Map<String, dynamic> json) => AResult(
        result: json['result'],
        message: json['message'],
      );

  Map<String, dynamic> toJson() => {
        'result': result,
        'message': message,
      };
}

class Score {
  String? id;
  String? name;
  int? point;
  String? gamecount;
  String? updateAt;

  Score({this.id, this.name, this.point, this.gamecount, this.updateAt});

  Score.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    point = int.parse(json['point']);
    gamecount = json['gamecount'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['point'] = point;
    data['gamecount'] = gamecount;
    data['update_at'] = updateAt;
    return data;
  }
}
