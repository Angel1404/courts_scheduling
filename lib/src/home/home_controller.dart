import 'package:court_scheduling/data/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeController extends StateNotifier<HomeState> {
  HomeController(this._localCourts) : super(HomeState(courts: []));

  final LocalCourts _localCourts;

  getCourts() async {
    state = state.copyWith(isLoadingCourts: true);

    final dataCourts = (await _localCourts.get()).data;

    dataCourts!.sort((a, b) => a.date.compareTo(b.date));

    state = state.copyWith(courts: dataCourts, isLoadingCourts: false);
  }

  deleteCourt(int idCourt) async {
    await _localCourts.delete(idCourt);
    await getCourts();
  }
}

class HomeState {
  final List<CourtModel> courts;
  final bool isLoadingCourts;

  HomeState({
    required this.courts,
    this.isLoadingCourts = false,
  });

  HomeState copyWith({List<CourtModel>? courts, bool? isLoadingCourts}) => HomeState(
        courts: courts ?? this.courts,
        isLoadingCourts: isLoadingCourts ?? this.isLoadingCourts,
      );
}
