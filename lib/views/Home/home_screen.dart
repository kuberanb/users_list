import 'package:brain_wired/core/colors.dart';
import 'package:brain_wired/core/constants.dart';
import 'package:brain_wired/provider/Home/home_provider.dart';
import 'package:brain_wired/views/Common%20Widgets/exit_dialog_box.dart';
import 'package:brain_wired/views/Home/wigets/user_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      final homeProvider = Provider.of<HomeProvider>(context, listen: false);

      await homeProvider.getUsersList(context);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final homeProvider = Provider.of<HomeProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        showExitDialog(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kBlackColor,
          title: const Text('Users List'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: homeProvider.isLoading
              ? SizedBox(
                  height: .9 * screenHeight,
                  width: screenWidth,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: kBlackColor,
                    ),
                  ),
                )
              : Column(
                  children: [
                    kHeight10,
                    homeProvider.userModelList?.isEmpty ?? true
                        ? SizedBox(
                            width: screenWidth,
                            height: .9 * screenHeight,
                            child: const Center(
                              child: Text(
                                'No User Found',
                                style: TextStyle(),
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => UserWidget(
                                  userModel:
                                      homeProvider.userModelList![index]!),
                              itemCount:
                                  homeProvider.userModelList?.length ?? 0,
                            ),
                          ),
                  ],
                ),
        ),
      ),
    );
  }
}
