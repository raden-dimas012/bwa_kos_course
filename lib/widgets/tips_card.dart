import 'package:bwa_kos_course/models/tips.dart';
import 'package:bwa_kos_course/theme.dart';
import 'package:flutter/material.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;
  TipsCard(this.tips);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          tips.imageUrl,
          width: 80,
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tips.title,
              style: blackTextStyle.copyWith(
                fontSize: 18,
              ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                tips.updateAt,
                style: greyTextStyle,
              ),
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.chevron_right),
          color: greyColor,
        )
      ],
    );
  }
}