import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  String? selectedItem;
  List<String> items = [
    'Food',
    'Online payment',
    'Fees',
    'Transfers',
    'Shopping',
    'Others',
  ];

  Map<String, String> itemImages = {
    'Food': 'images/food.png',
    'Online payment': 'images/online.png',
    'Fees': 'images/fees.png',
    'Transfers': 'images/Transfer.png',
    'Shopping': 'images/shopping.png',
    'Others': 'images/others.png',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 4, 48),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Adding',
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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff910A67), Color.fromARGB(255, 2, 4, 48)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 80,
            ),
            child: Column(
              children: [
                DropdownButton<String>(
                  hint: const Text(
                    'Select an item',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: selectedItem,
                  dropdownColor: Colors.grey,
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                  onChanged: (newValue) {
                    setState(() {
                      selectedItem = newValue;
                    });
                  },
                  items: items.map((valueItem) {
                    return DropdownMenuItem<String>(
                      value: valueItem,
                      child: Row(
                        children: [
                          Image.asset(
                            itemImages[valueItem]!,
                            width: 30,
                            height: 30,
                          ),
                          const SizedBox(width: 10),
                          Text(valueItem),
                        ],
                      ),
                    );
                  }).toList(),
                  underline: Container(
                    height: 2,
                    color: Colors.white,
                  ),
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                  iconSize: 36.0,
                  isExpanded: true,
                  alignment: Alignment.centerLeft,
                ),
                const SizedBox(height: 30),
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Enter amount',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 23,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const TextField(
                  keyboardType: TextInputType.text,
                  maxLines: 3,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                  decoration: InputDecoration(
                    hintText: 'The items you paid this money in',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 22,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 80),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20,
                  ),
                  label: const Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff720455),
                    alignment: Alignment.center,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
