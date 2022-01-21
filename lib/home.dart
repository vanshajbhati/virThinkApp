


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:virthink/colors.dart';
import 'package:virthink/disease.dart';

import 'apiModelClass.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
  key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
         leading: IconButton(
           onPressed: () => _scaffoldKey.currentState!.openDrawer(),

           icon: Image.asset('assets/homeIcon.png'),
         ),
      ),
        backgroundColor: Colors.white,
        body: responses.data == null ? Text("hghg"): Column(

          children: [





            Container(
                width: 300,
                height: 150,

                margin: EdgeInsets.fromLTRB(20, 00, 20, 30),

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





            ListView.builder(
              shrinkWrap: true,
              itemCount: responses.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder: (Context) => Diseases(responses.data![index].id.toString())));
                  },
                  child: Container(
                    height: 50,


                    margin: EdgeInsets.fromLTRB(25, 15, 25, 15),

                    child: Center(
                      child: Text(responses.data![index].name.toString(), textAlign: TextAlign.center, style: TextStyle(
                          fontSize: 18,
                        color: Colors.white
                      ),),
                    ),
                    decoration: BoxDecoration(
                      color: colorResource.primaryColor ,
                      borderRadius: BorderRadius.circular(30)
                    ),




                    ),
                );



              },)

          ],
        ),




   drawer: Drawer(
    child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
      children: [

        Container(
            margin: EdgeInsets.fromLTRB(20, 40, 60, 40),


          child:  Image.asset('assets/virthink.png', alignment: Alignment.centerLeft,),
        ),
        ListTile(
          title: const Text('Home',  style: TextStyle(
             fontSize: 18
          ),),

          leading: IconButton(
            onPressed: (){

            },
            icon: Image.asset('assets/home (3).png', ),
          ),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('About Us',style: TextStyle(
    fontSize: 18
    ),),
          leading: IconButton(
            onPressed: (){

            },
            icon: Image.asset('assets/team.png'),
          ),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('Contact Us',style: TextStyle(
    fontSize: 18
    ),),
          leading: IconButton(
            onPressed: (){

            },
            icon: Image.asset('assets/support.png'),
          ),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('Terms & Conditions',style: TextStyle(
    fontSize: 18
    ),),
          leading: IconButton(
            onPressed: (){

            },
            icon: Image.asset('assets/terms-and-conditions.png'),
          ),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('Privacy Policy',style: TextStyle(
    fontSize: 18
    ),),
          leading: IconButton(
            onPressed: (){

            },
            icon: Image.asset('assets/privacy-policy (1).png'),
          ),

          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('FAQ',style: TextStyle(
    fontSize: 18
    ),),
          leading: IconButton(
            onPressed: (){

            },
            icon: Image.asset('assets/faq.png'),
          ),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
      ],
    ),
    ),



    );


  }




@override
  void initState() {
    super.initState();

    getData();

  }

  late fetchMainCategory responses = fetchMainCategory();
  var dio = Dio();

   getData() async {


    var response = await dio.get('http://virthink.frantic.in/RestApi/fetch_category');
    setState(() {
      responses = fetchMainCategory.fromJson(response.data);
    });



  }
}
