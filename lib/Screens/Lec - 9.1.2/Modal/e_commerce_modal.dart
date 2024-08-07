class ECommerceModal {
  late List<ProductModal> products;

  ECommerceModal({required this.products});

  factory ECommerceModal.fromJson(Map m1) {
    return ECommerceModal(
      products: (m1['products'] as List)
          .map(
            (e) => ProductModal.fromJson(e),
      )
          .toList(),
    );
  }
}

class ProductModal {
  late String title, description, category, thumbnail;
  late double price, discountPercentage, rating;
  late List<ReviewModal> reviews;
  late List images;

  ProductModal({
    required this.title,
    required this.description,
    required this.category,
    required this.thumbnail,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.reviews,
    required this.images,
  });

  factory ProductModal.fromJson(Map m1) {
    return ProductModal(
        title: m1['title'],
        description: m1['description'],
        category: m1['category'],
        thumbnail: m1['thumbnail'],
        price: m1['price'].toDouble(),
        discountPercentage: m1['discountPercentage'].toDouble(),
        rating: m1['rating'].toDouble(),
        reviews: (m1['reviews'] as List)
            .map(
              (e) => ReviewModal.fromJson(e),
        )
            .toList(),
        images: m1['images']);
  }
}

class ReviewModal {
  late String comment, date, reviewerName, reviewerEmail;
  late int rating;

  ReviewModal({
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
    required this.rating,
  });

  factory ReviewModal.fromJson(Map m1) {
    return ReviewModal(
      comment: m1['comment'],
      date: m1['date'],
      reviewerName: m1['reviewerName'],
      reviewerEmail: m1['reviewerEmail'],
      rating: m1['rating'],
    );
  }
}

// class ECommerceModal {
//   late List<Products> products;
//
//   ECommerceModal({required this.products});
//
//   factory ECommerceModal.fromJson(Map m1){
//     return ECommerceModal(products: (m1['products'] as List).map((e) => Products.fromJson(e),).toList());
//   }
// }
//
// class Products {
//   late int id;
//   late double discountPercentage, price, rating;
//   late String title,
//       description,
//       category,
//       brand,
//       returnPolicy,
//       warrantyInformation,
//       shippingInformation,
//       thumbnail;
//   late List tags, images;
//   late List<Reviews> reviews;
//   late Meta meta;
//
//   Products({
//     required this.id,
//     required this.discountPercentage,
//     required this.price,
//     required this.rating,
//     required this.title,
//     required this.description,
//     required this.category,
//     required this.brand,
//     required this.returnPolicy,
//     required this.warrantyInformation,
//     required this.shippingInformation,
//     required this.thumbnail,
//     required this.tags,
//     required this.images,
//     required this.reviews,
//     required this.meta,
//   });
//
//   factory Products.fromJson(Map m1) {
//     return Products(
//       id: m1['id'],
//       discountPercentage: m1['discountPercentage'].toDouble(),
//       price: m1['price'].toDouble(),
//       rating: m1['rating'].toDouble,
//       title: m1['title'],
//       description: m1['description'],
//       category: m1['category'],
//       brand: m1['brand'],
//       returnPolicy: m1['returnPolicy'],
//       warrantyInformation: m1['warrantyInformation'],
//       shippingInformation: m1['shippingInformation'],
//       thumbnail: m1['thumbnail'],
//       tags: m1['tags'],
//       images: m1['images'],
//       reviews: (m1['reviews'] as List).map((e) => Reviews.fromJson(e),).toList(),
//       meta: Meta.fromJson(m1['meta']),
//     );
//   }
// }
//
// class Meta {
//   late String qrCode;
//
//   Meta({required this.qrCode});
//
//   factory Meta.fromJson(Map m1) {
//     return Meta(
//       qrCode: m1['qrCode'],
//     );
//   }
// }
//
// class Reviews {
//   late int rating;
//   late String comment, reviewerName, reviewerEmail;
//
//   Reviews({
//     required this.rating,
//     required this.comment,
//     required this.reviewerName,
//     required this.reviewerEmail,
//   });
//
//   factory Reviews.fromJson(Map m1) {
//     return Reviews(
//       rating: m1['rating'],
//       comment: m1['comment'],
//       reviewerName: m1['reviewerName'],
//       reviewerEmail: m1['reviewerEmail'],
//     );
//   }
// }