library social_signin_buttons;

import 'package:flutter/material.dart';
import 'package:social_signin_buttons/signup.dart';
import 'package:social_signin_buttons/social_signin_buttons.dart';

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar ({Key? key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar > {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    if (index==1){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignUpScreen()),
      );
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Flutter BottomNavigationBar Example'),
          backgroundColor: Colors.green
      ),
      body: Center(
        child: _selectedIndex == 2?
        Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SignInButton(
                  Buttons.Google,
                  onPressed: () {
                    _showButtonPressDialog(context, 'Google');
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SignInButton(
                  Buttons.Facebook,
                  onPressed: () {
                    _showButtonPressDialog(context, 'Facebook');
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                SignInButton(
                  Buttons.Apple,
                  onPressed: () {
                    _showButtonPressDialog(context, 'Apple');
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                SignInButton(
                  Buttons.Microsoft,
                  onPressed: () {
                    _showButtonPressDialog(context, 'Microsoft');
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                SignInButton(
                  Buttons.GitHub,
                  text: "Sign up with GitHub",
                  onPressed: () {
                    _showButtonPressDialog(context, 'Github');
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                SignInButton(
                  Buttons.Twitter,
                  text: "Sign In with Twitter",
                  onPressed: () {
                    _showButtonPressDialog(context, 'Twitter');
                  },
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        )
            :_widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.green
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
                backgroundColor: Colors.yellow
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.blue,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5
      ),
    );
  }
  void _showButtonPressDialog(BuildContext context, String btn) {
    // Scaffold.of(context).showSnackBar(SnackBar(
    //   content: Text('$btn Button Pressed!'),
    //   backgroundColor: Colors.black26,
    //   duration: Duration(milliseconds: 400),
    // ));
  }
}