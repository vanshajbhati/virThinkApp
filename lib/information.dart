import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:virthink/colors.dart';
import 'package:virthink/fetchProduct.dart';

import 'decodeImageJson.dart';

class Information extends StatefulWidget {


  final String subId;


  Information(this.subId);

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
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: infoArr.length,
              itemBuilder: (BuildContext context, int index) {

                var data = jsonDecode(responsesProduct.data![index].images.toString());

              final List<String> imageUrl = [];

                 imageUrl.add(data[0]['name'].toString());
                imageUrl.add(data[1]['name'].toString());
                print(data[0]['name'].toString());
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


                        margin: EdgeInsets.fromLTRB(25, 15, 25, 00),

                        child: Center(
                          child: Text(infoArr[index], textAlign: TextAlign.center, style: TextStyle(
                              fontSize: 18,
                              color: Colors.white
                          ),),
                        ),
                        decoration: BoxDecoration(
                            color: colorResource.primaryColor,
                            borderRadius: BorderRadius.circular(30)
                        ),

   ) ,




                   collapsed: Column(),





                       expanded: Container(
                         padding: EdgeInsets.all(5),

                         margin: EdgeInsets.fromLTRB(45, 00, 45, 15),
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

                    Container(
                      child: CarouselSlider(

                       options: CarouselOptions(
                         enlargeCenterPage: true,
                         autoPlay: true
                       ),

                        items: imageUrl
                            .map((item) => Container(
                          child: Center(child: Image.network("https://virthink.frantic.in/"+item.toString())),
                          color: Colors.green,
                        ))
                            .toList(),

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




  List<String> infoArr =[ ];

  late FetchProduct responsesProduct = FetchProduct();
  var dio = Dio();

  getData() async {

    print('http://virthink.frantic.in/RestApi/fetch_products/'+widget.subId);
    var responseSub = await dio.get('http://virthink.frantic.in/RestApi/fetch_products/'+widget.subId);
    setState(() {
      responsesProduct = FetchProduct.fromJson(responseSub.data);
    });





    for(int i=0; i<responsesProduct.data!.length; i++) {
            infoArr.add(responsesProduct.data![i].name.toString());


    }






  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();






  }

}

