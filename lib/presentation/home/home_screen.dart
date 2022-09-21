import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travinia/core/app/bloc/app_cubit.dart';
import 'package:travinia/core/app/bloc/app_state.dart';
import 'package:travinia/presentation/home/widegts/hotel_data_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List hotelData = BlocProvider.of<AppCubit>(context).hotels;
        if (state is HotelsLoadingState) {
          return Scaffold(
              backgroundColor: Colors.lightBlueAccent,
              body: Center(child: CircularProgressIndicator()));
        } else {}
        return Scaffold(
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return HotelDataWidget(
                      hotelName: hotelData[index].name,
                      hotelAdress: hotelData[index].address,
                      distance: 2.0, //ToDo: calculate HOTEL far distance
                      hotelPrice: hotelData[index].price,
                      hotelRating: hotelData[index].rate,
                    );
                  },
                  itemCount: hotelData.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 20,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
