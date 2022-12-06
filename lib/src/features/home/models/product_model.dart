// class Product {
//   Product({
//     this.id,
//     this.title,
//     this.price,
//     this.description,
//     this.category,
//     this.image,
//     this.rating,
//   });
//
//   int? id;
//   String? title;
//   double? price;
//   String? description;
//   Category? category;
//   String? image;
//   Rating? rating;
//
//   factory Product.fromJson(Map<String?, dynamic> json) => Product(
//         id: json["id"],
//         title: json["title"],
//         price: json["price"].toDouble(),
//         description: json["description"],
//         category: categoryValues.map[json["category"]],
//         image: json["image"],
//         rating: Rating.fromJson(json["rating"]),
//       );
//
//   Map<String?, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "price": price,
//         "description": description,
//         "category": categoryValues.reverse![category],
//         "image": image,
//         "rating": rating?.toJson(),
//       };
// }
//
// enum Category { MEN_S_CLOTHING, JEWELERY, ELECTRONICS, WOMEN_S_CLOTHING }
//
// final categoryValues = EnumValues({
//   "electronics": Category.ELECTRONICS,
//   "jewelery": Category.JEWELERY,
//   "men's clothing": Category.MEN_S_CLOTHING,
//   "women's clothing": Category.WOMEN_S_CLOTHING
// });
//
// class Rating {
//   Rating({
//     this.rate,
//     this.count,
//   });
//
//   double? rate;
//   int? count;
//
//   factory Rating.fromJson(Map<String?, dynamic> json) => Rating(
//         rate: json["rate"].toDouble(),
//         count: json["count"],
//       );
//
//   Map<String?, dynamic> toJson() => {
//         "rate": rate,
//         "count": count,
//       };
// }
//
// class EnumValues<T> {
//   Map<String?, T> map;
//   Map<T, String?>? reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String?>? get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }

class Product {
  List<FeaturedProducts>? featuredProducts;

  Product({this.featuredProducts});

  Product.fromJson(Map<String, dynamic> json) {
    if (json['featuredProducts'] != null) {
      featuredProducts = <FeaturedProducts>[];
      json['featuredProducts'].forEach((v) {
        featuredProducts!.add(FeaturedProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (featuredProducts != null) {
      data['featuredProducts'] =
          featuredProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FeaturedProducts {
  int? id;
  String? productName;
  String? model;
  int? sellingPrice;
  String? productImage;

  FeaturedProducts({
    this.id,
    this.productName,
    this.model,
    this.sellingPrice,
    this.productImage,
  });

  FeaturedProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['productName'];
    model = json['model'];
    sellingPrice = json['sellingPrice'];
    productImage = json['productImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productName'] = productName;
    data['model'] = model;
    data['sellingPrice'] = sellingPrice;
    data['productImage'] = productImage;
    return data;
  }
}
