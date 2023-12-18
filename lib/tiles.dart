import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

 class Tiles extends StatelessWidget {
  final String taskName;
  final String deadline;
  final bool isTaskCompleted;
  Function(bool?)? checkBoxChanged;
  Function(BuildContext) deleteTask;

   Tiles({ 
    super.key,
    required this.taskName,
    required this.deadline,
    required this.isTaskCompleted, 
    required this.checkBoxChanged,
    required this.deleteTask,
    });

  @override
  Widget build(BuildContext context) {
    return Container( 
      margin: EdgeInsets.only(bottom: 20),
      height: 75,
      decoration: BoxDecoration( 
        color: const Color.fromARGB(255, 255, 138, 177),
        borderRadius: BorderRadius.only( topLeft: Radius.circular(25),bottomRight: Radius.circular(25)),
        boxShadow: [BoxShadow( 
          color: const Color.fromARGB(255, 214, 183, 193),
          spreadRadius: 3,
          blurRadius: 4,
          offset: Offset(0, 3)
        )]
      ),


      child:Slidable( 
        endActionPane: ActionPane(motion: StretchMotion(),
         children: [ 
          SlidableAction( 
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(25)),
                backgroundColor: const Color.fromARGB(255, 234, 52, 49),
                onPressed: deleteTask,
                icon: Icons.delete,)
         ]),
          child: Row( 
        children: [
          //checkbox
          Checkbox(value: isTaskCompleted, onChanged: checkBoxChanged, activeColor: Colors.pink[200],checkColor: Colors.black,shape: CircleBorder(),),
          //textfield
          Padding(padding: EdgeInsets.only(top: 23),
          child:Column( children: [ 
          Text(taskName,style: TextStyle(fontSize: 18,decoration:isTaskCompleted?TextDecoration.lineThrough  :TextDecoration.none),),
           deadline==''?Text('')
         : Row(
            children: [
            SvgPicture.asset('assets/deadline.svg',height: 20,width: 20,),
            Text(deadline,style: TextStyle(fontStyle: FontStyle.italic),),
          ],)
          ],) ,
          )
          
        ],
      ),
      )
      
    );
  }
}