import 'package:event_app/helper/navigator_method.dart';
import 'package:event_app/helper/sized_box.dart';
import 'package:event_app/provider/home_provider.dart';
import 'package:event_app/ui/scan_qr/enter_qr_code.dart';
import 'package:event_app/ui/scan_qr/scan_qr_code.dart';
import 'package:event_app/utils/color_resources.dart';
import 'package:event_app/utils/keyboard_util.dart';
import 'package:event_app/utils/size_config.dart';
import 'package:event_app/utils/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQRPage extends StatefulWidget {
  const ScanQRPage({super.key});

  @override
  State<ScanQRPage> createState() => _ScanQRPageState();
}

class _ScanQRPageState extends State<ScanQRPage> with SingleTickerProviderStateMixin {
  String? qrText;
  GlobalKey qrKey = GlobalKey();
  QRViewController? controller;

  bool isQrScanOn = true;

  Future<void> checkQrData(qrCode) async {
    // await Provider.of<HomeProvider>(context, listen: false).scanQr(context, qrCode);
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    closeQr();
    // fetchHomeData();
    super.dispose();
  }

  void closeQr() {
    controller?.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    bool isScanning = true;

    controller.scannedDataStream.listen((scanData) async {
      if (isScanning) {
        qrText = scanData.code;
        controller.pauseCamera();

        onSubmitCode(qrText, () {
          {
            Navigator.of(context).pop();
            isScanning = true;
            controller.resumeCamera();
          }
        });

        isScanning = false;
      }
    });
  }

  onSubmitCode(String? qrText, Function() onOk) async {
    await Provider.of<HomeProvider>(context, listen: false).scanQr(context, qrText).then((response) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(response!.status.toString().toUpperCase()),
            content: SizedBox(
              height: 50,
              child: Column(
                children: [
                  Text(response.message.toString()),
                  // response.transactionData != null ? Text(response.transactionData!.points.toString()) : const SizedBox.shrink(),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: onOk,
                child: const Text(
                  'OK',
                  style: subHeadingPrimaryColor,
                ),
              ),
            ],
          );
        },
      );
    });
  }

  onTabChange(int index) {
    KeyboardUtil.hideKeyboard(context);
    setState(() {
      if (index == 1) {
        controller?.pauseCamera();
      } else {
        controller?.resumeCamera();
      }
    });
  }

  bool torchOn = false;

  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Consumer<HomeProvider>(builder: (context, details, child) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () => popBack(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          title: const Text(
            'Scan QR/ Enter code',
            style: subHeadingBoldWhite,
          ),
          actions: [
            if (_tabController?.index == 0)
              IconButton(
                  onPressed: () async {
                    await controller!.toggleFlash().then((value) {
                      setState(() {
                        torchOn = !torchOn;
                      });
                    });
                  },
                  icon: Icon(torchOn ? Icons.flashlight_off : Icons.flashlight_on)),
            /*  SizedBox(
                width: 65,
                child: FlutterSwitch(
                  activeColor: Colors.green,
                  activeText: 'on',
                  activeTextColor: Colors.white,
                  inactiveText: 'off',
                  activeTextFontWeight: FontWeight.w500,
                  inactiveTextFontWeight: FontWeight.w500,
                  inactiveTextColor: Colors.black,
                  value: isQrScanOn,
                  showOnOff: true,
                  onToggle: (value) {
                    setState(() {
                      isQrScanOn = value;
                    });
                  },
                )),*/
            10.widthBox,
          ],
        ),
        body: SizedBox(
          width: SizeConfig.screenWidth,
          child: Column(
            children: [
              TabBar(
                onTap: onTabChange,
                controller: _tabController,
                tabs: const [
                  Tab(
                    child: Text(
                      "Scan Qr",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Enter code",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
                indicatorColor: ColorResources.PRIMARY_MATERIAL,
              ),
              Expanded(
                child: TabBarView(controller: _tabController, children: [
                  ScanQrCode(
                    homeProvider: details,
                    onQrviewCreated: _onQRViewCreated,
                    qrKey: qrKey,
                  ),
                  EnterQrCode(
                    onQrSubmit: onSubmitCode,
                  )
                ]),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            height: 80,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 10,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.qr_code,
                    color: Colors.white,
                    size: 28,
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      _tabController?.index == 0 ? 'Place a QR code inside the view finder rectangle to scan it' : 'Enter Qr code placed below the QR.',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        /*    bottomNavigationBar: SizedBox(
          height: 100,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                      SizedBox(
                    height: 50,
                    width: SizeConfig.screenWidth! * 0.45,
                    child: ElevatedButton(
                      onPressed: () => popBack(context),
                      style: ElevatedButton.styleFrom(),
                      child: const Text('Submit', style: subHeadingBold),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: SizeConfig.screenWidth! * 0.45,
                    child: ElevatedButton(
                      onPressed: () => popBack(context),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                      child: const Text(
                        'Code Status',
                        style: subHeadingBold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),*/
      );
    });
  }
}
