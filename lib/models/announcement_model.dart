class AnnouncementModel{
  final String  id;
  final String imageUrl;
  AnnouncementModel({required this .id,required this.imageUrl});

}

List<AnnouncementModel> dummyAnnouncement=[ AnnouncementModel(
    id: '1',
    imageUrl:
        'https://marketplace.canva.com/EAFMdLQAxDU/1/0/1600w/canva-white-and-gray-modern-real-estate-modern-home-banner-NpQukS8X1oo.jpg',
  ),
  AnnouncementModel(
    id: '2',
    imageUrl:
        'https://edit.org/photos/img/blog/mbp-template-banner-online-store-free.jpg-840.jpg',
  ),
  AnnouncementModel(
    id: '3',
    imageUrl:
        'https://e0.pxfuel.com/wallpapers/606/84/desktop-wallpaper-ecommerce-website-design-company-noida-e-commerce-banner-design-e-commerce.jpg',
  ),
];