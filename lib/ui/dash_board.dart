import 'package:event_app/ui/booths/booth_listing.dart';
import 'package:event_app/ui/checked_in_customers/checked_in_customers.dart';
import 'package:event_app/ui/custom_widgets/asm_appbar.dart';
import 'package:event_app/ui/scan_qr/scan_qr.dart';
import 'package:event_app/utils/asset_images.dart';
import 'package:event_app/utils/color_resources.dart';
import 'package:event_app/utils/style_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int pageIndex = 0;
  final List<Widget> _screens = [
    BoothListingPage(),
    CheckedInPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AsmAppbar(),
      body: _screens[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        selectedLabelStyle: subHeadingBold.copyWith(color: ColorResources.PRIMARY_MATERIAL),
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: CircleAvatar(
              backgroundColor: pageIndex == 0 ? ColorResources.PRIMARY_MATERIAL : Colors.white,
              child: ImageIcon(
                const AssetImage(Images.pin_location),
                color: pageIndex == 0 ? Colors.white : null,
              ),
            ),
            label: 'Booths',
            tooltip: 'Booths',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: pageIndex == 1 ? ColorResources.PRIMARY_MATERIAL : Colors.white,
              child: ImageIcon(
                const AssetImage(Images.entryIcon),
                color: pageIndex == 1 ? Colors.white : null,
              ),
            ),
            label: 'Check In',
            tooltip: 'Check In',
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      /*    floatingActionButton: FloatingActionButton(
        backgroundColor: ColorResources.PRIMARY_MATERIAL,
        onPressed: () {
          Navigator.push(
            context,
            CupertinoModalPopupRoute(
              builder: (context) => const ScanQRPage(),
            ),
          );
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.qr_code_scanner_sharp, color: Colors.white),
      ),*/
    );
  }
}
