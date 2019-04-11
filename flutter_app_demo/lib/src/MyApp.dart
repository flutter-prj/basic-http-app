import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/images_list.dart';


class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AppState();
  }
}

class AppState extends State<MyApp> {
  int counter = 0;

  List<ImageModel> images=[];


  void fetchImage() async {
    counter++;
    var response = await get(
        "https://jsonplaceholder.typicode.com/photos/$counter");
    var imageModel = ImageModel.fromJson(json.decode(response.body));

    setState((){
      images.add(imageModel);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
        home: Scaffold(
          body:ImageList(images),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: fetchImage/*() {
              setState(() {
                counter += 1;
              });
            }*/,
          ),
          appBar: AppBar(
            title: Text('lets see some Images!!!'),
          ),
        ));
  }
}
