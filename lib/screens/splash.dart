import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_findjob/screens/mainScreen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/imgs/img_main.png'),
            Column(
              children: [
                Text(
                  'Buscador de Trabajo',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text('Lo hacemos facil',
                    style: Theme.of(context).textTheme.headline2),
              ],
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              onPressed: () {
                Get.to(MainScreen());
              },
              elevation: 10.0,
              minWidth: 170,
              height: 50.0,
              color: Theme.of(context).primaryColor,
              child: Text(
                "Empezar",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//30043958805
//david cardenas
//marketing
