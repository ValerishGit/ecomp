// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SiteResult {
  final String name;
  final Product cheap;
  final List<Product> products;

  SiteResult(this.name, this.cheap, this.products);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'cheap': cheap.toMap(),
      'products': products.map((x) => x.toMap()).toList(),
    };
  }

  factory SiteResult.fromMap(Map<String, dynamic> map) {
    return SiteResult(
      map['name'] as String,
      Product.fromMap(map['cheap'] as Map<String, dynamic>),
      List<Product>.from(
        (map['products'] as List<dynamic>).map<Product>(
          (x) => Product.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SiteResult.fromJson(String source) =>
      SiteResult.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Product {
  final String name;
  final String price;
  final String link;
  final String img;
  final String rating;

  Product(this.name, this.price, this.link, this.img, this.rating);

  String shortName() {
    print(name);
    if (name.length >= 30) {
      return name.substring(0, 29);
    } else {
      return name;
    }
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
      'link': link,
      'img': img,
      'rating': rating,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      map['name'] as String,
      map['price'] as String,
      map['link'] as String,
      map['img'] as String,
      map['rating'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
