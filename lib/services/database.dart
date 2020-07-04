import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  // searches database for user that has a matching username
  getUserByUsername(String username) async {
    return await Firestore.instance
        .collection("Users")
        .where('name', isEqualTo: username)
        .getDocuments();
  }

  // searches database for user that has a matching email
  getUserByEmail(String email) async {
    return await Firestore.instance
        .collection("Users")
        .where('email', isEqualTo: email);
  }

  // creates a new entry in database using the email as a title and the userMap as the data (email and name)
  uploadUserInfo(userMap) {
    Firestore.instance
        .collection("Users")
        .document(userMap["email"])
        .setData(userMap);
  }

  // initializes a collection that contains the user, the contact, and a collection of their messages
  createChatroom(String chatroomID, chatroomMap) async {
    await Firestore.instance
        .collection('Chatroom')
        .document(chatroomID)
        .setData(chatroomMap)
        .catchError((e) {
      print(e.toString());
    });
  }

  // adds a message in database to the user's collection of messages sent between them and the contact
  addConversationMessage(String chatroomID, messageMap) {
    Firestore.instance
        .collection('Chatroom')
        .document(chatroomID)
        .collection('chats')
        .add(messageMap)
        .catchError((e) {
      print(e.toString());
    });
  }

  // used to retrieve all the messages sent between the user and a contact
  getConversationMessages(String username) async {
    return await Firestore.instance
        .collection("Chatroom")
        .where("users", arrayContains: username)
        .snapshots();
  }
}
