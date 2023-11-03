import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class NavigationWidget extends StatelessWidget {
  const NavigationWidget({
    super.key, required this.shell,
  });
  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    if(width<=500) {
      return Scaffold(
      body: shell,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          shell.goBranch(index);
        },
        selectedIndex: shell.currentIndex,
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.settings_outlined), label: 'Settings'),
        ],
      ),
    );
    }else{
      return Scaffold(
        body:Row(
          children: [
            NavigationRail(
              labelType: NavigationRailLabelType.all,
              onDestinationSelected: (index) {
                shell.goBranch(index);
              },
              selectedIndex: shell.currentIndex,
              destinations: const [
                NavigationRailDestination(
                    icon: Icon(Icons.home_outlined), label: Text('Home')),
                NavigationRailDestination(
                    icon: Icon(Icons.settings_outlined), label: Text('Settings')),
              ],
            ),
            Expanded(child: shell)
          ],
        )
      );
    }
  }
}