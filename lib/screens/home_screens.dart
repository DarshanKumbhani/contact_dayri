import 'dart:io';

import 'package:contact_dayri/screens/model_class.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

List<Contact> Contactlist = [
  Contact(
    name: "Your Contact",
  ),
  Contact(
    name: "Chota Bheem",
    number: "9999888877",
  ),
  Contact(
    name: "Chutki",
    number: "0000999900",
  ),
  Contact(
    name: "Kaliya",
    number: "1111111111",
  ),
  Contact(
    name: "Indumati",
    number: "3334445556",
  ),
  Contact(
    name: "Tuntun mosi",
    number: "1234567890",
  ),
  Contact(
    name: "Raju",
    number: "1232312311",
  ),
  Contact(
    name: "Jaggu bander",
    number: "0987654321",
  ),
  Contact(
    name: "Daku Mangalsinh",
    number: "2345643452",
  ),
  Contact(
    name: "Motu",
    number: "5675835738",
  ),
  Contact(
    name: "Patlu",
    number: "0000000000",
  ),
  Contact(
    name: "John Banega Don",
    number: "3046738546",
  ),
  Contact(
    name: "DR.zatka",
    number: "7777777777",
  ),
];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtnumber = TextEditingController();
  var txtkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            color: Color(0xffF2FAFF),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Center(
                    child: Text(
                      "Contact",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff3E98E4),
                          fontSize: 30),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
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
                      label: Text("Search",
                          style: TextStyle(color: Colors.black38)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 280),
                  child: Text(
                    "My Contacts",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff3E98E4)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Contacttile(
                  index,
                  Contactlist[index],
                );
              },
              itemCount: Contactlist.length,
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        color: Colors.indigo.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.star,
              size: 30,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "add").then((value) {
                    setState(() {});
                  });
                },
                child: Icon(
                  Icons.person_add,
                  size: 30,
                )),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'history');
                },
                child: Icon(Icons.watch_later, size: 30)),
          ],
        ),
      ),
      backgroundColor: Color(0xffF2FAFF),
    ));
  }

  Widget Contacttile(int index, Contact c1) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        title: Text("${c1.name}",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xff3E98E4))),
        subtitle: Text(
          "${c1.number}",
          style: TextStyle(color: Color(0xff3E98E4), fontSize: 15),
        ),
        leading: (c1.image == null)
            ? CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("aseets/Images/user.png"),
              )
            : CircleAvatar(
                backgroundImage: FileImage(File("${c1.image}")),
              ),
        trailing: InkWell(
          onTap: () async {
            String link = "tel:${c1.number} ";
            await launchUrl(Uri.parse(link));
          },
          child: Icon(
            Icons.call,
            color: Color(0xff3E98E4),
          ),
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    Contactlist.removeAt(index);
                  });
                },
                icon: Icon(Icons.delete),
                color: Colors.red,
              ),
              IconButton(
                onPressed: () {
                  txtname = TextEditingController(text: c1.name);
                  txtnumber = TextEditingController(text: c1.number);

                  upDialogue(index);
                },
                icon: Icon(Icons.edit),
                color: Colors.green.shade300,
              ),
              IconButton(
                onPressed: () async {
                  String link = "sms:${c1.number}";
                  await launchUrl(Uri.parse(link));
                },
                icon: Icon(Icons.message),
                color: Colors.blue,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.video_call),
                color: Colors.black,
                style: IconButton.styleFrom(iconSize:


                40),
              ),
              IconButton(
                onPressed: () {
                  Share.share("${c1.image} & ${c1.name} & ${c1.number}");
                },
                icon: Icon(Icons.share),
                color: Colors.amber,
              )
            ],
          )
        ],
      ),
    );
  }

  void upDialogue(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter your name";
                  }
                },
                controller: txtname,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3E98E4), width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3E98E4), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Color(0xff3E98E4)),
                  ),
                  label: Text("First name",
                      style: TextStyle(color: Color(0xff3E98E4))),
                  suffixIcon: Icon(
                    Icons.person_add_alt,
                    color: Color(0xff3E98E4),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value?.length != 10) {
                    return "Please Enter 10 Number";
                  }
                },
                controller: txtnumber,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3E98E4), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Color(0xff3E98E4)),
                  ),
                  label: Text("Number",
                      style: TextStyle(color: Color(0xff3E98E4))),
                  suffixIcon: Icon(
                    Icons.call,
                    color: Color(0xff3E98E4),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (txtkey.currentState!.validate()) {
                      String Nname = txtname.text;
                      String Nnumber = txtnumber.text;

                      setState(() {
                        Contactlist[index] =
                            Contact(name: Nname, number: Nnumber);
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: Text("Update"))
            ],
          ),
        );
      },
    );
  }
}
