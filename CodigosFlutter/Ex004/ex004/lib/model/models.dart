class Model {
  int? id;
  String? title;
  String? description;
  dynamic price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;
  bool? isDeleted;
  String? deletedOn;

  Model(
      {this.id,
      this.brand,
      this.category,
      this.description,
      this.discountPercentage,
      this.images,
      this.price,
      this.rating,
      this.stock,
      this.thumbnail,
      this.title,
      this.isDeleted,
      this.deletedOn});

  Model.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    title = json['title'] ?? '';
    description = json['description'] ?? '';
    price = json['price'] ?? 0.0;
    discountPercentage = json['discountPercentage'] ?? 0.0;
    rating = json['rating'] ?? 0.0;
    stock = json['stock'] ?? 0;
    brand = json['brand'] ?? '';
    category = json['category'] ?? '';
    thumbnail = json['thumbnail'] ?? '';
    images = json['images'].cast<String>() ?? [''];
    isDeleted = json['isDeleted'] ?? false;
    deletedOn = json['deletedOn'] ?? '';
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'price': price,
        'discountPercentage': discountPercentage,
        'rating': rating,
        'stock': stock,
        'brand': brand,
        'category': category,
        'thumbnail': thumbnail,
        'images': images
      };
}
