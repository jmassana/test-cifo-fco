import 'package:flutter/material.dart';
import 'package:tabs/pages/analitycs_page.dart';
import 'package:tabs/pages/tasks_page.dart';

class TabsPage extends StatefulWidget {
  TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _currentIndex = 0;

  List<String> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:_currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.task),label:"Tasks"),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label:"Analytics")
        ]
      ),
      body: Builder(
        builder: (context){

          switch(_currentIndex){
            case 0:
              return TasksPage(
                onAdded:(value){
                  tasks = value;
                  print("EL NUMERO DE TAREAS ES ${tasks.length}");
                },
                tasks: tasks,
              );
            case 1:
              return AnalitycsPage(
                  nTasks:tasks.length,
                  onButtonClick:(){
                    setState(() {
                      _currentIndex = 0;
                    });
                  }
              );
          }

          return Container();
        },
      )
    );
  }
}




