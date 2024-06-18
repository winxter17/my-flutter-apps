import 'package:firstapp1/pages/home_page.dart';
import 'package:firstapp1/pages/profile_page.dart';
import 'package:firstapp1/pages/settings.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final List<Widget> _pages = [
    HomePage(),
    Settings(),
    ProfilePage()
  ];

  int _selectedIndex = 0;

  void _navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      appBar: AppBar(title: Text("First page"),
      backgroundColor: Colors.deepPurple[200],),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
          label: 'HOME',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
          label: 'SETTINGS',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
          label: 'PROFILE',
        )
      ],),

      // drawer: Drawer(
      //   backgroundColor: Colors.deepPurple[200],
      //
      //   child: Column(
      //     children: [
      //       DrawerHeader(child: Icon(
      //         Icons.favorite,
      //         size: 48,
      //       ),),
      //       ListTile(
      //         leading: Icon(Icons.home),
      //         title: Text("H O M E"),
      //         onTap: (){
      //           Navigator.pop(context);
      //           Navigator.pushNamed(context, '/homepage');
      //         },
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.settings),
      //         title: Text("S E T T I N G S"),
      //         onTap: (){
      //           Navigator.pop(context);
      //           Navigator.pushNamed(context, '/settings');
      //
      //         },
      //
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
