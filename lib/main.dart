import 'package:bloctest/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home());
  }
}

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   FoodBloc? foodBloc;
//
//   @override
//   void initState() {
//     foodBloc = BlocProvider.of<FoodBloc>(context);
//     foodBloc!.add(FoodFetchEvent());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocBuilder<FoodBloc, FoodState>(
//         builder: (context, state) {
//           if (state is FoodInitialState) {
//             return buildLoading();
//           } else if (state is FoodLoadingState) {
//             return buildLoading();
//           } else if (state is FoodLoadedState) {
//             return buildList(state.recipes);
//           } else if (state is FoodErrorState) {
//             return buildError(state.message);
//           } else {
//             return buildLoading();
//           }
//         },
//       ),
//     );
//   }
// }
//
// Widget buildLoading() {
//   return const Center(child: CircularProgressIndicator());
// }
//
// Widget buildList(List<Recipe>? recipes) {
//   return ListView.builder(
//       itemCount: recipes!.length, itemBuilder: (context, index) {
//         return Container(
//           height: 100,
//           margin: EdgeInsets.symmetric(vertical: 5 , horizontal: 20),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Image.network(recipes[index].imageUrl! , width: 100, height: 100,fit: BoxFit.cover,),
//               Flexible(child: Text(recipes[index].title!))
//             ],
//           ),
//         );
//   });
// }
//
// Widget buildError(String? message) {
//   return Center(child: SelectableText(message!));
// }
