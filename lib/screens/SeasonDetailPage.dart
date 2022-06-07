import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soccer_zone/models/FixturesResponse.dart';
import 'package:soccer_zone/screens/SeasonsPage.dart';
import 'package:transparent_image/transparent_image.dart';

import '../manager/api_client.dart';

int mId = 0;
int page = 1;
// List<Data> fixtures = [];

class SeasonDetailPage extends StatefulWidget {
  const SeasonDetailPage({Key? key, required this.id, required this.title}) : super(key: key);
  final int? id;
  final String title;

  @override
  State<SeasonDetailPage> createState() => _SeasonDetailPageState();
}

class _SeasonDetailPageState extends State<SeasonDetailPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    mId = widget.id!;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title,
          textAlign: TextAlign.center,),
      ),
      body: _buildBody(context),
    );// This trailing comma makes auto-formatting nicer for build metho
  }
}

FutureBuilder<FixturesResponse> _buildBody(BuildContext context) {
  final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
  return FutureBuilder<FixturesResponse>(

    future: client.getFixturesById(appid, apikey, mId, page),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        final List<Data>? fixtures = snapshot.data?.data;
        // seasons?.insert(0, new Data(id: 1331, idLeague: 71, leagueName: 'World Cup - 2022 Qatar', start: 2022, end: 2022));
        return _buildFixtures(context, fixtures!);
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}

ListView _buildFixtures(BuildContext context, List<Data> posts) {
  return ListView.builder(
    itemCount: posts.length + 1,
    padding: EdgeInsets.all(8),
    itemBuilder: (context, index) {
      /*if(index == 0){
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/soccer.png'),
            child: GestureDetector(onTap: () {}),
          ),
          title: Text(
            posts[index].leagueName.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(posts[index].start.toString() + ' - ' + posts[index].end.toString()),
        );
      }*/
      if(index == posts.length){
        return Padding(padding: EdgeInsets.all(10),
            child: _buildLoadMoreButton(context));
        // return _buildLoadMoreButton();
        // loadMore();
        // return Loading();
      }
      return Card(
        elevation: 8,
        color: Colors.white,
        child: InkWell(
          onTap: () {
            /*Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SeasonDetailPage(id: posts[index].id, title: posts[index].leagueName.toString(),)),
            );*/
          },
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              FadeInImage.memoryNetwork(
                                image: "https://countryflagsapi.com/png/${posts[index].homeName.toString().toLowerCase()}",
                                width: 40,
                                height: 25,
                                placeholder: kTransparentImage,
                                imageErrorBuilder:
                                    (context, error, stackTrace) {
                                  return Image.asset(
                                      'assets/images/flag_placeholder.jpg',
                                      width: 40,
                                      height: 25,
                                      fit: BoxFit.fitWidth);
                                },
                                fit: BoxFit.fitWidth,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                '${posts[index].homeName}',
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              FadeInImage.memoryNetwork(
                                image: "https://countryflagsapi.com/png/${posts[index].awayName.toString().toLowerCase()}",
                                width: 40,
                                height: 25,
                                placeholder: kTransparentImage,
                                imageErrorBuilder:
                                    (context, error, stackTrace) {
                                  return Image.asset(
                                      'assets/images/flag_placeholder.jpg',
                                      width: 40,
                                      height: 25,
                                      fit: BoxFit.fitWidth);
                                },
                                fit: BoxFit.fitWidth,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                '${posts[index].awayName}',
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        posts[index].date.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    posts[index].seasonName.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${posts[index].homeName} vs ${posts[index].awayName}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        fontSize: 24.0,
                    ),
                  ),
                ],
              ),
            )
        ),
      );
    },
  );
}

Widget _buildLoadMoreButton(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Colors.green,
        ),
        elevation: MaterialStateProperty.all(6),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'Load More...',
          style: TextStyle(
            fontFamily: 'PT-Sans',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      onPressed: () {
        page = page + 1;
        _buildBody(context);
      },
    ),
  );
}