import 'package:flutter/material.dart';
import 'package:third/home_page.dart';
import 'package:third/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //to hide the debug sign at the top
      theme: ThemeData(primarySwatch: Colors.green),
      home: const Rootpage(),
    );
  }
}

class Rootpage extends StatefulWidget {
  const Rootpage({super.key});

  @override
  State<Rootpage> createState() => _RootpageState();
}

class _RootpageState extends State<Rootpage> {
  int currentpage = 0;
  List<Widget> pages = const [HomePage(), Profilepage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter'),
      ),
      body: pages[currentpage], //homepage//1 is profile page
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('floating action button');
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'home'),
          NavigationDestination(icon: Icon(Icons.person), label: 'profile'),
        ],
        onDestinationSelected: (int index) {
          //is the index of the current page
          setState(() {
            //we should add a state because stateless widget dont refresh the page we nedd stateful widget in order to refresh the page and change from one icon to the other
            currentpage = index;
          });
        },
        selectedIndex: currentpage,
      ),
    );
  }
}
