import 'package:contact_dayri/screens/model_class.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<Contact> con = [
    Contact(
      name: "Darshan",
      number: "3030405093",
    ),
   Contact(name: "kano", number: "4545332345"),
    Contact(name: "aunty", number: "0808760506"),
    Contact(name: "kaushik", number: "3451235678"),
    Contact(name: "Papa", number: "562380998"),
    Contact(name: "Darshan", number: "3030405093"),
    Contact(name: "bhai", number: "3456791234"),
    Contact(name: "Diiii", number: "0988900988"),
    Contact(name: "Masi", number: "3030405093"),
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
                    padding: const EdgeInsets.only(top: 40, left: 80),
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Receive",
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40, right: 80),
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'missed');
                          },
                          child: Text(
                            "Missed",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
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
            SizedBox(height: 10,),
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
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Icon(
                  Icons.star,
                  size: 30,
                )),
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
            Icon(Icons.watch_later, size: 30),
          ],
        ),
      ),
      backgroundColor: Color(0xffF2FAFF),
    ));
  }

  Widget Contacttile(
      {String? name, String? number, String? img, String? color}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: Colors.white,
        title: Text("$name",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xff3B98E5),
            )),
        subtitle: Text(
          "$number",
          style: TextStyle(color: Color(0xff3B98E5), fontSize: 15),
        ),
        leading: CircleAvatar(
          backgroundImage: AssetImage("aseets/Images/user.png"),
        ),
        trailing: Icon(
          Icons.info,
          color: Color(0xff3B98E5),
        ),
      ),
    );
  }
}
