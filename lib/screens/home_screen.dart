import 'package:bookticket/screens/hotel_screen.dart';
import 'package:bookticket/screens/ticket_view.dart';
import 'package:bookticket/utils/app_info_list.dart';
import 'package:bookticket/utils/app_styles.dart';
import 'package:bookticket/widgets/double_text_widget.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          /*

           */
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Gap(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Good morning", style: Styles.headLineStyle3,),
                        const Gap(5),
                        Text("Book Tickets", style: Styles.headLineStyle1,)
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "assets/images/2023.png"
                          )
                        )
                      ),
                    ),
                  ],
                ),
                const Gap(25),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xfff4f6fd),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                  ),
                  child: Row(
                    children: [
                      const Icon(FluentSystemIcons.ic_fluent_search_regular, color: Color(0xffbfc205),),
                      Text("Search", style: Styles.headLineStyle4),
                    ],
                  ),
                ),
                const Gap(40),
                const AppDoubleTextWidget(bigText: "Upcoming Flights", smallText: "View all"),
              ],
            ),
          ),
          const Gap(15.0),
          /*

           */
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: ticketList.map((singleticket) => TicketView(ticket: singleticket)).toList(),
            ),
          ),
          const Gap(15),
          /*

           */
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppDoubleTextWidget(
              bigText: "Hotels",
              smallText: "View all",
            ),
          ),
          const Gap(15),
          /*

           */
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: hotelList.map((hotel) => HotelScreen(hotel: hotel,)).toList(),
              )
          ),
        ],
      ),
    );
  }
}
