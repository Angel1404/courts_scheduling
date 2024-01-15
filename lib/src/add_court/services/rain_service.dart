import 'dart:convert';

import 'package:court_scheduling/data/data.dart';
import 'package:court_scheduling/src/ui/utils/formats.dart';
import 'package:http/http.dart' as http;

class RainService {
  Future<BaseResponse> get({required String date}) async {
    final dateFormat = formatDate(DateTime.parse(date), format: "y-MM-dd");
    final url = Uri.parse(
        "https://api.open-meteo.com/v1/forecast?latitude=10.373178&longitude=-75.497205&current=rain&hourly=temperature_2m,relative_humidity_2m,rain&timezone=auto&start_date=$dateFormat&end_date=$dateFormat&time_mode=time_interval");
    final response = await http.get(url);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return BaseResponse(data: (jsonDecode(response.body) as Map));
    }

    return BaseResponse(data: null, isError: true, errorText: response.body);
  }
}
