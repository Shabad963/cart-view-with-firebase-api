import 'package:dio/dio.dart';

import '../model/carts/cart.dart';
import '../model/carts/carts.dart';

Future<List<Cart>?> getCart() async {
  const String url = 'https://dummyjson.com/carts';
  final Response response = await Dio().get(url);
  late List<Cart>? carts;
  if (response.statusCode == 200 || response.statusCode == 201) {
    carts = Carts.fromJson(response.data).carts;
  }
  return carts;
}
