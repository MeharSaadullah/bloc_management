import 'package:bloc_management/bloc/counter/counter_bloc.dart';
import 'package:bloc_management/ui/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// in mai.dart we use flutter_bloc pacakge to add bloc provider
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
        // use bloc providers
        BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: CounterScreen()),
    );
  }
}



// import 'package:bloc_management/bloc/counter/counter_bloc.dart';
// import 'package:bloc_management/bloc/counter/counter_state.dart';
// import 'package:bloc_management/ui/counter_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// // In main.dart we use flutter_bloc package to add bloc provider
// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => CounterBloc(),
//       child: BlocBuilder<CounterBloc, CounterState>(
//         builder: (context, state) {
//           return MaterialApp(
//             title: 'Flutter Demo',
//             theme: ThemeData(
//               colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//               useMaterial3: true,
//             ),
//             home: const CounterScreen(),
//           );
//         },
//       ),
//     );
//   }
// }
