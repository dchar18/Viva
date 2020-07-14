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
  Stream listStream;

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
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
        print("Name: " + Global.myName);
        print("Email: " + Global.myEmail);
        print("Item name: " + itemName.toString());
        print("Completed: " + completed.toString());
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        height: 150,
        decoration: BoxDecoration(
          color: Colors.blue[900],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            Global.myName,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        // child: Column(
        //   children: <Widget>[Text(itemName), Text(completed.toString())],
        // ),
      ),
    );
  }
}
