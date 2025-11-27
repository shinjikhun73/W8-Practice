import 'package:flutter/material.dart';

List<String> colors = ["red", "blue", "green"];
List<String> numbers = ["Mon", "Tues", "Wed", "Thu"];
List<Widget> getLabels() {
  return numbers.map((item) => Text(item)).toList();
}

List<Widget> getColors() {
  return colors.map((item) => Text(item)).toList();
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Label("Method 1: Loop in Array", bold: true),
              Column(
                children: [
                  Text('Start'),
                  for (var i = 0; i < 10; i++) Text('Item $i'),
                  Text("end"),
                ],
              ),

              Label("Method 2: Map", bold: true),
              Column(
                children: [
                  Text("Start"),
                  ...numbers.map((item) => Text(item)),
                  Text('End'),
                ],
              ),

              Label("Method 3: Dedicated Function", bold: true),
              Column(children: [Text("Start"), ...getLabels(), Text("End")]),

              Label("Method 4: Map (Color)", bold: true),
              Column(
                children: [
                  Text('Start'),
                  ...colors.map((item) => Text(item)),
                  Text('End'),
                ],
              ),

              Label('Method 5: Dedicated Function (Color)', bold: true),
              Column(
                children: [Text('Start'),...getColors(),Text('End')],
              )
            ],
          ),
        ),
      ),
    ),
  );
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: (bold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}
