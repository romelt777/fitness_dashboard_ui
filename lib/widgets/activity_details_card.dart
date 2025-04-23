import 'package:fitness_dashboard_ui/data/health_details.dart';
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
        crossAxisCount: 4, //4 items per row
        crossAxisSpacing: 15, //horizontal space between columns
        mainAxisSpacing: 12.0, // vertical spacing between rows
      ),
      itemBuilder: (context,index) => CustomCard(
        child: Container(),
      ),
    );
  }
}
