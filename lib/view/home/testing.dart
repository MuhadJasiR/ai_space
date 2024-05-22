import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600) {
          return Scaffold(
            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    title: const Text('Home'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('About'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Contact'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            body: Center(
              child: Text('Main Content'),
            ),
          );
        } else {
          return Scaffold(
            body: Row(
              children: [
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 66, 71, 75),
                  ),
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          'Home',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text(
                          'About',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text(
                          'Contact',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text('Main Content'),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
