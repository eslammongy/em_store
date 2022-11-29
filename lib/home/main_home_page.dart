import 'package:em_store/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [
      Container(
        margin: const EdgeInsets.only(top: 45, bottom: 15),
        padding: const EdgeInsets.only(left: 20, right: 20),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text("Egypt"),
                Text("Monoufia")
              ],
            ),
            Center(
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.mainColor,
                ),
                child: const Icon(Icons.search, color: Colors.white,),
              ),
            )
          ],
        ),
      ),
    ],)
    );
  }
}
