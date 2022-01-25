import 'package:bloctest/data/model/gender.dart';
import 'package:equatable/equatable.dart';

abstract class GenderSate extends Equatable{

}

class GenderInitial extends GenderSate{
  @override
  List<Object?> get props => [];
}

class GenderLoading extends GenderSate{
  @override
  List<Object?> get props => [];
}

class GenderLoaded extends GenderSate{
  final Gender? gender;
  GenderLoaded({this.gender});
  @override
  List<Object?> get props => [];
}

class GenderError extends GenderSate{
  final String? message;
  GenderError({this.message});
  @override
  List<Object?> get props => [];
}