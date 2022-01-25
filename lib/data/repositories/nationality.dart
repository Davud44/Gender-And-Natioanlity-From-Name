import 'package:bloctest/data/model/nationality.dart';
import 'package:dio/dio.dart';

abstract class NationalityRepository {
  Future<Nationality> getNationality(String? name);
}

class NationalityRepo extends NationalityRepository {
  @override
  Future<Nationality> getNationality(String? name) async {
    var response = await Dio().get("https://api.nationalize.io/?name=" + name!);
    if (response.statusCode == 200) {
      Nationality nationality = Nationality.fromJson(response.data);
      return nationality;
    }
    else{
      throw Exception('Failed');
    }
  }
}
