
import 'package:path/path.dart' as Path;

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:soccer_zone/models/SeasonsResponse.dart';
import 'package:soccer_zone/screens/SeasonDetailPage.dart';

import '../manager/api_client.dart';

String appid = "elenasport-io1.p.rapidapi.com";
String apikey = "aff0b3060fmsh341831e529ad917p1b0755jsnc95fe6726c71";
// String apikey = "7cd3cf3d34msh70137379717ab8dp127d88jsnf617cfcf851f";
int page = 1;
List<Data>? seasons = [];

Widget _buildLoadMoreButton(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Colors.indigo,
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

FutureBuilder<SeasonsResponse> _buildBody(BuildContext context) {
  final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
  return FutureBuilder<SeasonsResponse>(

    future: client.getAllSeasons(appid, apikey, page),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        /*final List<Data>? */seasons = snapshot.data?.data;
        seasons?.insert(0, new Data(id: 1331, idLeague: 71, leagueName: 'World Cup - 2022 Qatar', start: 2022, end: 2022));
        return _buildSeasons(context, seasons!);
      } else {
        return Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        );
      }
    },
  );
}

ListView _buildSeasons(BuildContext context, List<Data> posts) {
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SeasonDetailPage(id: posts[index].id, title: posts[index].leagueName.toString(),)),
          );
        },
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:<Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/soccer.png'),
                    child: GestureDetector(onTap: () {}),
                  ),
                  title: Text(
                    posts[index].leagueName.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(posts[index].start.toString() + ' - ' + posts[index].end.toString()),
                ),
              ]
          ),
        ),
      );
    },
  );
}

class SeasonsPage extends StatefulWidget {
  const SeasonsPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SeasonsPage> createState() => _SeasonsPageState();
}

class _SeasonsPageState extends State<SeasonsPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
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