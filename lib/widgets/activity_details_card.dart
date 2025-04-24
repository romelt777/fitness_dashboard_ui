import 'package:fitness_dashboard_ui/data/health_details_data.dart';
import 'package:fitness_dashboard_ui/util/responsive.dart';
import 'package:fitness_dashboard_ui/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';

class ActivityDetailsCard extends StatelessWidget {
  const ActivityDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final healthDetails = HealthDetails();

    return GridView.builder(
      itemCount: healthDetails.healthData.length, 
      //shrinkwrap=true: take up only required space to fill items
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      //grid with fixed number of columns
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Responsive.isMobile(context) ? 2 : 4, // 2 or 4 items per row
        crossAxisSpacing: Responsive.isMobile(context) ? 12 : 15, //horizontal space between columns
        mainAxisSpacing: 12.0, // vertical spacing between rows
      ),
      itemBuilder: (context,index) => CustomCard(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //vertical
          crossAxisAlignment: CrossAxisAlignment.center, //horizontal
          children: [
            Image.asset(
              healthDetails.healthData[index].icon,
              width: 30,
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(top:15,bottom: 4),
              child: Text(
                healthDetails.healthData[index].value,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              healthDetails.healthData[index].title,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  }
}
