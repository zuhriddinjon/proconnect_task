// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:forestvpn_test/repositories/news/repository.dart';

class FeaturesWidget extends StatelessWidget {
  final Function(Article) onClicked;
  const FeaturesWidget({
    Key? key,
    required this.onClicked,
    required this.articles,
  }) : super(key: key);

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: List.generate(articles.length, (index) => _feature(index)),
        options: CarouselOptions(
          height: 300,
          aspectRatio: 16 / 9,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 2000),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: (index, reason) {},
          scrollDirection: Axis.horizontal,
        ));
  }

  Widget _feature(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () => onClicked(articles[index]),
          child: Stack(
            children: [
              Container(
                foregroundDecoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
                child: Image.network(
                  'https://source.unsplash.com/user/c_v_r/1900x800',
                  height: 300,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                left: 20,
                bottom: 40,
                right: 20,
                child: Text(
                  '${articles[index].title}',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: 0.56,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
