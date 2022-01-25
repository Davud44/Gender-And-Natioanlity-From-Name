import 'package:bloctest/data/model/nationality.dart';
import 'package:equatable/equatable.dart';

abstract class NationalityState extends Equatable{

}

class NationalityInitial extends NationalityState{
  @override
  List<Object?> get props =>[];
}

class NationalityLoading extends NationalityState{
  @override
  List<Object?> get props =>[];
}

class NationalityLoaded extends NationalityState{
  final Nationality? nationality;
  NationalityLoaded({this.nationality});
  @override
  List<Object?> get props =>[];
}

class NationalityError extends NationalityState{
  @override
  List<Object?> get props =>[];
}