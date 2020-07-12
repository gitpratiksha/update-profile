import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp> {
  File _image;
  var picture;
  var gallery1;
  Future getimage() async {
    picture = await ImagePicker.pickImage(source: ImageSource.camera);
    print(picture);
    setState(() {
      _image = picture;
    });
  }
Future selectimage()
async {
   gallery1=await ImagePicker.pickImage(source: ImageSource.gallery);
   print(picture);
   setState(() {
     _image=gallery1;
   });
}

  @override
  Widget build(BuildContext context) {
    //final Size=MediaQuery.of(context).size;
return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('camera'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200,
              width: 400,
              color: Colors.amber,
              child: _image == null
                  ? Text('no image selected')
                  //Visibility(
                  : Image.file(_image),
              //),
            ),
            FloatingActionButton(
              onPressed: () {
                getimage();
              },
              child: Icon(Icons.add),
            ),
             FloatingActionButton(
              onPressed: () {
                selectimage();
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    ),
);
  }
}
