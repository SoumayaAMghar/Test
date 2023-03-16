import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/models/BriefBundle.dart';

import '../../../size_config.dart';

class BriefBundelCard extends StatelessWidget {
  final BriefBundle briefBundle;
  final Function press;

  const BriefBundelCard({ required this.briefBundle,required this.press});
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    // Now we dont this Aspect ratio
    return GestureDetector(
      onTap: () { press;},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(defaultSize * 1.8), //18
        ),
        child: Row( 
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(defaultSize * 2), //20
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    Text(
                      briefBundle.title,
                      style: TextStyle(
                          fontSize: defaultSize * 2.2, //22
                          color: Colors.black),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: defaultSize * 0.5), // 5
                    Text(
                      briefBundle.description,
                      style: TextStyle(color: Colors.grey[900]),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    /*Spacer(),
                    buildInfoRow(
                      defaultSize,
                      iconSrc: "assets/icons/pot.svg",
                      text: "${briefBundle.recipes} Recipes",
                    ),
                    SizedBox(height: defaultSize * 0.5), //5
                    buildInfoRow(
                      defaultSize,
                      iconSrc: "assets/icons/chef.svg",
                      text: "${briefBundle.chefs} Chefs",
                    ),*/
                    Spacer(),
                  ],
                ),
              ),
            ),
            SizedBox(width: defaultSize * 0.5), //5
            AspectRatio(
              aspectRatio: 0.71,
              child: Image.asset(
                briefBundle.imageSrc,
                fit: BoxFit.cover,
                alignment: Alignment.centerLeft,
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildInfoRow(double defaultSize, {required String iconSrc, text}) {
    return Row(
      children: <Widget>[
        SvgPicture.asset(iconSrc),
        SizedBox(width: defaultSize), // 10
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
