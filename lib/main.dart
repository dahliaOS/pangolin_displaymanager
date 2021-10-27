import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';
import 'package:intl/intl.dart';

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

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(milliseconds: 1500),
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

double _sigmaX = 5.0; // from 0-10
double _sigmaY = 5.0; // from 0-10
double _opacity = 0.0; // from 0-1.0

class FirstScreen extends StatefulWidget {
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String _timeString;

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/modern.png'),
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
                            _timeString,
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
   void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('h:mm').format(dateTime);
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
                image: AssetImage('lib/images/modern.png'),
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
                  color: Colors.black.withOpacity(_opacity),
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
