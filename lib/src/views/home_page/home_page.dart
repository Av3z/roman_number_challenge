import 'package:flutter/material.dart';
import 'package:roman_number_challenge/src/controllers/home_controller.dart';
import 'package:roman_number_challenge/src/views/home_page/components/custom_button.dart';
import 'package:roman_number_challenge/src/views/home_page/components/custom_text_field.dart';
import 'package:roman_number_challenge/src/views/home_page/components/logo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = HomeController();
    var sizeOf = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Logo(),
          const SizedBox(
            height: 35,
          ),
          CustomTextField(
            width: sizeOf.width * 0.4,
            controller: homeController.numberEC,
          ),
          const SizedBox(
            height: 35,
          ),
          CustomButton(
            width: sizeOf.width * 0.4,
            onPressed: () {
              homeController.convert();
            },
            text: 'Converter',
          ),
          const SizedBox(
            height: 25,
          ),
          Center(
            child: ValueListenableBuilder<String>(
                valueListenable: homeController.number,
                builder: (context, value, _) {
                  return Text(
                    'Seu numero convertido é $value',
                    style: const TextStyle(color: Colors.white),
                  );
                }),
          )
        ],
      ),
    );
  }
}
