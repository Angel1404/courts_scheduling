import 'package:court_scheduling/data/data.dart';

abstract class RainI {
  Future<BaseResponse<RainModel>> get(String date);
}
