import 'package:ai_space/core/constants/const_colors.dart';
import 'package:ai_space/core/constants/constants.dart';
import 'package:flutter/material.dart';

class SpecializedSuggestionWidget extends StatelessWidget {
  const SpecializedSuggestionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
                color: kPrimaryColor, borderRadius: BorderRadius.circular(20)),
            child: Text(
              "Specializes in",
              style: TextStyle(color: kWhiteColor),
            ),
          ),
          Expanded(
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.send_outlined,
                      color: kPrimaryColor,
                    ),
                    label: Text(
                      "Water & Waste Water",
                      style: TextStyle(color: kPrimaryColor),
                    )),
                separatorBuilder: (context, index) => kWidth(10),
                itemCount: 10),
          ),
          Icon(
            Icons.arrow_right_sharp,
            size: 60,
            color: kPrimaryColor,
          )
        ],
      ),
    );
  }
}
