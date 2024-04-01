import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/models/announcement_model.dart';
import 'package:flutter/material.dart';

class CustomCarouselIndicatior extends StatefulWidget {
  final List<AnnouncementModel> anouncement ;
  const CustomCarouselIndicatior({super.key, required this.anouncement});

  @override
  State<CustomCarouselIndicatior> createState() => _CustomCarouselIndicatiorState();
}

class _CustomCarouselIndicatiorState extends State<CustomCarouselIndicatior> {
  late  CarouselController _controller;
int _current=0;
@override
  void initState() {
    super.initState();
    _controller=CarouselController();
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: [
        CarouselSlider(
          items: widget.anouncement
          .map((item) => Center(
              child:
                CachedNetworkImage( imageUrl: item.imgurl, fit: BoxFit.cover, width: 1000)))
          .toList(),
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.anouncement.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),) ]);
  }
}