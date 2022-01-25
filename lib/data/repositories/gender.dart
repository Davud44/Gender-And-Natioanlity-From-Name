import 'package:bloctest/data/model/gender.dart';
import 'package:dio/dio.dart';

abstract class GenderRepository {
  Future<Gender?> getGender(String? name);
}

class GenderRepositoryImpl extends GenderRepository{
  @override
  Future<Gender?> getGender(String? name) async {
     var response = await Dio().get("https://api.genderize.io/?name="+name!);
     if(response.statusCode == 200)
       {
         Gender gender = Gender.fromJson(response.data);
         return gender;
       }
     else{
       throw Exception('Failed');
     }
  }
  
}