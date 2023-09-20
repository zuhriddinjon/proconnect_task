// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/news_detail/bloc/article_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsDetailScreen extends StatelessWidget {
  final String articleId;

  const NewsDetailScreen({
    Key? key,
    required this.articleId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ArticleBloc>().add(FetchArticle(id: articleId));
    return Scaffold(
      body: BlocBuilder<ArticleBloc, ArticleState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case ArticleInitial:
              return Container();
            case ArticleLoading:
              return Container();
            case ArticleLoaded:
              {
                var article = (state as ArticleLoaded).article;
                return Stack(
                  children: [
                    SingleChildScrollView(
                        child: Column(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
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
                                  height: 450,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 48,
                              bottom: 40,
                              right: 48,
                              child: Text(
                                '${article.title}',
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
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            '${article.description}',
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: 0.32,
                            ),
                          ),
                        )
                      ],
                    )),
                    Positioned(
                        top: 87,
                        left: 16,
                        child: InkWell(
                          onTap: () => context.pop(),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ))
                  ],
                );
              }
            case ArticleError:
              return Container();
            default:
              return Container();
          }
        },
      ),
    );
  }
}
