import 'package:core_flutter/utils/screen_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constants/movie_app_constants.dart';
import 'package:movie_app/features/home/domain/model/home/movie_Item.dart';
import 'package:movie_app/features/home/presentation/widgets/movie_tile_header.dart';

class ContentScroll extends StatelessWidget {
  final String title;
  final List<MovieItem> scrollObject;
  const ContentScroll(
      {super.key, required this.scrollObject, required this.title});

  @override
  Widget build(BuildContext context) {
    ScreenDimensions dimension = ScreenDimensions(context);
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: MovieTileHeader(title),
        ),
        _buildSeriesList(),
      ],
    );
  }

  Widget _buildSeriesList() {
    //final dimensions
    return Container(
        height: ScreenDimensions.tileHeight, child: _buildSeriesElements());
  }

  Widget _buildSeriesElements() {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        scrollDirection: Axis.horizontal,
        itemCount: scrollObject.length,
        itemBuilder: (BuildContext context, int index) {
          String tag = "${scrollObject[index].title}$index";
          return GestureDetector(
            onTap: () {
              // Navigator.push(context, CupertinoPageRoute(builder: (_) => MovieDetailsView(tag, scrollObject[index].id)));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 20.0,
              ),
              width: ScreenDimensions.tileWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0.0, 4.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: buildThumbImage(scrollObject[index].imageUrl),
            ),
          );
        });
  }

  buildThumbImage(String url) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.network(
          AppConstants.imageBaseUrl + url,
          fit: BoxFit.cover,
        ));
  }
}

//AssetImage(images[index]
