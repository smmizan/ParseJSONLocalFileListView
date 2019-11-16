import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:convert';


void main()
{
  runApp(MaterialApp(title :'Home', home : MyHomePag()));
}


class MyHomePag extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePag> {
  List myList;

  Future<String> loadingMyJsonData() async{
    var myJSON = await rootBundle.loadString('assets/mylist.json');
    setState(() {
      myList= json.decode(myJSON);
    });
    return 'success';
  }


@override
void initState() {

  this.loadingMyJsonData();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text("App Bar"),),
        


      body: ListView.builder(
        itemCount: myList.length,
        itemBuilder:(BuildContext context,int index){
          return Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(child: Text(myList[index]['name'][0])),
                title: Text(myList[index]['name']),
                subtitle: Text(myList[index]['total']),
              ),
              
            ],
          );

        },
      )
      
    );
  }
}


// class MyHomePage extends StatelessWidget{
//   String txt ="StateLess Widget";

//   @override
//   Widget build(BuildContext context)
//   {
//     return Scaffold(
//       appBar: AppBar(title: Text("App Bar"),),
//       body: 
//       ListView(
//         children: <Widget>[
//             Text(txt),
//             RaisedButton(
//               child: Text("Raised Button"),
//               onPressed: ()
//               {
//                 print("you click Raised button");
//                 txt = "State Full Wigdet";
//               },
//             )

//         ],
//       )
      
//     );
//   }

// }