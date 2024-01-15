import 'dart:convert';

import 'package:court_scheduling/data/data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalCourts {
  final _secureStorage = const FlutterSecureStorage();

  Future<BaseResponse<List<CourtModel>>> create(CourtModel courtModel) async {
    try {
      final getRains = (await get()).data;
      getRains!.add(courtModel);
      await _secureStorage.write(key: courtKey, value: json.encode(getRains.map((e) => e.toJson()).toList()));
      return BaseResponse(data: getRains);
    } catch (e) {
      return BaseResponse(isError: true, errorText: e.toString());
    }
  }

  Future<BaseResponse<List<CourtModel>>> get() async {
    try {
      final data = await _secureStorage.read(key: courtKey);
      return BaseResponse(data: data == null ? [] : courtModelListFromJson(data));
    } catch (e) {
      return BaseResponse(isError: true, errorText: e.toString());
    }
  }

  Future<BaseResponse> delete(int idCourt) async {
    final getRains = (await get()).data;
    if (getRains != null && getRains.length == 1) {
      _secureStorage.delete(key: courtKey);
    } else {
      getRains!.removeWhere((element) => element.id == idCourt);
      await _secureStorage.write(key: courtKey, value: json.encode(getRains.map((e) => e.toJson()).toList()));
    }
    return BaseResponse();
  }

  deleteAll() async {
    _secureStorage.deleteAll();
  }
}
