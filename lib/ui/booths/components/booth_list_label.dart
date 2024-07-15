import 'package:event_app/helper/sized_box.dart';
import 'package:event_app/provider/home_provider.dart';
import 'package:event_app/utils/asset_images.dart';
import 'package:event_app/utils/style_constants.dart';
import 'package:flutter/material.dart';

class BoothListLabel extends StatelessWidget {
  const BoothListLabel({
    super.key,
    required this.details,
  });

  final HomeProvider details;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: const BoxDecoration(color: Colors.white),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  Images.eventMapIcon,
                  height: 30,
                ),
                5.widthBox,
                const Text(
                  'Booth Listing',
                  style: subHeadingBold,
                ),
              ],
            ),
            if (details.allBoothListModel?.booths != null)
              Container(
                constraints: const BoxConstraints(minWidth: 35),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "${details.allBoothListModel!.booths!.length}",
                  style: lightGreyText,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              )
          ],
        ),
      ),
    );
  }
}
