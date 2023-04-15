import 'package:contact_dayri/screens/model_class.dart';
import 'package:flutter/material.dart';

class Missed_Screen extends StatefulWidget {
  const Missed_Screen({Key? key}) : super(key: key);

  @override
  _Missed_ScreenState createState() => _Missed_ScreenState();
}

class _Missed_ScreenState extends State<Missed_Screen> {
  List <Contact> con = [
    Contact(
      name: "Darshan",
      number: "1432132423"
    ),Contact(
        name: "Maulik",
        number: "123231232"
    ),Contact(
        name: "Dada",
        number: "1234567898"
    ),Contact(
        name: "Vivek",
        number: "0009991234"
    ),Contact(
        name: "mummy",
        number: "2312312323"
    ),Contact(
        name: "Uncle",
        number: "6565656565"
    ),Contact(
        name: "Nimit",
        number: "982334545"
    ),Contact(
        name: "Heet",
        number: "575775799"
    ),Contact(
        name: "Smit",
        number: "3434434453"
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Color(0xffF2FAFF),

          child: Column(
            children: [
              Row(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40,left: 80),
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                            child: Text("Receive",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40,right: 80),
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Text("Missed",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.white),
                    ),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.black38,
                    ),
                    label: Text("Search", style: TextStyle(color: Colors.black38)),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Contacttile(
                      name: con[index].name,
                      number: con[index].number,
                      img: con[index].image,
                    );
                  },
                  itemCount: con.length,
                ),
              ),

            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 60,
          width: double.infinity,
          color: Colors.indigo.shade100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/');
                  },
                  child: Icon(Icons.star,size: 30,)),
              InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, "add").then((value) {
                      setState(() {
                      });
                    });
                  },
                  child: Icon(Icons.person_add,size: 30,)),
              Icon(Icons.watch_later,size: 30),

            ],
          ),
        ),
        backgroundColor: Color(0xffF2FAFF),
      ),
    );
  }
  Widget Contacttile({String? name, String? number, String? img}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: Colors.white,
        title: Text("$name",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.red)),
        subtitle: Text(
          "$number",
          style: TextStyle(color: Colors.red, fontSize: 15),
        ),
       leading: CircleAvatar(
         backgroundColor: Colors.red,
         backgroundImage: AssetImage("aseets/Images/user.png"),
       ),
        trailing: Icon(
          Icons.info,
          color: Colors.red,
        ),
      ),
    );
  }
}
