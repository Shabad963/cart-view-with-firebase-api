// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Carts _$CartsFromJson(Map<String, dynamic> json) => Carts(
      carts: (json['carts'] as List<dynamic>?)
          ?.map((e) => Cart.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
      skip: json['skip'] as int?,
      limit: json['limit'] as int?,
    );

Map<String, dynamic> _$CartsToJson(Carts instance) => <String, dynamic>{
      'carts': instance.carts,
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
    };
