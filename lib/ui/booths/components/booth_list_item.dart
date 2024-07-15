import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_app/helper/sized_box.dart';
import 'package:event_app/models/all_booth_list_model.dart';
import 'package:event_app/ui/booths/geo_map_booth.dart';
import 'package:event_app/utils/app_constants.dart';
import 'package:event_app/utils/asset_images.dart';
import 'package:event_app/utils/style_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoothListItem extends StatelessWidget {
  const BoothListItem({
    super.key,
    required this.booth,
  });

  final Booth? booth;

  @override
  Widget build(BuildContext context) {
    if (booth == null) {
      return const SizedBox.shrink();
    }
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: const BoxDecoration(color: Colors.white),
          padding: const EdgeInsets.all(15),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                CupertinoDialogRoute(builder: (context) => BoothGeoLocation(booth: booth!), context: context),
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: "${AppConstants.IMAGE_BASE_URL_EVENT}",
                          placeholder: (context, url) => Image.asset(Images.eventThumbnail),
                          errorWidget: (context, url, error) => Image.asset(Images.eventThumbnail),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    10.widthBox,
                    SizedBox(
                      height: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Booth',
                            style: lightGreyText.copyWith(fontWeight: FontWeight.bold),
                          ),
                          10.widthBox,
                          Text(
                            '${booth!.boothName}',
                            style: subHeadingBold,
                          ),
                          10.widthBox,
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                            decoration: BoxDecoration(
                              color: '${booth!.status}' == "Available" ? Colors.green : Colors.blueAccent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                // const Icon(
                                //   Icons.call,
                                //   color: Colors.white,
                                //   size: 16,
                                // ),
                                2.widthBox,
                                Text(
                                  '${booth!.status}',
                                  style: subHeadingBold.copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ),
        Positioned(
            right: 20,
            top: 10,
            child: Icon(
              (booth?.boothLatitude == null || booth?.boothLongitude == null) ? Icons.location_off_outlined : Icons.location_on_rounded,
              color: (booth?.boothLatitude == null || booth?.boothLongitude == null) ? Colors.red : Colors.green,
            ))
      ],
    );
  }
}
