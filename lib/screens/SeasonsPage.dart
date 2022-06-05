import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soccer_zone/models/SeasonsResponse.dart';

import '../manager/api_client.dart';

String appid = "elenasport-io1.p.rapidapi.com";
String apikey = "aff0b3060fmsh341831e529ad917p1b0755jsnc95fe6726c71";
int page = 1;

FutureBuilder<SeasonsResponse> _buildBody(BuildContext context) {
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
    itemCount: posts.length,
    padding: EdgeInsets.all(8),
    itemBuilder: (context, index) {
      return Card(
        elevation: 4,
        child: ListTile(
          title: Text(
            posts[index].leagueName.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(posts[index].start.toString() + ' - ' + posts[index].end.toString()),
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
      body: _buildBody(context),
        );// This trailing comma makes auto-formatting nicer for build metho
  }
}