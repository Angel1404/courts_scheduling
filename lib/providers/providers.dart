import 'package:court_scheduling/src/src.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/data.dart';

//Database
final localCourtProvider = Provider<LocalCourts>((ref) => LocalCourts());

//Services
final rainServiceProvider = Provider<RainService>((ref) => RainService());

//Repo
final rainImpleProvider = Provider((ref) => RainImplement(rainService: ref.read(rainServiceProvider)));

//UsesCase
final rainUseCaseProvider = Provider<RainUseCase>((ref) => RainUseCase(rainImplement: ref.read(rainImpleProvider)));

//Controller

final addCourtCProvider = StateNotifierProvider<AddCourtController, AddCourtState>(
  (ref) => AddCourtController(
    ref.read(rainUseCaseProvider),
    ref.read(localCourtProvider),
  ),
);

final homeProvider = StateNotifierProvider<HomeController, HomeState>((ref) => HomeController(ref.read(localCourtProvider)));
