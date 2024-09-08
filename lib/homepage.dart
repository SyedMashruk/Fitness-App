import 'dart:convert';
import 'package:fitness/clicked_page.dart';
import 'package:fitness/models/fitness_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  FitnessModel? fitnessModel;
  List<FitnessModel> myData = [];
  void getData() async {
    var fitness = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json?fbclid=IwAR2gsu4SRvRRFkHK8JPTWHZXmaNP0dtpOG6h7ep4zQp7WaamX5S1UaSrc3A;'));
    var fitnessData = jsonDecode(fitness.body);

    for (var i in fitnessData['exercises']) {
      fitnessModel = FitnessModel(
        id: i['id'],
        gif: i['gif'],
        thumbnail: i['thumbnail'],
        title: i['title'],
      );
      myData.add(fitnessModel!);
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return myData.isNotEmpty
        ? Scaffold(
            backgroundColor: Colors.black,
            body: ListView.builder(
                itemCount: myData.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ClickedPage(
                                fitnessModel: myData[index],
                              )));
                    },
                    child: Stack(
                      children: [
                        Image.network('${myData[index].thumbnail}'),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.5)),
                                  height: 40,
                                ),
                                Center(
                                  child: Text(
                                    '${myData[index].title}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  );
                }),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
