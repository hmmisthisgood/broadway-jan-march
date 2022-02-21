import 'package:flutter/material.dart';
import 'package:http_adv/bloc/photos_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SomeButton extends StatelessWidget {
  const SomeButton({Key? key, required this.title, required this.cubit})
      : super(key: key);
  final String title;
  final PhotosCubit cubit;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.red,
      onPressed: () {
        context.read<PhotosCubit>().fetchPosts();
        // cubit.fetchPosts();
      },
      child: TextWidget(
        title: title,
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Text(title),
    );
  }
}
