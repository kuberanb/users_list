import 'package:brain_wired/core/constants.dart';
import 'package:brain_wired/models/user_model.dart';
import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  UserModel userModel;
  UserWidget({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Card(
      elevation: 10,
      child: Container(
        decoration: const BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Name :',
                    style: TextStyle(
                      // color: kBlackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    userModel.name ?? 'Na',
                    style: const TextStyle(
                      // color: kBlackColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              kHeight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Username :',
                    style: TextStyle(
                      // color: kBlackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    userModel.username ?? 'Na',
                    style: const TextStyle(
                      // color: kBlackColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              kHeight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Email :',
                    style: TextStyle(
                      // color: kBlackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    userModel.email ?? 'Na',
                    style: const TextStyle(
                      // color: kBlackColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              kHeight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Phone :',
                    style: TextStyle(
                      // color: kBlackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    userModel.phone ?? 'Na',
                    style: const TextStyle(
                      // color: kBlackColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              kHeight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Website :',
                    style: TextStyle(
                      // color: kBlackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    userModel.website ?? 'Na',
                    style: const TextStyle(
                      // color: kBlackColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              kHeight10,
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Address',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              kHeight10,
              Text(
                  '''${userModel.address?.street ?? ''} ${userModel.address?.suite ?? ''} ${userModel.address?.city ?? ''} ${userModel.address?.zipcode ?? ''} ''')
            ],
          ),
        ),
      ),
    );
  }
}
