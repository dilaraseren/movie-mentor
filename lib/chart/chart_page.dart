import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_mentor/chart/movie_chart.dart';
import 'package:movie_mentor/chart/movie_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartPage extends StatefulWidget {
  const LineChartPage({super.key});

  @override
  State<LineChartPage> createState() => _LineChartPageState();
}

class _LineChartPageState extends State<LineChartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading: BackButton(
          onPressed: () => Navigator.pushReplacementNamed(context, "/profile_page"),
        ),
        ),
        body: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          title: ChartTitle(
            text: "Yıllara göre ülkelerde yayımlanan filmler",
            textStyle: const TextStyle(fontSize: 20),
          ),
          // tooltipBehavior: TooltipBehavior(enable: true),
          // crosshairBehavior: CrosshairBehavior(enable: true),

          legend: Legend(isVisible: true),
          series: <LineSeries<MovieChart, String>>[
            LineSeries(
              name: "Ülkeler",
              color: Colors.orange,
              dataSource: MovieTypeByCountries.DataX,
              xValueMapper: (MovieChart sales, _) => sales.movies,
              yValueMapper: (MovieChart sales, _) => sales.year,
              dataLabelSettings: const DataLabelSettings(isVisible: true),
            ),
            LineSeries(
              name: "Yıllar",
              color: Colors.blueGrey,
              dataSource: MovieTypeByCountries.DataY,
              xValueMapper: (MovieChart sales, _) => sales.movies,
              yValueMapper: (MovieChart sales, _) => sales.year,
              dataLabelSettings: const DataLabelSettings(isVisible: true),
            ),
          ],
        ),
      ),
    );
  }
}