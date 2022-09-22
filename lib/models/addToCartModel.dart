class AddToCartModel{
  final String id;
  final String productId;
  final String title;
  final int price;
  final String imgUrl;
  final int discountValue;

final String color;
final String size;
final int quantity;

   AddToCartModel( {
     required this.productId,//كود المنتج نفسه
    required this.id,//كود الصف مثل الprimary key للصف
    required this.title,
    required this.price,
    required this.imgUrl,
     this.discountValue=0,
     this.color='Black',
    required this.size,
     this.quantity=1,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'productId': this.productId,
      'title': this.title,
      'price': this.price,
      'imgUrl': this.imgUrl,
      'discountValue': this.discountValue,
      'color': this.color,
      'size': this.size,
      'quantity': this.quantity,
    };
  }

  factory AddToCartModel.fromMap(Map<String, dynamic> map,String documentId) {
    return AddToCartModel(
      id: documentId,
      title: map['title'] as String,
      price: map['price'] as int,
      imgUrl: map['imgUrl'] as String,
      discountValue: map['discountValue'] as int,
      color: map['color'] as String,
      size: map['size'] as String,
      quantity: map['quantity'] as int,
      productId: map['productId'] as String,
    );
  }
}