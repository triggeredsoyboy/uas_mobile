import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/card.dart';
import 'home_cubit.dart';
import 'home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E4D92),
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
              return Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.all(25),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Kurs Mata Uang",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "\$ ${state.currencyModel.last.cbPrice!.split(".")[0]}.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                ),
                              ),
                              Text(
                                state.currencyModel.last.cbPrice!.split(".")[1],
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 40,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "+ \$ ${state.currencyModel.last.cbPrice!.split(".")[0]}.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "${state.currencyModel.last.cbPrice!.split(".")[1]}   ",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "4.28%",
                                style: TextStyle(
                                  color: Colors.greenAccent,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 35),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Center(
                            child: Container(
                              height: 5,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Portofolio",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.56,
                            child: ListView.builder(
                              itemCount: state.currencyModel.length,
                              itemBuilder: (ctx, i) {
                                return Padding(
                                  padding: EdgeInsets.all(8),
                                  child: ItemCard(
                                    currencyModel: state.currencyModel[i],
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
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
