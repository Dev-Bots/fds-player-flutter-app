
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Center(
              child: SizedBox(
                height: 250,
                child: DrawerHeader(
                  child: Column(
                    children: const [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/pic.jpg'),
                        radius: 50,
                      ),
                      SizedBox(height: 25),
                      Text('John Doe',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              ),
            ),
            CustomDivider(),
            ListTile(
              leading: const Icon(Icons.home),
              trailing: Icon(
                Icons.navigate_next_outlined,
                color: Colors.grey.shade600,
              ),
              title: const Text('Home'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            CustomDivider(),
            ListTile(
              leading: const Icon(Icons.person),
              trailing: Icon(
                Icons.navigate_next_outlined,
                color: Colors.grey.shade600,
              ),
              title: const Text('Profile'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            CustomDivider(),
            ListTile(
              leading: const Icon(Icons.event),
              trailing: Icon(
                Icons.navigate_next_outlined,
                color: Colors.grey.shade600,
              ),
              title: const Text('Attended Event'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            CustomDivider(),
          ],
        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0,
      thickness: 0.05,
      indent: 20,
      endIndent: 20,
      color: Colors.grey.shade600,
    );
  }
}
