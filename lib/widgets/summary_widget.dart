import 'package:fitness_dashboard_ui/widgets/pie_chart_widget.dart';
import 'package:fitness_dashboard_ui/widgets/summary_details_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 20),
          Chart(),
          Text(
            "Summary",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SummaryDetails(),
          ),
        ],
      )
    );
  }
}
