import 'package:flutter/material.dart';

import 'information.dart';

class Diseases extends StatefulWidget {
  final String name;


  Diseases(this.name);

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
              width: 300,

              margin: EdgeInsets.fromLTRB(40, 40, 40, 30),
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(10)),

            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    /* Clear the search field */
                  },
                ),
                hintText: 'Search...',
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

                    Navigator.push(context, MaterialPageRoute(builder: (Context) => Information()));

                  },
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.fromLTRB(55, 07, 55, 07),

                    child: Center(
                      child: Text(newDiseaseArr[index], textAlign: TextAlign.center, style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).primaryColor
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

  List<String> mainDiseaseArr =[ "Maleria", "Dengue", "Viral Fiver", "Chicken Pox","Maleria", "Dengue", "Viral Fiver", "Chicken Pox","Maleria", "Dengue", "Viral Fiver", "Chicken Pox", ];

  List<String> newDiseaseArr =[];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    newDiseaseArr = mainDiseaseArr;

  }

  onTextChanged(String value) {
    setState(() {

      newDiseaseArr = mainDiseaseArr.where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();

    });
  }


}
