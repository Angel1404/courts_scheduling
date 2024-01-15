import '../../../data/data.dart';
import '../add_court.dart';

class RainImplement extends RainI {
  final RainService _rainService;

  RainImplement({required RainService rainService}) : _rainService = rainService;

  @override
  Future<BaseResponse<RainModel>> get(String date) async {
    try {
      final response = await _rainService.get(date: date);

      if (response.isError) {
        return BaseResponse(errorText: response.errorText, isError: true);
      }

      return BaseResponse(data: RainModel.fromJson(response.data));
    } catch (e) {
      return BaseResponse(errorText: e.toString(), isError: true);
    }
  }
}
