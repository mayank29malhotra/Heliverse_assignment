import 'package:flutter/material.dart';
import 'screens/UserListScreen.dart';
import 'package:provider/provider.dart';
import 'provider/userProvider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserListProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserListScreen(),
    );
  }
}






