class BarcodeScannerStatus {

  final bool isCameraAvailable;
  final String error;
  final String barcode;
  final bool stopScanner;

  BarcodeScannerStatus({
    this.isCameraAvailable = false,
    this.error = "", 
    this.barcode = "",
    this.stopScanner = false
  });

  factory BarcodeScannerStatus.available() {
    return BarcodeScannerStatus(
      isCameraAvailable: true,
      stopScanner: false
    );
  }

  factory BarcodeScannerStatus.error(String message) {
    return BarcodeScannerStatus(
      error: message,
      stopScanner: true
    );
  }

  factory BarcodeScannerStatus.barcode(String barcode) {
    return BarcodeScannerStatus(
      barcode: barcode,
      stopScanner: true
    );
  }

  bool get showCamera => isCameraAvailable && error.isEmpty;

  bool get hasError => error.isNotEmpty;

  bool get hasBarcode => barcode.isNotEmpty;
}