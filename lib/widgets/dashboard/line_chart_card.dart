
import 'package:fitness_dashboard_ui/const/constant.dart';
import 'package:fitness_dashboard_ui/data/dashboard_data/line_chart_data.dart';
import 'package:fitness_dashboard_ui/widgets/custom_card_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartCard extends StatelessWidget {
  const LineChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    final data = LineData();

    return CustomCard(
      child: Column(
        //align to left
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Steps Overview", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          const SizedBox(height: 20),
          AspectRatio(
            aspectRatio: 16 / 6,
            child: LineChart(
              LineChartData(
                lineTouchData: LineTouchData(handleBuiltInTouches: true),
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      //what widget to render for each tick on bottom axis
                      //value => numberic value
                      getTitlesWidget: (double value, TitleMeta meta) {
                        return data.bottomTitle[value.toInt()] != null
                            //if title exists: return sideTitleWidget with label text
                            ? SideTitleWidget(
                              meta:meta,
                              child: Text(
                                //label being shown
                                data.bottomTitle[value.toInt()].toString(),
                                style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                              ),
                            )
                            //if doesnt exist, return nothing
                            : const SizedBox();
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval:1, //tick every 1 unit
                      reservedSize: 40,//Reserve space (padding) for the labels
                      //what widget to render for each tick on bottom axis
                      //value => numberic value
                      getTitlesWidget: (double value, TitleMeta meta) {
                        return data.leftTitle[value.toInt()] != null
                            //if title exists: return sideTitleWidget with label text
                            ? SideTitleWidget(
                              meta:meta,
                              child: Text(
                                //label being shown
                                data.leftTitle[value.toInt()].toString(),
                                style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                              ),
                            )
                            //if doesnt exist, return nothing
                            : const SizedBox();
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    color: selectionColor,
                    barWidth: 2.5,
                    //show gradient below the bar
                    belowBarData: BarAreaData(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end:Alignment.bottomCenter,
                        colors: [
                          // ignore: deprecated_member_use
                          selectionColor.withOpacity(0.5),
                          Colors.transparent
                        ],
                      ),
                      show: true,
                    ),
                    //no dots on line
                    dotData: FlDotData(show:false),
                    //passing the data from spots (line_chart_data)
                    spots:data.spots,
                  )
                ],
                //chart mins/max
                minX:0,
                maxX: 120,
                minY: -5,
                maxY: 105,

              ),
            ),
          ),
        ],
      ),
    );
  }
}
