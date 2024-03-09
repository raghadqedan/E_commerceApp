

class PaymentMethodModel {
final String id;
final String imgurl;
final String name;
final String cardNumber;
final String expiryDate;
final String cvv;
final String cardHolderName;
final bool isFavorites;

  PaymentMethodModel({required this.id, required this.name, required this.cardNumber, required this.expiryDate, required this.cvv, required this.cardHolderName,this.isFavorites=false,required this.imgurl});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'imgurl': imgurl,
      'name': name,
      'cardNumber': cardNumber,
      'expiryDate': expiryDate,
      'cvv': cvv,
      'cardHolderName': cardHolderName,
      'isFavorites':isFavorites ,
    };
  }

  factory PaymentMethodModel.fromMap(Map<String, dynamic> map) {
    return PaymentMethodModel(
      id: map['id'] as String,
      imgurl: map['imgurl'] as String,
      name: map['name'] as String,
      cardNumber: map['cardNumber'] as String,
      expiryDate: map['expiryDate'] as String,
      cvv: map['cvv'] as String,
      cardHolderName: map['cardHolderName'] as String,
      isFavorites: map['isFavorites'] as bool,
    );
  }

}
