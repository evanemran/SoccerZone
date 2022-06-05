
import 'package:path/path.dart' as Path;

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:soccer_zone/models/SeasonsResponse.dart';

import '../manager/api_client.dart';

String appid = "elenasport-io1.p.rapidapi.com";
String apikey = "aff0b3060fmsh341831e529ad917p1b0755jsnc95fe6726c71";
int page = 1;

Widget _buildLoadMoreButton() {
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
        _buildBody();
      },
    ),
  );
}

FutureBuilder<SeasonsResponse> _buildBody(/*BuildContext context*/) {
  final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
  return FutureBuilder<SeasonsResponse>(

    future: client.getAllSeasons(appid, apikey, page),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        final List<Data>? seasons = snapshot.data?.data;
        return _buildSeasons(context, seasons!);
      } else {
        return Center(
          child: CircularProgressIndicator(),
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
      if(index == posts.length){
        return Padding(padding: EdgeInsets.all(10),
        child: _buildLoadMoreButton());
        // return _buildLoadMoreButton();
        // loadMore();
        // return Loading();
      }
      return Card(
        elevation: 8,
        color: Colors.white,
        child: InkWell(
        onTap: () {

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
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: _buildBody(),
        );// This trailing comma makes auto-formatting nicer for build metho
  }
}