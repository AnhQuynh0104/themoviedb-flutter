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
                return ShaderMask(
                    shaderCallback: (Rect rect) {
                      return const LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Colors.purple, Colors.transparent, Colors.transparent, Colors.purple],
                        stops: [0.0, 0.1, 0.9, 1.0], // 10% purple, 80% transparent, 10% purple
                      ).createShader(rect);
                    },
                    blendMode: BlendMode.dstOut,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: tvshowList!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return TvshowItem(
                              tvshow: tvshowList[index]
                          );
                        }
                    )
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
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(image_link + 'w200' + tvshow!.poster_path.toString()),
                      fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
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