import 'package:bloctest/bloc/learn_gender/gender_bloc.dart';
import 'package:bloctest/bloc/learn_gender/gender_state.dart';
import 'package:bloctest/bloc/nationality/nationality_bloc.dart';
import 'package:bloctest/bloc/nationality/nationality_state.dart';
import 'package:bloctest/screen/learn_gender.dart';
import 'package:bloctest/screen/nationality.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            buildButton(
                Colors.green,
                "Gender",
                BlocProvider(
                    create: (context) => GenderBloc(GenderInitial()),
                    child: const LearnYourGender())),
            buildButton(
                Colors.red,
                "Nationality",
                BlocProvider(
                  create: (context) => NationalityBloc(NationalityInitial()),
                  child: const Nationality(),
                ))
          ],
        ),
      ),
    );
  }

  Widget buildButton(color, text, provider) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Get.to(provider);
        },
        behavior: HitTestBehavior.opaque,
        child: Container(
          color: color,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
              Text(
                text,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
