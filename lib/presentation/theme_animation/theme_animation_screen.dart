import 'package:flutter/material.dart';
import 'package:flutterbasics/application/theme_service.dart';
import 'package:provider/provider.dart';

import 'widgets/moon.dart';
import 'widgets/sun.dart';

class ThemeAnimationScreen extends StatelessWidget {
  const ThemeAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Theme Animation'),
      ),
      body: Consumer<ThemeService>(
        builder: (context, themeService, child) => Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 500,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: themeService.isDarkModeOn
                        ? Colors.black.withOpacity(0.7)
                        : Colors.grey,
                    offset: const Offset(0, 3),
                    blurRadius: 10,
                    spreadRadius: 3,
                  ),
                ],
                gradient: LinearGradient(
                    colors: themeService.isDarkModeOn
                        ? const [
                            Color(0xFF94A9FF),
                            Color(0xFF6B66CC),
                            Color(0xFF200F75)
                          ]
                        : const [
                            Color(0xDDFFFA66),
                            Color(0xDDFFA057),
                            Color(0xDD940B99)
                          ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    top: themeService.isDarkModeOn ? 100 : 130, //* se dark sali
                    right: themeService.isDarkModeOn ? 100 : -40, //fuori
                    duration: const Duration(milliseconds: 400),
                    child: AnimatedOpacity(
                        //*quando isDarkMon viene attivato ci mette 550 ms
                        //* a passare da opacity 0 a 1
                        //* e viceversa
                        opacity: themeService.isDarkModeOn ? 1 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: const Moon()),
                  ),
                  AnimatedPadding(
                    duration: const Duration(milliseconds: 200),
                    padding: EdgeInsets.only(
                        top: themeService.isDarkModeOn ? 110 : 50),
                    child: const Center(child: Sun()),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 225,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        color: themeService.isDarkModeOn
                            ? Colors.grey[800]
                            : Colors.white,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            themeService.isDarkModeOn
                                ? 'To dark?'
                                : 'To bright',
                            style: const TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Text(
                            themeService.isDarkModeOn
                                ? 'Let the sun rise'
                                : 'let it be night',
                            style: const TextStyle(
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Switch(
                              value: themeService.isDarkModeOn,
                              onChanged: (_) {
                                themeService.toggleTheme();
                              })
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
