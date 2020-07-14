import 'package:flutter/material.dart';
import 'package:viva/screens/savedList_screen.dart';
import 'package:viva/services/database.dart';
// import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class AddItemScreen extends StatefulWidget {
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  TextEditingController searchTEC = new TextEditingController();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  addItemToList() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add item'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).accentColor,
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                addItemToList();
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SavedListScreen(),
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width - 100,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.lightGreenAccent[400],
                  // color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
