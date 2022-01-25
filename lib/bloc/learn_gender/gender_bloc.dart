import 'package:bloctest/bloc/learn_gender/gender_event.dart';
import 'package:bloctest/bloc/learn_gender/gender_state.dart';
import 'package:bloctest/data/model/gender.dart';
import 'package:bloctest/data/repositories/gender.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderBloc extends Bloc<GenderEvent , GenderSate>
{
  GenderRepository? genderRepository;
  GenderBloc(GenderSate initialState) : super(initialState){

    on<GetGenderEvent>((event, emit) async{
      try{
        emit(GenderLoading());
        genderRepository = GenderRepositoryImpl();
        Gender? gender = await genderRepository!.getGender(event.name);
        emit(GenderLoaded(gender: gender));
      }catch(e)
      {
        emit(GenderError(message: e.toString()));
      }

    });
  }

}