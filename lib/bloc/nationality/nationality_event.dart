import 'package:equatable/equatable.dart';

abstract class NationalityEvent extends Equatable{

}

class GetNationalityEvent extends NationalityEvent{
  final String? name;
  GetNationalityEvent({this.name});
  @override
  List<Object?> get props => [];
}