import "package:flutter/material.dart";

class ChartBar extends StatelessWidget {
  final String label;
  final int duration;
  final double durationPercentage;

  ChartBar(this.label, this.duration, this.durationPercentage);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: < Widget > [
        FittedBox(child: Text('${duration.toString()}')),
        SizedBox(height: 4, ),
        Container(
          height: 60,
          width: 10,

          child: Stack(
            children: < Widget > [
              Container(decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                color: Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(10),
              ), ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FractionallySizedBox(
                  heightFactor: durationPercentage,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                ),
              ),
            ]
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ]
    );
  }
}