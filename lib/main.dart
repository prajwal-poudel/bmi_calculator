import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int bmi = 0;
  String message = "";
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                height: 250,
                width: double.infinity,
                color: Theme.of(context).primaryColor,
                child: const Text(
                  "BMI Calculator",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: height,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Height",
                          helperText: "Enter height in Meeter",
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: weight,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Weight",
                          helperText: "Enter Weight in Kilogram",
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton.icon(
                          onPressed: () {
                            double heightSquare = double.parse(height.text) *
                                double.parse(height.text);
                            bmi =
                                (int.parse(weight.text) / heightSquare).round();
                            print(bmi);

                            if (bmi <= 18) {
                              setState(() {
                                message = "UnderWeight!!";
                              });
                            } else if (bmi <= 25) {
                              setState(() {
                                message = "Normal!!";
                              });
                            } else if (bmi <= 30) {
                              setState(() {
                                message = "OverWeight!!";
                              });
                            } else if (bmi <= 35) {
                              setState(() {
                                message = "OBESE!!";
                              });
                            } else {
                              setState(() {
                                message = "Extermely OBESE!!";
                              });
                            }
                          },
                          icon: Icon(Icons.call_made_outlined),
                          label: Text("Submit"))
                    ],
                  ),
                ),
              ),
              if (bmi != 0)
                Text(
                  "Your BMI is : $bmi and You are $message",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontStyle: FontStyle.italic),
                )
            ],
          ),
        )),
      ),
    );
  }
}
