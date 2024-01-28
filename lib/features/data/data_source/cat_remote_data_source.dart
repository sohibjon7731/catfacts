import 'package:catfacts/core/exception/exception.dart';
import 'package:catfacts/features/data/models/cat_facts.dart';
import 'package:dio/dio.dart';

abstract class CatNetworkDataSource {
  Future<CatModel> getCatFacts();
  factory CatNetworkDataSource() => _CatNetworkDataSource();
}

class _CatNetworkDataSource implements CatNetworkDataSource {
  final dio = Dio(BaseOptions(baseUrl: "https://cat-fact.herokuapp.com"));
  @override
  Future<CatModel> getCatFacts() async {
    try {
      final response = await dio.get("/facts/random");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        print(response.data);
        return CatModel.fromJson(response.data);
      } else {
        throw ServerException(
            message: response.statusMessage ?? "", code: response.statusCode!);
      }
    } on ServerException {
      rethrow;
    } catch (error) {
      print("salom $error");
      throw ServerException(message: "Someting went wrong", code: 140);
    }
  }
}
