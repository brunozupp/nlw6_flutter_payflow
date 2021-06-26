import 'package:flutter/material.dart';
import 'package:nlw6_payflow_flutter/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:nlw6_payflow_flutter/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:nlw6_payflow_flutter/shared/themes/app_colors.dart';
import 'package:nlw6_payflow_flutter/shared/themes/app_text_styles.dart';
import 'package:nlw6_payflow_flutter/shared/widgets/bottom_sheet/bottom_sheet_widget.dart';
import 'package:nlw6_payflow_flutter/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({ Key? key }) : super(key: key);

  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {

  final controller = BarcodeScannerController();

  @override
  void initState() {
    super.initState();

    controller.getAvailableCameras();

    controller.statusNotifier.addListener(() {
      if(controller.status.hasBarcode) {
        Navigator.pushReplacementNamed(context, "/insert_boleto", arguments: controller.status.barcode);
      }
    });

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier, 
            builder: (_,status,__) {
              if(status.showCamera) {
                return Container(
                  child: controller.cameraController!.buildPreview(),
                );
              } else {
                return Container();
              }
            }
          ),

          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text(
                  "Escaneie o código de barras do boleto",
                  style: TextStyles.buttonBackground,
                ),
                centerTitle: true,
                leading: BackButton(
                  color: AppColors.background,
                ),
                backgroundColor: Colors.black,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.transparent
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: SetLabelButtons(
                primaryLabel: "Inserir código do boleto", 
                primaryOnPressed: () {
                  Navigator.pushReplacementNamed(context, '/insert_boleto', arguments: "");
                }, 
                secondaryLabel: "Adicionar na galeria", 
                secondaryOnPressed: () {}
              ),
            ),
          ),
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_,status,__) {

              if(status.hasError) {
                return BottomSheetWidget(
                  primaryLabel: "Escanear novamente", 
                  primaryOnPressed: () {
                    controller.scanWithCamera();
                  }, 
                  secondaryLabel: "Digitar código", 
                  secondaryOnPressed: () {
                    Navigator.pushReplacementNamed(context, '/insert_boleto');
                  },
                  title: "Não foi possível identificar um código de barras.", 
                  subtitle: "Tente escanear novamente ou digite o código do seu boleto."
                );
              }

              return Container();
            }
          ),
        ],
      ),
    );
  }
}