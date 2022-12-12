import 'package:dio/dio.dart';
import 'package:ex004/model/models.dart';

class Repository {
  Model? model;

  Future setOneProduct(String? valor) async {
    Response response =
        await Dio().get('https://dummyjson.com/products/$valor');
    Map<String, dynamic> mapa = response.data;
    model = Model.fromJson(mapa);
    // print(mapa['images'][0]);
    // é igual a uma lista > List<dynamic> lista = [2, 3, ''];
  }

  Future deletOneProduct(String? valor) async {
    Response response =
        await Dio().delete('https://dummyjson.com/products/$valor');
    Map<String, dynamic> mapa = response.data;
    model = Model.fromJson(mapa);
  }

  Model? getModel() {
    return model;
  }

  Future teste() async {
    Response res = await Dio().get("https://dummyjson.com/products");
    Map<String, dynamic> queijo = res.data;
    print(queijo);
    print(queijo.length);
  }
}
