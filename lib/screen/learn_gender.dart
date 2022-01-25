import 'package:bloctest/bloc/learn_gender/gender_bloc.dart';
import 'package:bloctest/bloc/learn_gender/gender_event.dart';
import 'package:bloctest/bloc/learn_gender/gender_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LearnYourGender extends StatefulWidget {
  const LearnYourGender({Key? key}) : super(key: key);

  @override
  _LearnYourGenderState createState() => _LearnYourGenderState();
}

class _LearnYourGenderState extends State<LearnYourGender> {
  GenderBloc? genderBloc;
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    genderBloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<GenderBloc, GenderSate>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTitle(),
                  buildTextField(),
                  buildResults(state),
                  buildGetButton(state)
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildTitle() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: const Text(
        "Enter your name and get your gender",
        style: TextStyle(
            fontSize: 22, color: Colors.black, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget buildTextField() {
    return TextField(
      controller: nameController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
    );
  }

  Widget buildResults(GenderSate state) {
    if (state is GenderLoaded) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Gender : " + state.gender!.gender! ,style: const TextStyle(fontSize: 20 , color: Colors.black)),
          const SizedBox(height: 10,),
          Text("Probability : " + state.gender!.probability!.toString(),style: const TextStyle(fontSize: 20 , color: Colors.black)),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget buildGetButton(GenderSate state) {
    return ElevatedButton(
      onPressed: () {
        BlocProvider.of<GenderBloc>(context)
            .add(GetGenderEvent(name: nameController.text.toString().trim()));
      },
      child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Center(
              child: state is GenderLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                      "Get",
                      style: TextStyle(fontSize: 20),
                    ))),
    );
  }
}
