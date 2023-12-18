import 'package:flutter/material.dart';
import 'package:todoapp/buttons.dart';

class AlertDialogBox extends StatelessWidget {
  final controller;
  final deadlineController;
  VoidCallback saveNewTask;
  VoidCallback cancelNewTask;
  AlertDialogBox({ 
    super.key,
    required this.controller,
    required this.deadlineController,
    required this.saveNewTask,
    required this.cancelNewTask
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog( 
      backgroundColor: const Color.fromARGB(255, 249, 194, 213),
      content: Container( 
        padding: EdgeInsets.only(top: 25),
        // height: 170,
        height: 220,
        child: Column(children: [ 
          //text field 
          TextField( 
            controller: controller,
            decoration: InputDecoration(border: OutlineInputBorder(),  
                                        hintText: 'Enter a new task'),
                      ),
          SizedBox(height: 10,),
          SizedBox(height: 45,
          child: TextField( 
            controller: deadlineController,
            decoration: InputDecoration(border: OutlineInputBorder(),  
                                        hintText: 'Any Deadlines?'),
          ),),
          
          SizedBox(height: 17,),
          //buttons for save and cancel
          Row( 
            children: [ 
              Buttons(buttonText: 'Save',onButtonPress: saveNewTask,),
              SizedBox(width: 52,),
              Buttons(buttonText: 'Cancel',onButtonPress: cancelNewTask)
            ],
          )
        ]),
        ),
        
    );
  }
}