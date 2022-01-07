import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';
import 'package:themoviedb_app/data_sources/api_services.dart';
import 'package:themoviedb_app/models/tvshow.dart';
import 'package:themoviedb_app/screen/details/detail_screen.dart';

class TvshowList extends StatefulWidget {
  const TvshowList({
    Key? key,
  }) : super(key: key);

  @override
  _TvshowListState createState() => _TvshowListState();
}

class _TvshowListState extends State<TvshowList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:<Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder <List<Tvshow>>(
              future: ApiServices().fetchTvshows(),
              builder: (context, snapshot){
                if((snapshot.hasError) || (!snapshot.hasData)){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                List<Tvshow>? tvshowList = snapshot.data;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: tvshowList!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TvshowItem(
                        tvshow: tvshowList[index]
                      );
                    }
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class TvshowItem extends StatelessWidget {

  Tvshow? tvshow;

  TvshowItem({Key? key,
    this.tvshow
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: kDefaultPadding,
      ),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                  DetailScreen(
                      id: tvshow?.id ?? 0,
                      backdrop_path: image_link + 'original' + tvshow!.backdrop_path.toString(),
                      poster_path: image_link + 'w200' + tvshow!.poster_path.toString(),
                      first_air_date: tvshow!.first_air_date.toString(),
                      name: tvshow!.name.toString(),
                      overview: tvshow!.overview.toString(),
                      type: 'tv',
                  )
              )
          );
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network( image_link + 'w200' + tvshow!.poster_path.toString()),
              Padding(
                padding: const EdgeInsets.only(top: kDefaultPadding),
                child: Text(
                  tvshow!.name.toString(),
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Text(
                tvshow!.first_air_date.toString(),
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}