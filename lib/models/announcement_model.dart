import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AnnouncementModel {
  final String  id;
  final String imgurl;
  AnnouncementModel({required this .id,required this.imgurl});


  AnnouncementModel copyWith({
    String? id,
    String? imgurl,
  }) {
    return AnnouncementModel(
      id: id ?? this.id,
      imgurl: imgurl ?? this.imgurl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'imgurl': imgurl,
    };
  }

  factory AnnouncementModel.fromMap(Map<String, dynamic> map) {
    return AnnouncementModel(
      id: map['id'] as String,
      imgurl: map['imgurl'] as String,
    );
  }

}

List<AnnouncementModel> dummyAnnouncement=[ AnnouncementModel(
    id: '1',
    imgurl:
        'https://marketplace.canva.com/EAFMdLQAxDU/1/0/1600w/canva-white-and-gray-modern-real-estate-modern-home-banner-NpQukS8X1oo.jpg',
  ),
  AnnouncementModel(
    id: '2',
    imgurl:
        'https://edit.org/photos/img/blog/mbp-template-banner-online-store-free.jpg-840.jpg',
  ),
  AnnouncementModel(
    id: '3',
    imgurl:
        'https://e0.pxfuel.com/wallpapers/606/84/desktop-wallpaper-ecommerce-website-design-company-noida-e-commerce-banner-design-e-commerce.jpg',
  ),
];