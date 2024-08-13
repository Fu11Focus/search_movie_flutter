// segment_control.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_movie_flutter/bloc/type_movie_bloc/type_movie_bloc.dart';

class SegmentControl extends StatelessWidget {
  const SegmentControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildSegmentButton(context, 'movie'),
          _buildSegmentButton(context, 'series'),
          _buildSegmentButton(context, 'episode'),
        ],
      ),
    );
  }

  Widget _buildSegmentButton(BuildContext context, String type) {
    return GestureDetector(
      onTap: () {
        context.read<TypeMovieBloc>().add(SelectMovieType(type));
      },
      child: BlocBuilder<TypeMovieBloc, String>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(
                color: state == type ? Colors.green : Colors.grey,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              type.toUpperCase(),
              style: TextStyle(
                color: state == type ? Colors.green : Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}
