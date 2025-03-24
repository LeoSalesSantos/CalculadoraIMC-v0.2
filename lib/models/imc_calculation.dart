import 'package:flutter/material.dart';

class ImcCalculation {
  final String _id = UniqueKey().toString();
  double _peso = 0;
  double _altura = 0;

  ImcCalculation(this._peso, this._altura);

  String get id => id;

  double get peso => _peso;

  set peso(double peso) {
    _peso = peso;
  }

  double get altura => _altura;

  set altura(double altura) {
    _altura = altura;
  }

  double calculateIMC() {
    double imc = 0;

    imc = _peso / (_altura * _altura);

    return imc.isNaN ? 0 : imc;
  }

}