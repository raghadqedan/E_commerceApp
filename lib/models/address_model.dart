// ignore_for_file: public_member_api_docs, sort_constructors_first

class preferedAddressModel {
final String id;
final String name;
final String imgurl;
final String address;
final bool isFavorites;

  preferedAddressModel( { required this.imgurl,required this.id, required this.name, required this.address,  this.isFavorites=false});


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
        'imgurl':imgurl,
      'address': address,
      'isFavorites': isFavorites,
    };
  }

  factory preferedAddressModel.fromMap(Map<String, dynamic> map) {
    return preferedAddressModel(
      id: map['id'] as String,
      name: map['name'] as String,
      imgurl: map['imgurl'] as String,
      address: map['address'] as String,
      isFavorites: map['isFavorites'] as bool,
    );
  }

  
}
