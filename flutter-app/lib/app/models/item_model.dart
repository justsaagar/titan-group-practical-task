class ItemModel {
  final int id;
  final String name;
  final String category;
  final double price;
  final String description;
  final bool inStock;
  final double rating;

  ItemModel({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.inStock,
    required this.rating,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'] as int,
      name: json['name'] as String,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      inStock: json['inStock'] as bool,
      rating: (json['rating'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'price': price,
      'description': description,
      'inStock': inStock,
      'rating': rating,
    };
  }
}

