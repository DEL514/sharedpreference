import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _forKey = GlobalKey<FormState>();
  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();

  void _submit(){
    if(_forKey.currentState!.validate()){
      debugPrint('Success');
    }else{
      debugPrint('Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue[100],
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(""),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Form(
                key: _forKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _height,
                      decoration:  const InputDecoration(
                        label:  Text("Height"),
                        // labelText: "Height",
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value){
                        if (value == null || value.isEmpty){
                          return 'Please enter your Height in centimeter';
                        }else if (!RegExp(r'^\d*\.?\d+$').hasMatch(value)){
                          return 'Please enter a valid number';
                        }else{
                          return null;
                        }
                      },
                    ),
                      const SizedBox(
                        height: 30,
                    ),
                    TextFormField(
                      controller: _weight,
                      decoration: const InputDecoration(
                        label: Text("Weight"),
                      ),
                      validator: (value){
                        if (value == null || value.isEmpty){
                          return 'Please enter your Weight in centimeter';
                        }else if (!RegExp(r'^\d*\.?\d+$').hasMatch(value)){
                          return 'Please enter a valid number';
                        }else{
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(onPressed: (){
                      _submit();
                    }, 
                    child: const Text("Calculate BMI")
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
