import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },

          icon: Image.asset('assets/back.png'),
        ),
      ),
      body:    SingleChildScrollView(
        child: Column(
          children: [


            ListView.builder(
              shrinkWrap: true,
              itemCount: infoArr.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){

                  },
                  child: ExpandablePanel(

                    theme: ExpandableThemeData(
                      hasIcon: false
                    ),
                      header:
                      Container(
                        height: 50,


                        margin: EdgeInsets.fromLTRB(55, 15, 45, 00),

                        child: Center(
                          child: Text(infoArr[index], textAlign: TextAlign.center, style: TextStyle(
                              fontSize: 18,
                              color: Colors.white
                          ),),
                        ),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(30)
                        ),

   ) ,




                   collapsed: Column(),





                       expanded: Container(

                         margin: EdgeInsets.fromLTRB(75, 00, 75, 15),
                         decoration: BoxDecoration(
                           border: Border.all(),

                         ),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Container(


                               child:  Text(infoArr[index] + " : " , style: TextStyle(
                                 fontSize: 20, color: Colors.blueGrey
                               ),),
                             ),

                             Padding(padding: EdgeInsets.fromLTRB(00, 10, 00, 10)),
                             Text("SUB HEADING", style: TextStyle(
                               color: Colors.grey
                             ),),

                             Padding(padding: EdgeInsets.fromLTRB(00, 10, 00, 10)),
                             Text("Malaria is a life-threatening disease caused by parasites that are transmitted to people through the bites of infected female Anopheles mosquitoes. It is preventable and curable. In 2020, there were an estimated 241 million cases of malaria worldwide. ",),
                           ],
                         ),
                       )),
                );



              },),


            Container(
              width: 300,
              height: 150,


              margin: EdgeInsets.fromLTRB(20, 100, 20, 30),

              child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 80,
                      child: Image.asset("assets/virthink.png", ),
                    ),
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",textAlign: TextAlign.center,
                      style: TextStyle(
                      ),)
                  ]
              ),),


          ],
        ),
      ),









    );


  }

  List<String> infoArr =[ "Precautions", "Causes", "Symptoms", "Loream"];
}

