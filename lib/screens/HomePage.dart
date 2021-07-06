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
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff36cbf2),
                Color(0xff34d8f3),
                Color(0xff3cbff0),
              ],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
            ),
          ),
          height: 400,
          //color: Color(0xff36cbf2),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                          child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: CircleAvatar(
                              maxRadius: 25,
                              backgroundImage:
                                  AssetImage("assets/icons/twitch.jpg"),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Hello",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("One Achmad",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20))
                            ],
                          ),
                        ],
                      ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(children: [
                      Icon(
                        Icons.notifications_outlined,
                        size: 40,
                        color: Colors.white,
                      ),
                      Positioned(
                          right: 10,
                          bottom: 22,
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            maxRadius: 5,
                          ))
                    ]),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text("Balance",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              SizedBox(
                height: 15,
              ),
              Text(
                "\$26,520",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Card(
                      name: Icons.send,
                      text: "Send",
                    ),
                    Card(
                      name: Icons.wallet_giftcard,
                      text: "Top Up",
                    ),
                    Card(
                      name: Icons.payment,
                      text: "Pay",
                    ),
                    Card(
                      name: Icons.dashboard,
                      text: "More",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(90.0),
                      topRight: Radius.circular(90.0),
                    ),
                  ),
                  child: Row(  
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Last Transaction",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
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

class Card extends StatelessWidget {
  const Card({
    this.name,
    this.text,
    Key key,
  }) : super(key: key);
  final String text;
  final IconData name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Color(0xff36cbf2).withOpacity(0.7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                name,
                color: Colors.white,
              )),
        ),
        Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 20),
        )
      ],
    );
  }
}

enum _SelectedTab { home, favorite, search, person }
