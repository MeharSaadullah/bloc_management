import 'package:bloc_management/ui/Favourite_App/favourite_screen.dart';
import 'package:bloc_management/ui/Post_Screen/post_screen.dart';
import 'package:bloc_management/ui/counter_screen.dart';
import 'package:bloc_management/ui/image_picker/image_picker_screen.dart';
import 'package:bloc_management/ui/login/login_screen.dart';
import 'package:bloc_management/ui/switch_example/switch_example_screen.dart';
import 'package:bloc_management/ui/to_do/to_do_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      (MaterialPageRoute(
                          builder: (context) => CounterScreen())));
                },
                icon: Icon(Icons.add),
              ),
              Text('Counter'),
              SizedBox(
                height: 10,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      (MaterialPageRoute(
                          builder: (context) => SwitchExample())));
                },
                icon: Icon(Icons.color_lens),
              ),
              Text('Switch and Colour'),
              SizedBox(
                height: 10,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      (MaterialPageRoute(
                          builder: (context) => ImagePickerScreen())));
                },
                icon: Icon(Icons.image),
              ),
              Text('Image Picker'),
              SizedBox(
                height: 10,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      (MaterialPageRoute(builder: (context) => ToDoScreen())));
                },
                icon: Icon(Icons.update),
              ),
              Text("TO DO"),
              SizedBox(
                height: 10,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      (MaterialPageRoute(
                          builder: (context) => FavouriteScreen())));
                },
                icon: Icon(Icons.favorite),
              ),
              Text("Favourite"),
              SizedBox(
                height: 10,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      (MaterialPageRoute(builder: (context) => PostScreen())));
                },
                icon: Icon(Icons.api),
              ),
              const Text("API'S DATA"),
              SizedBox(
                height: 10,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      (MaterialPageRoute(builder: (context) => LoginScreen())));
                },
                icon: Icon(Icons.login),
              ),
              const Text("LOG IN"),
            ],
          ),
        ),
      ),
    );
  }
}
