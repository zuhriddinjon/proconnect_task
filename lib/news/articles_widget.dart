// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:forestvpn_test/repositories/news/models/article.dart';

class ArticlesWidget extends StatelessWidget {
  final Function(Article) onClicked;

  const ArticlesWidget({
    Key? key,
    required this.onClicked,
    required this.articles,
  }) : super(key: key);

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 20,
        );
      },
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 28),
          decoration: ShapeDecoration(
            color: articles[index].readed ? Color(0xFFF5F5F5) : Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
            shadows: [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 20,
                offset: Offset(4, 4),
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Color(0xFFFFFFFF),
                blurRadius: 8,
                offset: Offset(-4, -4),
                spreadRadius: 0,
              )
            ],
          ),
          child: ListTile(
            onTap: () => onClicked(articles[index]),
            contentPadding: EdgeInsets.all(20),
            leading: Container(
              width: 90,
              height: 60,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://source.unsplash.com/user/c_v_r/1900x800"),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            title: Text(
              '${articles[index].title}',
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: 0.32,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                '${articles[index].publicationDate}',
                style: GoogleFonts.roboto(
                  color: Color(0xFF9A9A9A),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 0.24,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
