import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttercalculadoraimc/constants/app_colors.dart';
import 'package:fluttercalculadoraimc/models/imc_base.dart';
import 'package:fluttercalculadoraimc/models/imc_calculation.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({super.key});

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  var peso = TextEditingController();
  var altura = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: 8,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 75),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Insira o peso"),
                    style: TextStyle(fontSize: 20),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
                    ],
                    controller: peso,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Insira a altura"),
                    style: TextStyle(fontSize: 20),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
                    ],
                    controller: altura,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    onPressed: () {
                      if (peso.text.isEmpty || altura.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text("É necessário preencher peso e altura!")));
                        return;
                      }

                      double pesoValue = double.tryParse(peso.text) ?? 0;
                      double alturaValue = double.tryParse(peso.text) ?? 0;

                      ImcCalculation imcCalculation =
                          ImcCalculation(pesoValue, alturaValue);

                      String imc = baseIMC(imcCalculation);

                      showDialog(
                        context: context,
                        builder: (BuildContext bc) => AlertDialog(
                          title: Text("Seu IMC é:"),
                          content: Text(imc),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("Fechar")),
                          ],
                        ),
                      );
                    },
                    child: Text(
                      "Calcular",
                      style: TextStyle(
                          color: AppColors.textSecondary, fontSize: 18),
                    ),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          AppColors.primaryColor),
                      minimumSize: WidgetStateProperty.all<Size>(Size(200, 50)),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 0.5),
                              borderRadius: BorderRadius.circular(7))),
                    ),
                  ),
                  // Container(
                  //   width: 300,
                  //   height: 200,
                  //   child: Card(
                  //     color: AppColors.background,
                  //     elevation: 8,
                  //     child: ListTile(
                  //       title: Text(
                  //         "Resultado atual:",
                  //         style: TextStyle(
                  //             fontSize: 20,
                  //             fontWeight: FontWeight.bold,
                  //             color: AppColors.textSecondary),
                  //       ),
                  //       subtitle: Column(
                  //         Dialog(c),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
