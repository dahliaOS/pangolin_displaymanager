import 'package:flutter/material.dart';
import 'dart:io';



class UserPanel extends StatefulWidget {
  @override
  _UserPanelState createState() => _UserPanelState();
}

class _UserPanelState extends State<UserPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          Padding(
              padding: EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.supervised_user_circle,
                    size: 32,
                    color: Colors.deepOrange,
                  ),
                  
                ],
              ) //Image.asset('lib/logo-color.png',width: 165.0, height: 32.0, fit: BoxFit.fill)
              ),
          Padding(
              padding: EdgeInsets.only(
                left: 25,
              ),
              child: Text('Sign in to dahliaOS',
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w300,
                    fontSize: 25,
                    color: Colors.grey[800],
                  ))),
          Expanded(
            child: Center(
                child: Container(
              height: 350,
              margin: EdgeInsets.only(left: 25, right: 25),
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 15,
                  ),
                  
                 
                  Container(
                    height: 25,
                  ),
                  TextFormField(
                    enabled:true,
                    
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username'),
                  ),
                  Container(
                    height: 25,
                  ),
                  TextFormField(
                    obscureText: true,
                    enabled: true,
                    
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password'),
                  ),
                ],
              ),
            )),
          ),
          Align(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                Padding(
                    padding: EdgeInsets.only(top: 20.0, right: 20, bottom: 15),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Back'))),
              ]))
        ]));
  }
}