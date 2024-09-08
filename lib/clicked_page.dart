import 'package:fitness/models/fitness_model.dart';
import 'package:flutter/material.dart';

class ClickedPage extends StatefulWidget {
  const ClickedPage({
    super.key,
    required this.fitnessModel,
  });
  final FitnessModel fitnessModel;

  @override
  State<ClickedPage> createState() => _ClickedPageState();
}

class _ClickedPageState extends State<ClickedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stack(
          children: [
            Image.network(
              '${widget.fitnessModel.thumbnail}',
              height: 350,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Stack(
                  children: [
                    Container(
                      decoration:
                          BoxDecoration(color: Colors.white.withOpacity(.5)),
                      height: 40,
                    ),
                    Center(
                      child: Text(
                        '${widget.fitnessModel.title}',
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
        const SizedBox(
          height: 20,
        ),
        Stack(
          children: [
            Image.network(
              '${widget.fitnessModel.gif}',
              height: 350,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Stack(
                  children: [
                    Container(
                      decoration:
                          BoxDecoration(color: Colors.grey.withOpacity(.5)),
                      height: 40,
                    ),
                    Center(
                      child: Text(
                        '${widget.fitnessModel.title} Demo',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ],
    ));
  }
}
