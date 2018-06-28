import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

void main() => runApp(new MyApp());


ThemeData theme =  new ThemeData(
    primaryColor: Colors.black,
    backgroundColor: Colors.white10
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Photo View example',
      theme: theme,
      home: new Scaffold(
        body: new Home(),
      ),
    );
  }
}

var imageUrl = "https://images.unsplash.com/photo-1495249737766-5aa052764eff?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=7d968dee23958e5a65a99699c1a4ba05&auto=format&fit=crop&w=1500&q=80";
var imageUrl2 = "https://images.unsplash.com/photo-1522891735718-6a86a483c165?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=300&h=200&fit=crop&ixid=eyJhcHBfaWQiOjF9&s=99553e144acd1557b378071c47042188";

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Expanded(child:  new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Center(
                  child:  new RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(builder: (context) => new ImageViewScreen(imageUrl2)),
                        );
                      },
                      color: Colors.green,
                      child: new Text("open small image",
                        style: new TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),)
                  )
              ),
              new Center(
                  child:  new RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(builder: (context) => new ImageViewScreen(imageUrl)),
                        );
                      },
                      color: Colors.green,
                      child: new Text("open large image",
                        style: new TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),)
                  )
              ),
            ],
          ))


        ],
      ),
    );
  }
}


class ImageViewScreen extends StatelessWidget {
  final String imageAddress;

  ImageViewScreen(this.imageAddress);


  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new PhotoView(
          imageProvider: new NetworkImage(imageAddress),
          loadingChild: new LoadingText(),
          isZooming: (zoom) => print(zoom),
        )
    );
  }

}

class LoadingText extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Text("Loading",
      style: new TextStyle(
          color: Colors.white
      ),
    );
  }
}
