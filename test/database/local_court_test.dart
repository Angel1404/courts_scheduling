import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Asumiendo que _localCourts es una instancia de la clase LocalCourts
import 'package:court_scheduling/data/data.dart';

class MockCourtModel implements CourtModel {
  @override
  // TODO: implement changeOfRain
  String get changeOfRain => throw UnimplementedError();

  @override
  CourtModel copyWith({int? id, String? nameCourt, String? date, String? nameUser, String? changeOfRain, String? createdAt}) {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  // TODO: implement createdAt
  String get createdAt => throw UnimplementedError();

  @override
  // TODO: implement date
  String get date => throw UnimplementedError();

  @override
  // TODO: implement id
  int get id => throw UnimplementedError();

  @override
  // TODO: implement nameCourt
  String get nameCourt => throw UnimplementedError();

  @override
  // TODO: implement nameUser
  String get nameUser => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

void main() {
  group('getCourts', () {
    test('should return sorted courts when create', () async {
      //Given
      final mockCourtModel = MockCourtModel();
      final localCourt = LocalCourts();

      //When

      //Then

      expect(
        await localCourt.create(mockCourtModel),
        BaseResponse(
          data: [
            CourtModel(id: 0, nameCourt: "nameCourt", date: "date", nameUser: "nameUser", changeOfRain: "changeOfRain", createdAt: "createdAt"),
          ],
        ),
      );
    });
  });
}
