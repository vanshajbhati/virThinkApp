


import 'package:flutter/material.dart';
import 'package:virthink/disease.dart';

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
        body:Column(

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
              itemCount: homeArr.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (Context) => Diseases(homeArr[index])));
                  },
                  child: Container(
                    height: 50,


                    margin: EdgeInsets.fromLTRB(55, 15, 55, 15),

                    child: Center(
                      child: Text(homeArr[index], textAlign: TextAlign.center, style: TextStyle(
                          fontSize: 18,
                        color: Colors.white
                      ),),
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
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
        Flexible(
          child: DrawerHeader(

    decoration: BoxDecoration(
    ),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         SizedBox(

           height: 70,
           child:  Image.asset('assets/drawerHeaderAvatar.png', alignment: Alignment.centerLeft,),
         ),
         Text("Hi, Yash Mahrotra", textAlign: TextAlign.left, style: TextStyle(
           color:Theme.of(context).primaryColor,
           fontWeight: FontWeight.bold,
           fontSize: 30
         ), )
       ],
     ),

   ),
        ),
        ListTile(
          title: const Text('Home'),

          leading: IconButton(
            onPressed: (){

            },
            icon: Image.asset('assets/homeIcon.png'),
          ),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('About Us'),
          leading: IconButton(
            onPressed: (){

            },
            icon: Image.asset('assets/homeIcon.png'),
          ),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('Contact Us'),
          leading: IconButton(
            onPressed: (){

            },
            icon: Image.asset('assets/homeIcon.png'),
          ),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('Terms & Conditions'),
          leading: IconButton(
            onPressed: (){

            },
            icon: Image.asset('assets/homeIcon.png'),
          ),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('Privacy Policy'),
          leading: IconButton(
            onPressed: (){

            },
            icon: Image.asset('assets/homeIcon.png'),
          ),

          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('FAQ'),
          leading: IconButton(
            onPressed: (){

            },
            icon: Image.asset('assets/homeIcon.png'),
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

   List<String> homeArr =[ "Medical", "Education", "Category 1", "Category 2"];


}
