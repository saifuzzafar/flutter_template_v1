import 'package:core_flutter/common_widgets/app_error_popup.dart';
import 'package:core_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/domain/model/home/genre_model.dart';
import 'package:movie_app/features/home/presentation/cubit/genere_cubit.dart';

class MovieGenreView extends StatefulWidget {
  const MovieGenreView({super.key});
  @override
  MovieGenreViewState createState() => MovieGenreViewState();
}

class MovieGenreViewState extends State<MovieGenreView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenreCubit, GenreState>(
      builder: (context, state) {
        if (state is GenreDataState) {
          return _buildMovieCategory(
              model: state.genreListModel, context: context);
        } else if (state is GenreErrorState) {
          return Center(
            child: AppErrorPopup(
              errorMessage: state.errorMessage,
            ),
          );
        } else if (state is GenreLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const SizedBox.shrink();
        }
      },
    );

    //return _buildMovieCategory();
  }

  ///Movies categories in tab form
  Widget _buildMovieCategory(
      {required GenreListModel model, required BuildContext context}) {
    return SizedBox(
      height: 90.0,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          scrollDirection: Axis.horizontal,
          itemCount: model.genres.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 160,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFFD45253).withOpacity(0.5),
                    const Color(0xFF9E1F28).withOpacity(0.5),
                  ],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFF9E1F28),
                    offset: Offset(0.0, 2.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Opacity(
                    opacity: 0.6,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: AppAssets.png.avengers.image(
                            fit: BoxFit.fitWidth, width: double.infinity)),
                  ),
                  Text(
                    model.genres[index].name!.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.8,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
