import 'package:core_flutter/common_widgets/app_error_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/di/home_providers.dart';
import 'package:movie_app/features/home/domain/model/home/now_playing_model.dart';
import 'package:movie_app/features/home/presentation/cubit/now_playing_cubit.dart';
import 'package:movie_app/features/home/presentation/widgets/image_utils.dart';

class NowPlayingMoviesView extends StatefulWidget {
  const NowPlayingMoviesView({super.key});

  @override
  NowPlayingMoviesViewState createState() => NowPlayingMoviesViewState();
}

class NowPlayingMoviesViewState extends State<NowPlayingMoviesView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late final PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingMoviesCubit, NowPlayingMoviesState>(
      bloc: nowPlayingCubit,
      builder: (BuildContext context, state) {
        if (state is NowPlayingMoviesDataState) {
          return _buildCoverPageList(
            state.nowPlayingMoviesModel,
          );
        } else if (state is NowPlayingMoviesErrorState) {
          return Center(
            child: AppErrorPopup(
              errorMessage: state.errorMessage,
            ),
          );
        } else if (state is NowPlayingMoviesLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

//Main horizontal page view
  _buildCoverPageList(
    NowPlayingMoviesModel nowPlayingMoviesModel,
  ) {
    return SizedBox(
      height: 260,
      width: double.infinity,
      child: PageView.builder(
          physics: const BouncingScrollPhysics(),
          controller: _pageController,
          itemCount: nowPlayingMoviesModel.results?.length ?? 0,
          itemBuilder: (context, index) {
            return _coverPageItem(
                index: index,
                pageController: _pageController,
                nowPlayingMoviesModel: nowPlayingMoviesModel);
          }),
    );
  }

//Build cover page item
  _coverPageItem(
      {required int index,
      PageController? pageController,
      required NowPlayingMoviesModel nowPlayingMoviesModel}) {
    String tag = "${nowPlayingMoviesModel.results![index].title!}$index";
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? widget) {
        double value = 1;
        if (pageController!.position.haveDimensions) {
          value = (pageController.page! - index);
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          //   Navigator.push(
          //   context,
          //   CupertinoPageRoute(
          //       builder: (_) => MovieDetailsView(
          //           tag, widget.model.nowPlayingMovies[index].id)),
          // );
        },
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 3.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Hero(
                    tag: tag,
                    transitionOnUserGestures: true,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: ImageUtils(
                          nowPlayingMoviesModel.results![index].posterPath ??
                              "",
                          ImageType.network,
                          BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                        )),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 30.0,
              bottom: 40.0,
              child: SizedBox(
                width: 250.0,
                child: Text(
                  nowPlayingMoviesModel.results![index].title!.toUpperCase() ??
                      "",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _controller.dispose();
    super.dispose();
  }
}
