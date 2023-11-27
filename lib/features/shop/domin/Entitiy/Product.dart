import 'package:equatable/equatable.dart';

class ProductsEntity extends Equatable {
  final int ? id;

  final String title;

  final String price;

  final String category;

  final String description;

  final String image;

  const ProductsEntity({
     this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
  });

  @override
  List<Object?> get props => [id , title ,
    price , category , description , image];




}
