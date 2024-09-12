import 'package:bloc_management/Repository/favourite_repository.dart';
import 'package:bloc_management/Utils/image_picker_utiles.dart';
import 'package:bloc_management/bloc/Post/bloc/post_bloc.dart';
import 'package:bloc_management/bloc/counter/counter_bloc.dart';
import 'package:bloc_management/bloc/favouite_app/bloc/favourite_app_bloc.dart';
import 'package:bloc_management/bloc/image_picker/bloc/image_picker_bloc.dart';
import 'package:bloc_management/bloc/login/bloc/login_bloc.dart';
import 'package:bloc_management/bloc/switch_example/bloc/switch_bloc.dart';
import 'package:bloc_management/bloc/to_do/bloc/to_do_bloc.dart';
import 'package:bloc_management/ui/Favourite_App/favourite_screen.dart';
import 'package:bloc_management/ui/Home_Screen.dart';
import 'package:bloc_management/ui/Post_Screen/post_screen.dart';
import 'package:bloc_management/ui/counter_screen.dart';
import 'package:bloc_management/ui/login/login_screen.dart';
import 'package:bloc_management/ui/switch_example/switch_example_screen.dart';
import 'package:bloc_management/ui/to_do/to_do_screen.dart';
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
        MultiBlocProvider(
            providers: [
          // counter bloc
          BlocProvider(
            create: (context) => CounterBloc(),
          ),
          // switch and color bloc
          BlocProvider(
            create: (context) => SwitchBloc(),
          ),
          // imagepicker bloc
          BlocProvider(
            create: (context) => ImagePickerBloc(ImagePickerUtiles()),
          ),
          // todo bloc
          BlocProvider(create: (context) => ToDoBloc()),
          // favourite bloc
          BlocProvider(
              create: (context) => FavouriteAppBloc(
                  FavouriteRepository())), // inside ()their is FavouriteRepository bcz in this part we di dependency inject
          // api bloc (post bloc)
          BlocProvider(create: (context) => PostBloc()),
          // loginbloc
          BlocProvider(create: (context) => LoginBloc()),
        ],
            child: MaterialApp(
              title: 'Flutter Demo',
              //   themeMode: ThemeMode.dark,
              theme: ThemeData(
                //  brightness: Brightness.dark,
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home:
                  //CounterScreen()
                  //SwitchExample()
                  HomeScreen(),
              //ToDoScreen(),
              //FavouriteScreen(),
              // PostScreen()
              //LoginScreen(),
            ));
  }
}
