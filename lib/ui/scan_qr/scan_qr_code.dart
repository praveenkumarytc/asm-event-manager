import 'package:event_app/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_select/camera_image_pick.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrCode extends StatelessWidget {
  const ScanQrCode({super.key, required this.homeProvider, required this.onQrviewCreated, required this.qrKey});

  final HomeProvider homeProvider;
  final Function(QRViewController) onQrviewCreated;
  final Key qrKey;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: homeProvider.isLoading ? 0.5 : 1,
          child: QRView(
            cameraFacing: CameraFacing.back,
            key: qrKey,
            overlay: QrScannerOverlayShape(
              borderRadius: 10,
              borderColor: Colors.white,
              borderLength: 40,
              borderWidth: 5,
              cutOutBottomOffset: 0,
              cutOutHeight: 400,
              cutOutWidth: MediaQuery.of(context).size.width * 0.8,
              overlayColor: Colors.black87,
            ),
            onQRViewCreated: onQrviewCreated,
          ),
        ),
        Visibility(
          visible: homeProvider.isLoading,
          child: const ProgressBar(),
        )
      ],
    );
  }
}
