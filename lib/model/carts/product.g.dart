// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int?,
      title: json['title'] as String?,
      price: json['price'] as int?,
      quantity: json['quantity'] as int?,
      total: json['total'] as int?,
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
      discountedPrice: json['discountedPrice'] as int?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'quantity': instance.quantity,
      'total': instance.total,
      'discountPercentage': instance.discountPercentage,
      'discountedPrice': instance.discountedPrice,
    };
