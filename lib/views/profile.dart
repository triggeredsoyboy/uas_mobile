import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_cubit.dart';
import 'home_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8F9FD),
      appBar: AppBar(
        title: Text(
          "Profil",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFF0E4D92),
      ),
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (ctx, state) {
            if (state is HomeError) {
              return Center(
                child: Text(
                  state.error,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              );
            } else if (state is HomeLoading) {
              return Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is HomeLoaded) {
              return Container();
            } else {
              return Center(
                child: Text(
                  "Dimas Wicaksono | 124200053",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
