import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BalanceChart extends StatelessWidget {
  final double currentBalance;

  const BalanceChart({super.key, required this.currentBalance});

  @override
  Widget build(BuildContext context) {
    // Get last 5 months
    final now = DateTime.now();
    final months = List.generate(5, (index) {
      final month = DateTime(now.year, now.month - (4 - index), 1);
      return [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec'
      ][month.month - 1];
    });

    return Container(
      height: 250,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 20, 19, 38),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Balance History',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 245, 61),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: LineChart(
              LineChartData(
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipColor: (touchedSpot) =>
                        Colors.blueGrey.withValues(alpha: 0.8),
                    getTooltipItems: (touchedSpots) {
                      return touchedSpots.map((spot) {
                        return LineTooltipItem(
                          '${(spot.y / 100).toStringAsFixed(2)} ₺',
                          const TextStyle(color: Colors.white),
                        );
                      }).toList();
                    },
                  ),
                ),
                gridData: const FlGridData(show: false),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 32,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        const style = TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        );
                        final index = value.toInt();
                        if (index >= 0 && index < months.length) {
                          return Text(months[index], style: style);
                        }
                        return const Text('');
                      },
                    ),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 50,
                      interval: currentBalance / 4,
                      getTitlesWidget: (value, meta) {
                        const style = TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        );
                        return Text(
                          '${(value / 100).toStringAsFixed(0)}₺',
                          style: style,
                          textAlign: TextAlign.center,
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    bottom: BorderSide(
                      color: const Color.fromARGB(255, 0, 245, 61)
                          .withValues(alpha: 0.2),
                      width: 4,
                    ),
                    left: const BorderSide(color: Colors.transparent),
                    right: const BorderSide(color: Colors.transparent),
                    top: const BorderSide(color: Colors.transparent),
                  ),
                ),
                minX: 0,
                maxX: 4,
                minY: 0,
                maxY: currentBalance * 1.2,
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    color: const Color.fromARGB(255, 0, 245, 61),
                    barWidth: 2,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                    spots: [
                      FlSpot(0, currentBalance),
                      FlSpot(1, currentBalance),
                      FlSpot(2, currentBalance),
                      FlSpot(3, currentBalance),
                      FlSpot(4, currentBalance),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
