import 'package:flutter/material.dart';
import 'package:tabs/pages/tabs_page.dart';


void main(){
  runApp(TabsApp());
}

class TabsApp extends StatelessWidget {

  const TabsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabsPage()
    );
  }
}
