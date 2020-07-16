import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:viva/helper/global.dart';
import 'package:viva/services/database.dart';

class SavedListScreen extends StatefulWidget {
  @override
  _SavedListScreenState createState() => _SavedListScreenState();
}

class _SavedListScreenState extends State<StatefulWidget> {
  DatabaseMethods databaseMethods = new DatabaseMethods();
  Stream<QuerySnapshot> listStream;

  Widget savedList() {
    return StreamBuilder(
      stream: listStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return ItemTile(
                      itemName: snapshot.data.documents[index].data["itemName"],
                      completed:
                          snapshot.data.documents[index].data["completed"]);
                },
              )
            : Container(
                child: Center(
                  child: Text('No lists have been created'),
                ),
              );
      },
    );
  }

  // Future getList() async {
  //   var firestore = Firestore.instance;
  //   QuerySnapshot qs = await firestore
  //       .collection("Users")
  //       .where('name', isEqualTo: Global.myName)
  //       .getDocuments();

  //   return qs.documents;
  // }

  // Widget savedList() {
  //   return FutureBuilder(
  //       future: getList(),
  //       builder: (_, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return Center(
  //             child: Text('No lists have been created'),
  //           );
  //         } else {
  //           return ListView.builder(
  //               itemCount: snapshot.data.length,
  //               itemBuilder: (_, index) {
  //                 return ItemTile(
  //                     itemName: snapshot.data[index].data['itemName'],
  //                     completed: snapshot.data[index].data['completed']);
  //               });
  //         }
  //       });
  // }

  @override
  void initState() {
    databaseMethods.getBucketList().then((val) {
      setState(() {
        listStream = val;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: savedList(),
        ),
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final String itemName;
  final bool completed;
  ItemTile({@required this.itemName, @required this.completed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Item name: " + itemName.toString());
        print("Completed: " + completed.toString());
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        height: 100,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.blue[900],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              child: Icon(
                completed == true
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                color: Colors.white,
                size: 30.0,
              ),
            ),
            Container(
              child: Text(
                itemName,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.arrow_right,
                  size: 40.0,
                ),
              ),
            )
          ],
        ),
        // child: Column(
        //   children: <Widget>[Text(itemName), Text(completed.toString())],
        // ),
      ),
    );
  }
}
