import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:test_app/common/styles.dart';

class CircularProgressIndicatorWidget extends StatelessWidget {
  CircularProgressIndicatorWidget({
    Key? key,
    required this.percentage,
    required this.level,
    required this.progressValue,
    required this.progressTypeValue,
    required this.docFillPercentage,
  }) : super(key: key);
  double percentage;
  double docFillPercentage;
  String level;
  String progressValue;
  String progressTypeValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Positioned(
            top: 10,
            right: 1,
            left: 1,
            bottom: 10,
            child: CircularPercentIndicator(
              radius: 82,
              lineWidth: 20.0,
              animation: true,
              animationDuration: 1500,
              animateFromLastPercent: true,
              percent: percentage,
              center: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        progressValue,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            fontFamily: 'Inter'),
                      ),
                    ],
                  ),
                ],
              ),
              startAngle: 0,
              circularStrokeCap: CircularStrokeCap.round,
              backgroundColor: grey,
              progressColor: pink,
            ),
          ),
          _buildPaiChart(context)
        ]),
      ],
    );
  }

  Widget _buildPaiChart(BuildContext context) {
    return ClipRect(
      child: Align(
        alignment: Alignment.bottomCenter,
        widthFactor: 0.7,
        child: SfRadialGauge(
          // backgroundColor: Colors.orange,
          axes: <RadialAxis>[
            RadialAxis(
              canScaleToFit: true,
              minimum: 0,
              maximum: 100,
              showLabels: false,
              showTicks: false,
              startAngle: 270,
              endAngle: 270,
              radiusFactor: 0.525,
              axisLineStyle: AxisLineStyle(
                thickness: 0.07,
                color: grey.withOpacity(0.4),
                thicknessUnit: GaugeSizeUnit.factor,
              ),
              pointers: <GaugePointer>[
                RangePointer(
                  color: pink,
                  value: docFillPercentage,
                  width: 0.065,
                  pointerOffset: 0,
                  sizeUnit: GaugeSizeUnit.factor,
                )
              ],
            ),
            RadialAxis(
              canScaleToFit: true,
              minimum: 0,
              interval: 1,
              maximum: 3,
              showLabels: false,
              showTicks: true,
              showAxisLine: false,
              tickOffset: -0.05,
              offsetUnit: GaugeSizeUnit.factor,
              minorTicksPerInterval: 0,
              startAngle: 270,
              endAngle: 270,
              radiusFactor: 0.65,
              majorTickStyle: MajorTickStyle(
                  length: 0.3,
                  thickness: 3,
                  lengthUnit: GaugeSizeUnit.factor,
                  color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
