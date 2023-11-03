import 'package:flutter/material.dart';

sealed class WeatherTheme {
  ThemeData getTheme();
}

class LightTheme extends WeatherTheme {
  @override
  ThemeData getTheme() {
    return ThemeData.light().copyWith(
        useMaterial3: true,
        navigationRailTheme: const NavigationRailThemeData(
            unselectedLabelTextStyle: TextStyle(color: Colors.grey),
            selectedLabelTextStyle:
                TextStyle(color: Colors.indigo, fontSize: 16),
            selectedIconTheme: IconThemeData(color: Colors.indigo, size: 30),
            unselectedIconTheme: IconThemeData(color: Colors.grey)),
        switchTheme: SwitchThemeData(
            thumbColor:
                MaterialStateProperty.resolveWith((states) => Colors.black26),
            trackColor: MaterialStateProperty.resolveWith(
                (states) => Colors.blueGrey)));
  }
}

class DarkTheme extends WeatherTheme {
  @override
  ThemeData getTheme() {
    return ThemeData.dark().copyWith(
        useMaterial3: true,
        navigationRailTheme: const NavigationRailThemeData(
            unselectedLabelTextStyle: TextStyle(color: Colors.grey),
            selectedLabelTextStyle:
                TextStyle(color: Colors.white, fontSize: 16),
            selectedIconTheme: IconThemeData(color: Colors.white, size: 30),
            unselectedIconTheme: IconThemeData(color: Colors.grey)),
        switchTheme: SwitchThemeData(
            thumbColor:
                MaterialStateProperty.resolveWith((states) => Colors.black26),
            trackColor: MaterialStateProperty.resolveWith(
                (states) => Colors.blueGrey)));
  }
}
