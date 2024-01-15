import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/data.dart';
import 'add_court.dart';

final listCourts = ["Seleccione una cancha", "Cancha A", "Cancha B", "Cancha C"];

class AddCourtController extends StateNotifier<AddCourtState> {
  AddCourtController(this._rainImplement, this._localCourts)
      : super(
          AddCourtState(
            date: "",
            chanceOfRain: "",
            courtSeleted: "Seleccione una cancha",
            dateComplete: "Seleccione la fecha",
          ),
        );

  final RainI _rainImplement;
  final LocalCourts _localCourts;

  Future<RainModel?> getRain() async {
    double sum = 0;
    final response = await _rainImplement.get(state.date);
    if (!response.isError) {
      for (var i = 0; i < response.data!.hourly.rain.length; i++) {
        sum += response.data!.hourly.temperature2M[i];
      }
      state = state.copyWith(rainModel: response.data, chanceOfRain: (sum / 100).toString());
      return response.data;
    }
    return null;
  }

  setDate(String date, String dateComplete) {
    state = state.copyWith(date: date, dateComplete: dateComplete);
  }

  setCourt(String courtSeleted) {
    state = state.copyWith(courtSeleted: courtSeleted);
  }

  Future<BaseResponse> createCourtScheduling(String nameUser) async {
    if (state.date == "Seleccione la fecha" || nameUser.isEmpty || state.courtSeleted == "Seleccione una cancha") {
      return BaseResponse(isError: true, errorText: "Los campos con *, Son requeridos");
    }

    final courtModel = CourtModel(
      id: Random().nextInt(10000),
      nameCourt: state.courtSeleted,
      date: state.date,
      nameUser: nameUser,
      changeOfRain: state.chanceOfRain,
      createdAt: DateTime.now().toString(),
    );
    final response = await _localCourts.create(courtModel);
    final courtDateThree = response.data!.where((element) => element.date == state.date && element.nameCourt == state.courtSeleted);
    if (courtDateThree.length >= 3) {
      return BaseResponse(isError: true, errorText: "Ya no hay disponibilidad de agendamiento para la fecha: ${state.date}");
    }
    return response;
  }
}

class AddCourtState {
  final String date;
  final String dateComplete;
  final RainModel? rainModel;
  final String chanceOfRain;
  final String courtSeleted;

  AddCourtState({
    required this.date,
    required this.dateComplete,
    this.rainModel,
    required this.chanceOfRain,
    required this.courtSeleted,
  });

  AddCourtState copyWith({String? date, RainModel? rainModel, String? chanceOfRain, String? courtSeleted, String? dateComplete}) {
    return AddCourtState(
      dateComplete: dateComplete ?? this.dateComplete,
      courtSeleted: courtSeleted ?? this.courtSeleted,
      date: date ?? this.date,
      rainModel: rainModel ?? this.rainModel,
      chanceOfRain: chanceOfRain ?? this.chanceOfRain,
    );
  }
}
