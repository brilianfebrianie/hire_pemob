import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final CarouselController _carouselController = CarouselController();

  int _currentIndex = 0;

  final List _itemList = [
    Image.asset(
      'assets/images/placeholder/onboarding_carousel/onboarding_1.png',
    ),
    Image.asset(
      'assets/images/placeholder/onboarding_carousel/onboarding_2.png',
    )
  ];
  final List _descList = [
    const Text(
      'Find a job or get any help from others. We also provide education about world of work that you can learn. Get your experience with Hi!re and feel the future more confidently.',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 8, color: Colors.white),
    ),
    const Text(
      'Find a job or get any help from others. We also provide education about world of work that you can learn. Get your experience with Hi!re and feel the future more confidently.',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 8, color: Colors.white),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          items: _itemList
              .map((e) => SizedBox(
                    child: e,
                    height: 300,
                    width: 300,
                  ))
              .toList(),
          options: CarouselOptions(
              height: 250,
              autoPlay: true,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              }),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(25, 20, 25, 0),
          child: _descList[_currentIndex],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _itemList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _carouselController.animateToPage(entry.key),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                          .withOpacity(_currentIndex == entry.key ? 0.9 : 0),
                      border: Border.all(color: Colors.grey)),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
