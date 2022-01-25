import 'package:bloctest/bloc/nationality/nationality_event.dart';
import 'package:bloctest/bloc/nationality/nationality_state.dart';
import 'package:bloctest/data/model/nationality.dart';
import 'package:bloctest/data/repositories/nationality.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NationalityBloc extends Bloc<NationalityEvent , NationalityState>{
  NationalityRepository? nationalityRepository;
  NationalityBloc(NationalityState initialState) : super(initialState){

    on<GetNationalityEvent>((event, emit) async {
      nationalityRepository = NationalityRepo();
      emit(NationalityLoading());
      Nationality nationality = await nationalityRepository!.getNationality(event.name);
      emit(NationalityLoaded(nationality: nationality));
    });

  }
}