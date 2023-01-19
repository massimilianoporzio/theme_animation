import 'package:flutter/material.dart';
import 'package:flutterbasics/application/theme_service.dart';
import 'package:provider/provider.dart';

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
                  const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Center(child: Sun()),
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
