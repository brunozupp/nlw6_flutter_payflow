import 'package:flutter/material.dart';
import 'package:nlw6_payflow_flutter/shared/models/boleto_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoletoListController {

  final boletosNotifier = ValueNotifier<List<BoletoModel>>(<BoletoModel>[]);
  List<BoletoModel> get boletos => boletosNotifier.value;
  set boletos(List<BoletoModel> value) => boletosNotifier.value = value;

  BoletoListController() {
    getBoletos();
  }

  Future<void> getBoletos() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList("boletos") ?? [];

      boletos = response.map<BoletoModel>((boleto) => BoletoModel.fromJson(boleto)).toList();
    } catch (e) {
    }
  }
}