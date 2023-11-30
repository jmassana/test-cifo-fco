import 'package:flutter/material.dart';

class AnalitycsPage extends StatelessWidget {

  int nTasks;
  Function? onButtonClick;

  AnalitycsPage({
    super.key,
    required this.nTasks,
    this.onButtonClick
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("N TAREAS: ${nTasks}"),
        TextButton(onPressed: (){
            if(onButtonClick != null){
                onButtonClick!();
            }
            //AQUI DEBO IMPLEMENTAR
            // LA LOGICA PARA IRME AL TAB TASKS
        }, child: Text("IR AL TAB TASKS"))
      ],
    ));
  }
}