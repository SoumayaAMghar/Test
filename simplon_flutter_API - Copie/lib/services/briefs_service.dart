import 'dart:convert';

import 'package:myapp/models/api_response.dart';
import 'package:myapp/models/BriefBundle.dart';
import 'package:http/http.dart' as http;

class BriefsService {
  static const API = 'http://172.23.128.1:7070';
  //static const headers = {'apiKey': '08d771e2-7c49-1789-0eaa-32aff09f1471'};

  Future<APIResponse<List<BriefBundle>>> getBriefsList() {
    return http.get(Uri.parse(API+'/brief/all')).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        var briefs = <BriefBundle>[];
        for (var item in jsonData) {
          print(item);
          final brief = BriefBundle(
            id: item['id'],
            title: item['title'],
            description: item['description'],
            imageSrc: item['imageSrc'],
            //color: item['color']
          );
          briefs.add(brief);
        }
        return APIResponse<List<BriefBundle>>(data: briefs);
      }
      return APIResponse<List<BriefBundle>>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) => APIResponse<List<BriefBundle>>(error: true, errorMessage: 'An error occured'));
  }
}
