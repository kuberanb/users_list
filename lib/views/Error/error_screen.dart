import 'package:brain_wired/core/colors.dart';
import 'package:brain_wired/provider/Home/home_provider.dart';
import 'package:brain_wired/views/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: Center(
        child: SizedBox(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lottie/no-network.json',
              height: 0.4 * MediaQuery.of(context).size.height,
              width: 0.7 * MediaQuery.of(context).size.width,
            ),
            Column(
              children: [
                const Text(
                  'You are not connected to the internet, or some server issue occured please check your connection and try again.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: kBlackColor,
                    ),
                  ),
                  margin: const EdgeInsets.all(10),
                  child: TextButton(
                    onPressed: () async {
                      await homeProvider.getUsersList(context).then((value) {
                        if (value == null || value == []) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const ErrorScreen()),
                          );
                        } else {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );
                        }
                      });
                    },
                    child: const Text(
                      'Try Again',
                      style: TextStyle(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
