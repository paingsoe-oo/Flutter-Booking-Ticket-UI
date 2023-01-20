import 'package:bookticket/screens/ticket_screen.dart';
import 'package:bookticket/widgets/column_layout.dart';
import 'package:bookticket/widgets/layout_builder_widget.dart';
import 'package:bookticket/widgets/thick_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../utils/app_layout.dart';
import '../utils/app_styles.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor;

  const TicketView({Key? key, required this.ticket, this.isColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    return SizedBox(
      width: size.width * 0.85,
      height: AppLayout.getHeight(
        GetPlatform.isAndroid == true ? 167 : 169,
      ),
      child: Container(
        margin: EdgeInsets.only(right: AppLayout.getHeight(16)),
        child: Column(
          children: [
            /**
            showing blue part of the card/ticket
             **/
            Container(
              decoration: BoxDecoration(
                color: isColor == null ? Color(0xff526799) : Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppLayout.getHeight(20)),
                    topRight: Radius.circular(21)),
              ),
              padding: EdgeInsets.all(AppLayout.getHeight(16)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        ticket['from']['code'],
                        style: isColor == null
                            ? Styles.headLineStyle3
                                .copyWith(color: Colors.white)
                            : Styles.headLineStyle3,
                      ),
                      const Spacer(), // Expanded(child: Container(),)
                      ThickContainer(
                        isColor: true,
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            SizedBox(
                              height: AppLayout.getHeight(24),
                              child: AppLayoutBuilderWidget(section: 6),
                            ),
                            Center(
                                child: Transform.rotate(
                              angle: 1.5,
                              child: Icon(Icons.local_airport_rounded,
                                  color: isColor == null
                                      ? Colors.white
                                      : Color(0xff8accf7)),
                            )),
                          ],
                        ),
                      ),
                      ThickContainer(
                        isColor: true,
                      ),
                      const Spacer(),
                      Text(
                        ticket['to']['code'],
                        style: isColor == null
                            ? Styles.headLineStyle3
                                .copyWith(color: Colors.white)
                            : Styles.headLineStyle4,
                      ),
                    ],
                  ),
                  const Gap(3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: AppLayout.getWidth(100),
                        child: Text(
                          ticket['from']['name'],
                          style: isColor == null
                              ? Styles.headLineStyle4
                                  .copyWith(color: Colors.white)
                              : Styles.headLineStyle4,
                        ),
                      ),
                      Text(
                        ticket['flying-time'],
                        style: isColor == null
                            ? Styles.headLineStyle4
                                .copyWith(color: Colors.white)
                            : Styles.headLineStyle4,
                      ),
                      SizedBox(
                        width: AppLayout.getWidth(100),
                        child: Text(
                          ticket['to']['name'],
                          style: isColor == null
                              ? Styles.headLineStyle4
                                  .copyWith(color: Colors.white)
                              : Styles.headLineStyle4,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            /*
            showing orange part of the card/ticket
             */
            Container(
              color: isColor == null ? Styles.orangeColor : Colors.white,
              child: Row(
                children: [
                  SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          )),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return Flex(
                          direction: Axis.horizontal,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                              (constraints.constrainWidth() / 15).floor(),
                              (index) => SizedBox(
                                    width: 5,
                                    height: 1,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: isColor == null
                                            ? Colors.grey.shade300
                                            : Colors.white,
                                      ),
                                    ),
                                  )),
                        );
                      },
                    ),
                  )),
                  SizedBox(
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: isColor == null
                              ? Colors.grey.shade300
                              : Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            /*
            bottom part of the orange card/ticket
             */
            Container(
              decoration: BoxDecoration(
                color: isColor == null ? Styles.orangeColor : Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(isColor == null ? 21 : 0),
                    bottomRight: Radius.circular(isColor == null ? 21 : 0)),
              ),
              padding: const EdgeInsets.only(
                  left: 16, top: 10, right: 16, bottom: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnLayout(
                          firstText: ticket['date'],
                          secondText: "Date",
                          alignment: CrossAxisAlignment.start,
                          isColor: isColor),
                      AppColumnLayout(
                          firstText: ticket['departure_time'],
                          secondText: "Departure time",
                          alignment: CrossAxisAlignment.center,
                          isColor: isColor),
                      AppColumnLayout(
                          firstText: ticket['number'].toString(),
                          secondText: "Number",
                          alignment: CrossAxisAlignment.end,
                          isColor: isColor),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
