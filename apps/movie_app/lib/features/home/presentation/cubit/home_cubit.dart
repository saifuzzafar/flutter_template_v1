import 'package:movie_app/features/home/presentation/cubit/home_state.dart';
import 'package:movie_app/features/home/domain/use_case/home_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


/// This class [HomeCubit] is consume by the [HomePage]
/// where all state will observed by [HomePage]
class HomeCubit extends Cubit<HomeState> {
  final HomeUseCase _homeUseCase;

  HomeCubit(HomeUseCase homeUseCase): _homeUseCase = homeUseCase, super(HomeInitialState());
}
