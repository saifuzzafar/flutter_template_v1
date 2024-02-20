import 'package:equatable/equatable.dart';

/// This class [HomeState] which should be consume by Cubit as it's state
abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];

  const HomeState();
}

class HomeInitialState extends HomeState {}
