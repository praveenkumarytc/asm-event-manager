import 'package:event_app/main.dart';
import 'package:event_app/provider/auth_provider.dart';
import 'package:event_app/utils/asset_images.dart';
import 'package:event_app/utils/color_resources.dart';
import 'package:event_app/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AsmAppbar extends StatelessWidget implements PreferredSize {
  const AsmAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorResources.PRIMARY_MATERIAL,
      toolbarHeight: 60.0.h(),
      iconTheme: const IconThemeData(color: Colors.white),
      title: Image.asset(
        Images.asmAppbarLogo,
        width: SizeConfig.screenWidth * 0.4,
      ),
      actions: [
        PopupMenuButton(
          color: Colors.white,
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                  onTap: () {
                    showDialog(
                      context: navigatorKey.currentContext!,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Confirm Logout'),
                          content: const Text('Are you sure you want to log out?'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop(); // Dismiss the dialog
                              },
                            ),
                            TextButton(
                              child: const Text('Logout'),
                              onPressed: () {
                                Navigator.of(context).pop();
                                Provider.of<AuthProvider>(navigatorKey.currentContext!, listen: false).logOut(navigatorKey.currentContext!);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    color: Colors.white,
                    child: const Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: Colors.black,
                        ),
                        Text("Log Out"),
                      ],
                    ),
                  ))
            ];
          },
        ),
        // IconButton(
        //   onPressed: () {},
        //   icon: const Icon(
        //     Icons.notifications_outlined,
        //     color: Colors.white,
        //   ),
        // ),
        // 5.heightBox,
        // IconButton(
        //   onPressed: () {},
        //   icon: const Icon(
        //     Icons.bookmark_outline,
        //     color: Colors.white,
        //   ),
        // ),

        // TextButton(
        //   child: const Text(
        //     "Booths",
        //     style: subHeadingBoldWhite,
        //   ),
        //   onPressed: () {
        //     routeCuperTo(context, const EventBoothScreen());
        //   },
        // ),
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size.fromHeight(60.0.h());
}
