import 'package:book_tickets_app/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_layout.dart';

class HotelView extends StatelessWidget {
  const HotelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Container(
      width: size.width*0.6,
      height: 380,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
      margin: const EdgeInsets.only(right: 17, top: 5),
      decoration: BoxDecoration(
        color: Styles.primaryColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 20,
            spreadRadius: 1
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Styles.primaryColor,
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/one.png")
              )
            ),
          ),
          const Gap(10),
          Text("Hanoi Prime Center Hotel", style: Styles.headlineStyle2.copyWith(color: Styles.kakiColor),),
          const Gap(5),
          Text("Hanoi, Hoan Kiem", style: Styles.headlineStyle3.copyWith(color: Colors.white),),
          const Gap(8),
          Text("740.000 VND/night", style: Styles.headlineStyle.copyWith(color: Styles.kakiColor),),
        ],
      ),
    );
  }
}
