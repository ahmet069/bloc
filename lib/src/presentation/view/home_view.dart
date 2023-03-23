import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lrn1/src/presentation/bloc/counter_bloc.dart';
import 'package:lrn1/src/presentation/bloc/counter_event.dart';
import 'package:lrn1/src/presentation/bloc/counter_state.dart';
import 'package:lrn1/src/presentation/widget/home/custom_button.dart';

import '../../core/services/my_class.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  MyClass myClass = MyClass();

  @override
  Widget build(BuildContext context) {
    myClass.sayHello(20, 30);
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if (state is InitialState) {
              return CounterWidget(context, 0);
            }
            if (state is UpdateState) {
              return CounterWidget(context, state.counter);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget CounterWidget(BuildContext context, int counter) {
    return Container(
      child: Column(
        children: [
          Container(child: Text(counter.toString())),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                onPressed: () {
                  context.read<CounterBloc>().add(NumberDecrease());
                },
                btnTitle: '-',
                buttonColor: Colors.black,
              ),
              CustomButton(
                onPressed: () {
                  context.read<CounterBloc>().add(NumberIncrease());
                },
                btnTitle: '+',
                buttonColor: Colors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
