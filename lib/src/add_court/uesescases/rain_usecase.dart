import 'package:court_scheduling/data/models/base_response.dart';
import 'package:court_scheduling/data/models/rain_model.dart';
import 'package:court_scheduling/src/add_court/add_court.dart';

class RainUseCase extends RainI {
  final RainI _rainImplement;

  RainUseCase({required RainI rainImplement}) : _rainImplement = rainImplement;
  @override
  Future<BaseResponse<RainModel>> get(String date) {
    return _rainImplement.get(date);
  }
}
