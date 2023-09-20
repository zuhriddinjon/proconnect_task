import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/core/app_router.dart';
import 'package:forestvpn_test/news/articles_widget.dart';
import 'package:forestvpn_test/news/bloc/article/articles_bloc.dart';
import 'package:forestvpn_test/news/bloc/article/articles_state.dart';
import 'package:forestvpn_test/news/bloc/feature/feature_bloc.dart';
import 'package:forestvpn_test/news/features_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<FeatureBloc>().add(FetchFeature());
    context.read<ArticlesBloc>().add(FetchArticles());
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Notifications',
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 0,
            letterSpacing: 0.36,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: TextButton(
              onPressed: () {
                context.read<ArticlesBloc>().add(ChangeArticleReaded());
              },
              child: Text(
                'Mark all read',
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 0.36,
                ),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 28, top: 20),
            child: Text(
              'Featured',
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: 0.40,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          BlocBuilder<FeatureBloc, FeatureState>(
            builder: (context, state) {
              switch (state.runtimeType) {
                case FeatureInitial:
                  return Container();
                case FeatureLoading:
                  return Container();
                case FeatureLoaded:
                  {
                    var articles = (state as FeatureLoaded).articles;
                    return FeaturesWidget(
                      articles: articles,
                      onClicked: (article) {
                        context.pushNamed(AppRouter.newsDetail.second,
                            pathParameters: {"article_id": article.id});
                      },
                    );
                  }
                case FeatureError:
                  return Container();
                default:
                  return Container();
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28, top: 20),
            child: Text(
              'Latest news',
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: 0.40,
              ),
            ),
          ),
          BlocBuilder<ArticlesBloc, ArticlesState>(
            builder: (context, state) {
              switch (state.runtimeType) {
                case ArticlesInitial:
                  return Container();
                case ArticlesLoading:
                  return Container();
                case ArticlesLoaded:
                  {
                    var articles = (state as ArticlesLoaded).articles;
                    return ArticlesWidget(
                      articles: articles,
                      onClicked: (article) {
                        context.pushNamed(AppRouter.newsDetail.second,
                            pathParameters: {"article_id": article.id});
                      },
                    );
                  }
                case ArticlesError:
                  return Container();
                default:
                  return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
