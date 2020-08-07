import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    title: 'pangolindm',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.

    initialRoute: '/splash',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/splash': (context) => SplashScreen(),

      '/': (context) => FirstScreen(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/second': (context) => SecondScreen(),
    },
    theme: new ThemeData(primarySwatch: Colors.grey),
  ));
}

<<<<<<< HEAD
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 1),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => FirstScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: new Icon(Icons.brightness_5,
            color: const Color(0xFFffffff), size: 75.0),
      ),
    );
  }
}

double _sigmaX = 25.0; // from 0-10
double _sigmaY = 25.0; // from 0-10
double _opacity = 0.1; // from 0-1.0
=======
double _sigmaX = 30.0; // from 0-10
double _sigmaY = 30.0; // from 0-10
double _opacity = 0.5; // from 0-1.0
>>>>>>> master

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
                            "12:45",
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

var _controller = TextEditingController();

class SecondScreen extends StatelessWidget {
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
                  Navigator.pop(context);
                },
                // The custom button
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: new Center(
                    child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 40,
                            child: Text('#',
                                style: new TextStyle(
                                  fontSize: 30.0,
                                )),
                            backgroundColor: Colors.red[700],
                            foregroundColor: Colors.white,
                          ),
                          new Padding(
                            padding: EdgeInsets.all(15),
                            child: new Text(
                              "dahliaOS Root",
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  color: const Color(0xFFeaeaea),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Roboto"),
                            ),
                          ),
                          new Padding(
                              padding: EdgeInsets.all(15),
                              child: new SizedBox(
                                  width: 256,
                                  child: TextField(
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: const Color(0xFFf2f2f2),
                                    ),
                                    controller: _controller,
                                    obscureText: true,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(color: Colors.grey),
                                      hintText: "Password",
                                      suffixIcon: IconButton(
                                        onPressed: () => _controller.clear(),
                                        icon: Icon(Icons.arrow_forward),
                                      ),
                                    ),
                                  )))
                        ]),
                  ),
                ),
              ),
            )));
  }
}
