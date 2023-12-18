import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todoapp/alertbox.dart';
import 'package:todoapp/tiles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   List toDoList=[ 
      ['Make dinner', false,'15th oct'],
      ['Do homework',true,'tuesday']
    ];


  @override
  void initState(){ 
    super.initState();
  }

  final _controller=TextEditingController();
  final _deadlineController=TextEditingController();
  

   void saveNewTodoTask(){ 
      setState(() {
        toDoList.add([_controller.text,false,_deadlineController.text]);
        _controller.clear();
        _deadlineController.clear();
      });
      Navigator.of(context).pop();
    }

    void addNewTask(){ 
      showDialog( 
        context: context, 
        builder: (context){ 
          return AlertDialogBox( 
            controller: _controller,
            deadlineController: _deadlineController,
            saveNewTask: saveNewTodoTask,
            cancelNewTask: () => Navigator.of(context).pop(),
          );
        });
    }

    void checkBox(bool? value,int index){
      setState(() {
        toDoList[index][1]=!toDoList[index][1];
      });
    }

    void deleteATask(int index){ 
      setState(() {
        toDoList.removeAt(index);
      });
    }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold( 
      backgroundColor: const Color.fromARGB(255, 249, 194, 213),
      appBar: _appBar(),
      
      body: ListView.builder( 
        padding: EdgeInsets.all(30),
        itemCount: toDoList.length,

        itemBuilder: (context, index){ 
          return Tiles( 
            taskName: toDoList[index][0],
            isTaskCompleted: toDoList[index][1],
            deadline: toDoList[index][2],
            checkBoxChanged: (value)=>checkBox(value,index),
            deleteTask: (context)=>deleteATask(index),
          );
        },
        ),

        floatingActionButton: FloatingActionButton( 
          onPressed: addNewTask,
          child: Icon(Icons.add),
          backgroundColor: const Color.fromARGB(255, 255, 138, 177),
          ),
    );
  }

  AppBar _appBar() {
    return AppBar( 
      // leading: SvgPicture.asset('assets/todo.svg',height: 40,width: 40,),
      // title: Text('To-Do',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
      title: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [ 
        Text('To-Do',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
        SvgPicture.asset('assets/todo.svg',height: 40,width: 40,),
      ],),
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 255, 138, 177),
      shadowColor: Colors.pink[200],
      elevation: 5,
       shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0)
                )
              )
    );
  }
}