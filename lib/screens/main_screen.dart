import 'package:fitness_dashboard_ui/util/responsive.dart';
import 'package:fitness_dashboard_ui/widgets/dashboard/dashboard_widget.dart';
import 'package:fitness_dashboard_ui/widgets/side_menu_widget.dart';
import 'package:fitness_dashboard_ui/widgets/summary/summary_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      drawer: !isDesktop
        ? SizedBox(
            width: 250,
            child: Container(
              color: Colors.black,
              child:SideMenuWidget(),
            ),
          )
        : null,
      endDrawer: Responsive.isMobile(context)
        ? SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Container(
            color: Colors.black,
            child: SummaryWidget(),
          )
        )
        : null,
      body: SafeArea(
        child: Row(
          children: [
            if (isDesktop)
              Expanded(
                //flex is int/total int value
                //2/12
                flex: 2,
                child: SizedBox(child: SideMenuWidget()),
              ),
            Expanded(flex: 7, child: DashboardWidget()),
            if (isDesktop)
              Expanded(flex: 3, child: SummaryWidget()),
          ],
        ),
      ),
    );
  }
}
