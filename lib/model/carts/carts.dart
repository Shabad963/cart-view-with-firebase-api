import 'package:json_annotation/json_annotation.dart';

import 'cart.dart';

part 'carts.g.dart';

@JsonSerializable()
class Carts {
  List<Cart>? carts;
  int? total;
  int? skip;
  int? limit;

  Carts({this.carts, this.total, this.skip, this.limit});

  factory Carts.fromJson(Map<String, dynamic> json) => _$CartsFromJson(json);

  Map<String, dynamic> toJson() => _$CartsToJson(this);
}
