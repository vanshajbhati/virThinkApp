import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:virthink/colors.dart';
import 'package:virthink/fetchSubCategory.dart';

import 'apiModelClass.dart';
import 'information.dart';

class Diseases extends StatefulWidget {
  final String mainId;


  Diseases(this.mainId);

  @override
  _DiseasesState createState() => _DiseasesState();
}

class _DiseasesState extends State<Diseases> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
      backgroundColor: Colors.white,
      body:Column(
        children: [

          Container(
            height: 40,

              padding: EdgeInsets.only(left: 10),

              margin: EdgeInsets.fromLTRB(35, 40, 35, 30),
            decoration: BoxDecoration(
              boxShadow: [ BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
              )],
                color: Colors.white, borderRadius: BorderRadius.circular(10)),

            child: TextField(
              decoration: InputDecoration(

                suffixIcon: Container(

                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                       color: colorResource.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.search
                ,color: Colors.white,  ),
                ),
                hintText: ' Search... here........',
                border: InputBorder.none),
              onChanged: onTextChanged,
            ),
          ),

          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: newDiseaseArr.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder: (Context) => Information(responsesSub.data![index].id.toString())));

                  },
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.fromLTRB(28, 15, 28, 15),

                    child: Center(
                      child: Text(newDiseaseArr[index], textAlign: TextAlign.center, style: TextStyle(
                          fontSize: 18,
                          color: colorResource.primaryColor
                      ),),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),],
                    ),







                  ),
                );



              },),
          ),
        ],
      ),








    );
  }



  List<String> mainDiseaseArr =[];


  List<String> newDiseaseArr =[];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
    newDiseaseArr = mainDiseaseArr;

  }

  onTextChanged(String value) {
    setState(() {

      newDiseaseArr = mainDiseaseArr.where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();

    });
  }





  late FetchSubCategory responsesSub = FetchSubCategory();
  var dio = Dio();

  getData() async {

    print('http://virthink.frantic.in/RestApi/fetch_sub_category/'+widget.mainId);
    var responseSub = await dio.get('http://virthink.frantic.in/RestApi/fetch_sub_category/'+widget.mainId);
    setState(() {
      responsesSub = FetchSubCategory.fromJson(responseSub.data);
    });


     print(responsesSub.data![1].name);

    for(int i=0; i<responsesSub.data!.length; i++) {
      mainDiseaseArr.add(responsesSub.data![i].name.toString());
    }


    print(mainDiseaseArr[1]);

  }

}
