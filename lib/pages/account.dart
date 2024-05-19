import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flousak/pages/login.dart';
import 'package:flutter/material.dart';

class account extends StatefulWidget {
  const account({Key? key}) : super(key: key);

  @override
  State<account> createState() => _AccountPageState();
}

class _AccountPageState extends State<account> {
  final users = FirebaseFirestore.instance.collection('users');
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 4, 48),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'My account',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(143, 10, 100, 1),
        elevation: 10,
        shadowColor: Colors.black,
      ),
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 340,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff910A67), Color.fromARGB(255, 2, 4, 48)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // _image != null
          //     ? CircleAvatar(
          //         radius: 90,
          //         backgroundImage: MemoryImage(_image!),
          //       ) :
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 15),
              child: CircleAvatar(
                radius: 90,
                backgroundImage: AssetImage('images/human.png'),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 190, left: 230),
          //   child: Positioned(
          //     child: IconButton(
          //       onPressed: () {},
          //       icon: Icon(Icons.add_a_photo),
          //       color: Colors.blue,
          //     ),
          //   ),
          // ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 240, 0, 15),
              child: Text(
                "Hey ",
                style: TextStyle(
                    color: Colors.grey[500],
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 290, 15, 0),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.person,
                      size: 22,
                      color: Color(0xff720455),
                    ),
                    title: Text(
                      "My Account",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.payment_outlined,
                      size: 22,
                      color: Color(0xff720455),
                    ),
                    title: Text(
                      "My Banking Details",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.settings,
                      size: 22,
                      color: Color(0xff720455),
                    ),
                    title: Text(
                      "Settings",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.group,
                      size: 22,
                      color: Color(0xff720455),
                    ),
                    title: Text(
                      "FAQs",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Icon(Icons.question_mark),
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 600, 15, 0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const login()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff720455),
                  alignment: Alignment.topCenter,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
