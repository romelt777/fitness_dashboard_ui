import 'package:fitness_dashboard_ui/util/responsive.dart';
import 'package:fitness_dashboard_ui/widgets/dashboard/activity_details_widget.dart';
import 'package:fitness_dashboard_ui/widgets/dashboard/bar_graph_widget.dart';
import 'package:fitness_dashboard_ui/widgets/dashboard/header_widget.dart';
import 'package:fitness_dashboard_ui/widgets/dashboard/line_chart_card.dart';
import 'package:fitness_dashboard_ui/widgets/summary/summary_widget.dart';
import 'package:flutter/material.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const SizedBox(height: 18),
            const HeaderWidget(),
            const SizedBox(height: 18),
            const ActivityDetailsCard(),
            const SizedBox(height: 18),
            const LineChartCard(),
            const SizedBox(height: 18),
            const BarGraphCard(),
            const SizedBox(height: 18),
            if (Responsive.isTablet(context)) const SummaryWidget()
          ],
        ),
      ),
    );
  }
}
