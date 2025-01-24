import 'package:assignment1/models/units_data.dart';
import 'package:assignment1/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Initials and Surname: M..Mamashela


class Choice extends StatefulWidget {
  const Choice({super.key});

  @override
  State<Choice> createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  TextEditingController choice = TextEditingController();
  @override
  void dispose() {
    choice.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Units Reflections'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: choice,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter a unit number of your notes',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  )),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<UnitsData>().choicenum = int.parse(choice.text);
                Navigator.of(context).pushNamed(RouteManager.homePage);
              },
              child: const Text('Select unit of your choice'),
            ),
          ],
        ),
      ),
    );
  }
}
