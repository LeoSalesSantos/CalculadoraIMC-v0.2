import 'package:flutter/material.dart';
import 'package:fluttercalculadoraimc/constants/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/src/material/bottom_navigation_bar.dart';
import 'package:fluttercalculadoraimc/views/screens/calculate_page.dart';
import 'package:fluttercalculadoraimc/views/screens/history_page.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          scaffoldBackgroundColor: AppColors.background,
          textTheme: TextTheme(
              bodyLarge: TextStyle(color: AppColors.textPrimary),
              bodyMedium: TextStyle(color: AppColors.textSecondary))),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controllerPage = PageController(initialPage: 0);
  int positionPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Calculadora de IMC"),
        titleTextStyle:
            const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        backgroundColor: AppColors.primaryColor,
      ),
      body: PageView(
              controller: controllerPage,
              onPageChanged: (value) {
      setState(() {
        positionPage = value;
      });
              },
              children: [
                CalculatePage(),
                HistoryPage(),
              ],
            ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            controllerPage.jumpToPage(value);
          },
          currentIndex: positionPage,
          items: [
            BottomNavigationBarItem(
                label: "Calculo", icon: Icon(Icons.calculate),),
                BottomNavigationBarItem(
                label: "Historico", icon: Icon(Icons.list),),
          ],),
    ),);
  }
}
