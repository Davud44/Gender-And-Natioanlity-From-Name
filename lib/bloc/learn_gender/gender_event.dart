import 'package:equatable/equatable.dart';

abstract class GenderEvent extends Equatable{

}

class GetGenderEvent extends GenderEvent
{
  final String? name;
  GetGenderEvent({this.name});
  @override
  List<Object?> get props => [];
}
