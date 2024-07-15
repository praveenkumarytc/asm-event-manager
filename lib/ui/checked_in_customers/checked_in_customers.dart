import 'package:event_app/helper/sized_box.dart';
import 'package:event_app/models/checked_in_customer_model.dart';
import 'package:event_app/provider/home_provider.dart';
import 'package:event_app/ui/auth/components/asm_button.dart';
import 'package:event_app/ui/scan_qr/scan_qr.dart';
import 'package:event_app/utils/asset_images.dart';
import 'package:event_app/utils/style_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_select/camera_image_pick.dart';
import 'package:provider/provider.dart';

class CheckedInPage extends StatefulWidget {
  const CheckedInPage({super.key});

  @override
  State<CheckedInPage> createState() => _CheckedInPageState();
}

class _CheckedInPageState extends State<CheckedInPage> {
  getCustomers() async {
    await Provider.of<HomeProvider>(context, listen: false).getCheckedInCustomers(context, null);
  }

  @override
  void initState() {
    getCustomers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, details, child) {
        return Scaffold(
          body: details.checkedInCustomersModel?.list == null
              ? const ProgressBar()
              : RefreshIndicator(
                  onRefresh: () => getCustomers(),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: DataTable(
                        columnSpacing: 20.0,
                        headingRowHeight: 40.0,
                        dataRowHeight: 60.0,
                        headingTextStyle: lightGreyText.copyWith(fontWeight: FontWeight.bold),
                        columns: const [
                          DataColumn(label: Text('Name', style: lightGreyText)),
                          DataColumn(label: Text('Booking ID', style: lightGreyText)),
                          DataColumn(label: Text('Price', style: lightGreyText)),
                          DataColumn(label: Text('Quantity', style: lightGreyText)),
                          DataColumn(label: Text('Ticket Type', style: lightGreyText)),
                          DataColumn(label: Text('Scan Status', style: lightGreyText)),
                        ],
                        rows: details.checkedInCustomersModel!.list!.map((customer) {
                          return DataRow(
                            cells: [
                              DataCell(Text("${customer.fname ?? ''} ${customer.lname ?? ''}", style: priceText)),
                              DataCell(Text(customer.bookingId ?? '', style: priceText)),
                              DataCell(Text(customer.price?.toString() ?? '', style: priceText)),
                              DataCell(Text(customer.quantity ?? '', style: priceText)),
                              DataCell(Text(customer.ticketType == 2 ? "Delegate" : "Visitors", style: priceText)),
                              DataCell(Text(customer.scanStatus == 1 ? 'Checked In' : '- -', style: priceText)),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: AsmButtonButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Scan Ticket',
                    style: subHeadingBoldWhite,
                  ),
                  10.widthBox,
                  const Icon(
                    Icons.qr_code_scanner,
                    color: Colors.white,
                  )
                ],
              ),
              onTap: () async {
                await Navigator.push(
                  context,
                  CupertinoModalPopupRoute(
                    builder: (context) => const ScanQRPage(),
                  ),
                );
                getCustomers();
              },
            ),
          ),
        );
      },
    );
  }
}

class BookedTicket extends StatelessWidget {
  const BookedTicket({
    super.key,
    this.booking,
  });
  final ListElement? booking;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      constraints: const BoxConstraints(minHeight: 150),
      width: double.infinity,
      decoration: const BoxDecoration(
        // color: Colors.white,
        // boxShadow: [
        //   BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 4)
        // ],
        image: DecorationImage(image: AssetImage(Images.booking_bg), fit: BoxFit.fill),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "${booking?.fname ?? ''} ${booking?.fname ?? ''}",
                    style: heading1Bold,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  2.heightBox,
                  Text(
                    'Ticket no: ${booking?.bookingId}',
                    style: priceText.copyWith(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  2.heightBox,
                  2.heightBox,
                  Text(
                    '\$${booking?.price} PAID',
                    style: subHeadingBold.copyWith(fontWeight: FontWeight.bold, color: Colors.green),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
          10.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Ticket Type',
                style: priceText,
              ),
              Text(
                'Total Ticket',
                style: priceText.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                booking?.ticketType != "Visitor Pass" ? Images.delegate_pass_button : Images.visitor_pass_button,
                height: 25,
              ),
              Text(
                '${booking?.quantity} Seat',
                style: priceText.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
