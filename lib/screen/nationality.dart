import 'package:bloctest/bloc/nationality/nationality_bloc.dart';
import 'package:bloctest/bloc/nationality/nationality_event.dart';
import 'package:bloctest/bloc/nationality/nationality_state.dart';
import 'package:bloctest/data/model/nationality.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Nationality extends StatefulWidget {
  const Nationality({Key? key}) : super(key: key);

  @override
  _NationalityState createState() => _NationalityState();
}

class _NationalityState extends State<Nationality> {

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: BlocBuilder<NationalityBloc , NationalityState>(
      builder: (context , state)
      {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTitle(),
              buildTextField(),
              buildResults(state),
              buildGetButton(state)
            ],
          ),
        );
      },
    ),));
  }

  Widget buildTitle() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: const Text(
        "Enter your name and get your nationality",
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

  Widget buildResults(NationalityState state) {
    if (state is NationalityLoaded) {
      return SizedBox(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: state.nationality!.country!.length,
          itemBuilder: ( context,  index) {
            Country country = state.nationality!.country![index];
            return Row(
              children: [
                Text("Country : " + country.countryId! , style: const TextStyle(fontSize: 16 , color: Colors.black),),
                const SizedBox(width: 20,),
                Text("Probability : " + country.probability!.toString(), style: const TextStyle(fontSize: 16 , color: Colors.black),),
              ],
            );
          },
        ),
      );
    } else {
      return Container();
    }
  }

  Widget buildGetButton(NationalityState state) {
    return ElevatedButton(
      onPressed: () {
        BlocProvider.of<NationalityBloc>(context)
            .add(GetNationalityEvent(name: nameController.text.toString().trim()));
      },
      child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Center(
              child: state is NationalityLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                "Get",
                style: TextStyle(fontSize: 20),
              ))),
    );
  }
}
