import 'package:flutter/material.dart';

class LearnFlutterPage extends StatefulWidget {
  const LearnFlutterPage({super.key});

  @override
  State<LearnFlutterPage> createState() => _LearnFlutterPageState();
}

class _LearnFlutterPageState extends State<LearnFlutterPage> {
  bool isSwitch = false;
  bool? isCheckbox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('learn flutter'),
        automaticallyImplyLeading:
            false, //to control the back arrow by ourselves// to delete back arrow
        leading: IconButton(
          //to create my own back icon(button)
          onPressed: () {
            //we use context to make sure that behind the scene is working well
            Navigator.of(context).pop(); //delete the current page n go back
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint('actions');
            },
            icon: const Icon(
              Icons.info_outline,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('images/einstein.jpg'),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.black,
            ),
            Container(
              margin: const EdgeInsets.all(10.0), //outside the container
              padding: const EdgeInsets.all(10.0),

              color: Colors.blueGrey,
              width: double.infinity,
              child: const Center(
                child: Text(
                  'this is a text widget',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: isSwitch
                    ? Colors.green
                    : Colors.blue, //make the elevated button based on switch
                //isswitch? meaning if the button is on make the button green otherwise blue
              ),
              onPressed: () {
                debugPrint('elevated button');
              },
              child: const Text('elevated button'),
            ),
            OutlinedButton(
              onPressed: () {
                debugPrint('outlined button');
              },
              child: const Text('outlined button'),
            ),
            TextButton(
              onPressed: () {
                debugPrint('text button');
              },
              child: const Text('text button'),
            ),
            GestureDetector(
              //we created a widget for the row to make it clickable
              behavior: HitTestBehavior
                  .opaque, // this make it work whenever we click anywhere on the row
              onTap: () {
                debugPrint(
                    'this is the row'); //this will be printed when we press only the fire text
              },
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.local_fire_department,
                      color: Colors.black12,
                    ),
                    Text('row widget'),
                    Icon(
                      Icons.local_fire_department,
                      color: Colors.black12,
                    ),
                  ]),
            ),
            Switch(
                value: isSwitch, //we mustinitialize isSwitch
                onChanged: (bool newBool) {
                  setState(() {
                    isSwitch = newBool;
                  });
                }), //new bool will give us new value when we click the switch
            Checkbox(
                value: isCheckbox,
                onChanged: (bool? newBool) {
                  setState(() {
                    isCheckbox = newBool;
                  });
                }), //bool? meaning bool can be nullable
            Image.asset('images/einstein.jpg'),
          ],
        ),
      ),
    );
  }
}
