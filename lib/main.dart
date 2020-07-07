import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(MaterialApp(
    title: 'pangolindm',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => FirstScreen(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/second': (context) => SecondScreen(),
    },
  ));
}

double _sigmaX = 25.0; // from 0-10
double _sigmaY = 25.0; // from 0-10
double _opacity = 0.5; // from 0-1.0

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/forest.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
              child: GestureDetector(
                // When the child is tapped, show a snackbar.
                onTap: () {
                  Navigator.pushNamed(context, '/second');
                },
                // The custom button
                child: Container(
                  color: Colors.black.withOpacity(_opacity),
                  child: new Center(
                    child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            "15:36",
                            style: new TextStyle(
                                fontSize: 100.0,
                                color: const Color(0xFFeaeaea),
                                fontWeight: FontWeight.w200,
                                fontFamily: "Roboto"),
                          ),
                          new Text(
                            "Monday, July 6, 2020",
                            style: new TextStyle(
                                fontSize: 18.0,
                                color: const Color(0xFFeaeaea),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto"),
                          ),
                          new Padding(
                            padding: EdgeInsets.all(15),
                            child: new Icon(Icons.keyboard_arrow_down,
                                color: const Color(0xFFffffff), size: 25.0),
                          )
                        ]),
                  ),
                ),
              ),
            )));
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack.
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
