import 'package:flousak/pages/account.dart';
//import 'package:flousak/pages/add.dart';
import 'package:flousak/pages/history.dart';
import 'package:flousak/pages/home.dart';
import 'package:flousak/pages/stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int tabindex = 0;

  String? selectedItem;

  onChangeTab(int index) {
    setState(() {
      tabindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: tabindex,
      children: [home(), History(), /*Add(),*/ stats(), account()],
    );
  }

  Widget getFooter() {
    return BottomNavigationBar(
      onTap: onChangeTab,
      currentIndex: tabindex,
      backgroundColor: Color.fromARGB(255, 2, 4, 48),
      fixedColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      elevation: 15,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.history,
            color: Colors.white,
          ),
          label: 'History',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(
        //     Icons.add,
        //     color: Colors.white,
        //   ),
        //   label: 'Adding',
        // ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.query_stats,
            color: Colors.white,
          ),
          label: 'Stats',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: Colors.white,
          ),
          label: 'Account',
        ),
      ],
    );
  }
}
