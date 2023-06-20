import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/feed/presentation/widget/where_to_go_button.dart';

import '../../../../core/utils/colors.dart';
import '../bloc/passenger_home_bloc.dart';
import 'destination_list.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 20,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 6.h),
          child: Column(
            children: [
              Positioned(child: WhereButton()),
              BlocConsumer<PassengerHomeBloc, PassengerHomeState>(
                listener: (context, state) {
                  if (state is FetchLoadingSuccessState) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DestinationList(state.destination)));
                  }
                },
                builder: (context, state) {
                  if (state is FetchLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is FetchLoadingFailureState) {
                    return Text('failed to fetch');
                  } else {
                    return Text('to be ...');
                  }
                },
              )
            ],
          ),
        ));
  }
}
