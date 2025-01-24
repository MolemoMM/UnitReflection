import 'package:assignment1/models/units_data.dart';
import 'package:assignment1/routes/routes.dart';
import 'package:assignment1/widets/units_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

// Initials and Surname: M.Mamashela


class Units extends StatelessWidget {
  const Units({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UnitsData>().fetchData;
    return Scaffold(
      appBar: AppBar(
        title: Text('Unit Reflections'),
        automaticallyImplyLeading: false,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<UnitsData>().fetchData;
        },
        child: Center(child: Consumer<UnitsData>(
          builder: (context, value, child) {
            return value.map.length == 0 && !value.error
                ? CircularProgressIndicator()
                : value.error
                    ? Text(
                        'Something went Wrong. ${value.errorMessage}',
                        textAlign: TextAlign.center,
                      )
                    : value.choicenum == 1
                        ? ListView.builder(
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return UnitsCard(
                                map: value.map['Specs'][0],
                              );
                            },
                          )
                        : value.choicenum == 2
                            ? ListView.builder(
                                itemCount: 1,
                                itemBuilder: (context, index) {
                                  return UnitsCard(
                                    map: value.map['Specs'][1],
                                  );
                                },
                              )
                            : value.choicenum == 3
                                ? ListView.builder(
                                    itemCount: 1,
                                    itemBuilder: (context, index) {
                                      return UnitsCard(
                                        map: value.map['Specs'][2],
                                      );
                                    },
                                  )
                                : value.choicenum == 4
                                    ? ListView.builder(
                                        itemCount: 1,
                                        itemBuilder: (context, index) {
                                          return UnitsCard(
                                            map: value.map['Specs'][3],
                                          );
                                        },
                                      )
                                    : value.choicenum > 4
                                        ? Column(
                                            children: const [
                                              Text(
                                                "TPG 316C Units",
                                                style: TextStyle(
                                                  fontSize: 25,
                                                ),
                                              ),
                                              SizedBox(height: 14),
                                              Text(
                                                "The Unit number entered does not exist!",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          )
                                        : ListView.builder(
                                            itemCount:
                                                value.map['Specs'].length,
                                            itemBuilder: (context, index) {
                                              return UnitsCard(
                                                map: value.map['Specs'][index],
                                              );
                                            },
                                          );
          },
        )),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(RouteManager.choice);
        },
        child: const Text(
          'Select One Unit',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
