import 'package:bloc_management/bloc/switch_example/bloc/switch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Example Two"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Notification",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  // here we wrap our switch with bloc builder
                  // this blocbuilder is used to rebuild the widget
                  BlocBuilder<SwitchBloc, SwitchState>(
                    buildWhen: (previous, current) =>
                        previous.isSwitch !=
                        current
                            .isSwitch, // this line of code is to build only that widget not other widget at that time

                    builder: (context, state) {
                      return Switch(
                        value: state.isSwitch,
                        onChanged: (newValue) {
                          // this is for turnning of anf on button
                          context
                              .read<SwitchBloc>()
                              .add(EnableOrDisbaleNotification());
                        },
                        activeColor: Colors.green,
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),

              // here we wrap pur switch with bloc builder
              // this blocbuilder is used to rebuild the widget
              // add switch state and switchbloc to get the variable slider
              BlocBuilder<SwitchBloc, SwitchState>(
                buildWhen: (previous, current) =>
                    previous.slider !=
                    current
                        .slider, // this line of code is to build only that widget not other widget at that time

                builder: (context, state) {
                  return Container(
                    height: 200,
                    color: Colors.green.withOpacity(state.slider),
                  );
                },
              ),

              SizedBox(
                height: 50,
              ),

              // here we wrap pur switch with bloc builder
              // this blocbuilder is used to rebuild the widget
              // add switch state and switchbloc to get the variable slider
              BlocBuilder<SwitchBloc, SwitchState>(
                builder: (context, state) {
                  return Slider(
                    value: state.slider,
                    onChanged: (value) {
                      context
                          .read<SwitchBloc>()
                          .add(SliderEvent(slider: value));
                    },
                    activeColor: Colors.green,
                    thumbColor: Colors.white,
                  );
                },
              ),
            ],
          ),
        ));
  }
}
