import 'package:event_app/helper/sized_box.dart';
import 'package:event_app/provider/home_provider.dart';
import 'package:event_app/ui/scan_qr/scan_qr.dart';
import 'package:event_app/ui/booths/components/booth_list_item.dart';
import 'package:event_app/ui/booths/components/booth_list_label.dart';
import 'package:event_app/ui/custom_widgets/asm_appbar.dart';
import 'package:event_app/utils/color_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_select/camera_image_pick.dart';
import 'package:provider/provider.dart';

class BoothListingPage extends StatefulWidget {
  const BoothListingPage({super.key});

  @override
  State<BoothListingPage> createState() => _BoothListingPageState();
}

class _BoothListingPageState extends State<BoothListingPage> {
  getBooths() async {
    await Provider.of<HomeProvider>(context, listen: false).getAllBooths(context);
  }

  @override
  void initState() {
    getBooths();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, details, child) {
      return Scaffold(
        body: details.allBoothListModel == null
            ? const ProgressBar()
            : Column(
                children: [
                  BoothListLabel(
                    details: details,
                  ),
                  5.heightBox,
                  Expanded(
                    flex: 2,
                    child: RefreshIndicator(
                      onRefresh: () => getBooths(),
                      child: ListView.builder(
                        itemCount: details.allBoothListModel?.booths?.length,
                        itemBuilder: (context, index) {
                          return BoothListItem(
                            booth: details.allBoothListModel?.booths?[index],
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
      );
    });
  }
}
