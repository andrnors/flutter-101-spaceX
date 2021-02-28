
import 'package:flutter/material.dart';
import 'package:rockets/screens/home/rockets/rocket_list.dart';

import 'crew/crew_member_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;
  var _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ROCKET GUIDE'),
      ),
      body: PageView(

        controller: _pageController,
        children: [
          RocketList(),
          CrewMemberList(),
        ],
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        elevation: 20,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Text('🚀'), label: 'Rockets'),
          BottomNavigationBarItem(icon: Text('🧑'), label: 'Crew'),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      //using this page controller you can make beautiful animation effects
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.easeInSine);
    });
  }
}
