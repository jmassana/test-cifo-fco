import 'package:flutter/material.dart';

class TasksPage extends StatefulWidget {

  Function(List<String>)? onAdded;
  List<String> tasks;

  TasksPage({
    super.key,
    this.onAdded,
    required this.tasks
  });

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {

  TextEditingController taskContent = TextEditingController();
  FocusNode focusText = FocusNode();

  void addTask(String task){
    setState(() {
      widget.tasks.add(task);
    });

    if(widget.onAdded != null){
      widget.onAdded!(widget.tasks);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: widget.tasks.length,
          itemBuilder: (contex,index){
            return ListTile(title: Text(widget.tasks[index]),);
          }),

      floatingActionButton: FloatingActionButton(
        onPressed: (){

          taskContent.text = "";

          //ESTO DE AQUI ACTIVA EL FOCO AUTOMATICAMENTE
          Future.delayed(Duration(milliseconds:300),(){
            focusText.requestFocus();
          });
          //AQUI ABRIRÉ EL DIALOGO PARA INTRODUCIR UNA NUEVA TAREA
          showDialog(

              context: context,
              builder: (context){


                return AlertDialog(
                  title: Text("Añade nueva nota"),
                  content: TextFormField(
                    focusNode: focusText,
                    controller: taskContent,
                    decoration: InputDecoration(
                      hintText: "Introduce tu nota"
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: (){
                        addTask(taskContent.text);
                        Navigator.of(context).pop();
                      },
                      child: Text("Aceptar"),
                    )
                  ],
                );
              });

        },
        child:Icon(Icons.add)
      ),
    );
  }
}