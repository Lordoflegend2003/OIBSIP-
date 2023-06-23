import 'package:flutter/material.dart';
import 'package:todoapp/model/model.dart';

void main() {
  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(useMaterial3: true),
    themeMode: ThemeMode.dark,
    home: const MyHomePage(),
  ));
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    List<TodoModel> todolist = [];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO.'),
        centerTitle: true,
      ),
      body: Visibility(
        replacement: const Center(child: Text("Add Some Task" , style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.w200,
        ),)),
        visible: todolist.isNotEmpty,
        child: ListView.builder(
          itemCount: todolist.length,
          itemBuilder: (context , index){
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                child: ListTile(title:Text(todolist[index].name , style: TextStyle(
                  fontSize: 25.0,
                  decoration: todolist[index].iscompleted?TextDecoration.lineThrough:null,
                ),
                ),
              trailing: Checkbox(value: todolist[index].iscompleted,onChanged: (value){
                todolist[index].iscompleted = value!;
                setState(() {
                  
                });
              }),
                ),
              ),
            );

          }
        ),
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
        String inputext = "";
        showDialog(context: context, builder: (context){
          return AlertDialog(
            title: const Text("Add Task"),
            content: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
              ),
              onChanged: (value) {
              inputext = value;
            },),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(style:ElevatedButton.styleFrom(
                    minimumSize: const Size(120,40)
                  ),onPressed: (){
                    Navigator.pop(context);
                  }, child: const Text("cancel")),
                  ElevatedButton(style:ElevatedButton.styleFrom(
                    minimumSize: const Size(120,40)
                  ),onPressed: (){
                  if(inputext!=""){
                    todolist.add(TodoModel(name: inputext));
                    setState(() {
                      
                    });
                  Navigator.pop(context);
                  }
                  }, child: const Text("Add")),
                ],
              )
            ],

          );
        }); 
      },
      child: const Icon(Icons.add , size: 30
      ),
      ),
    );
  }
}
