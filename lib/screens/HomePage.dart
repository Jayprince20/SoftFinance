import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

class HomePage extends StatefulWidget {
  //const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: 450,
            color: Colors.blue,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Icons"),
                        )
                      ],
                    ),
                    Text("Hello")
                  ],
                ),
                SizedBox(height: 60,),
                Text("Balance", style: TextStyle(fontSize:20)),
                SizedBox(height: 30,),
                Text("26, 520", style: TextStyle(fontSize: 30),),
              ],
            )),
      ),
      bottomNavigationBar: DotNavigationBar(
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: _handleIndexChanged,
        // dotIndicatorColor: Colors.black,
        items: [
          /// Home
          DotNavigationBarItem(
            icon: Icon(Icons.home),
            selectedColor: Colors.blue,
          ),

          /// Likes
          DotNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            selectedColor: Colors.blue,
          ),

          /// Search
          DotNavigationBarItem(
            icon: Icon(Icons.history),
            selectedColor: Colors.blue,
          ),

          /// Profile
          DotNavigationBarItem(
            icon: Icon(Icons.person),
            selectedColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}

enum _SelectedTab { home, favorite, search, person }
