import 'package:bimo_app/utils/color_utils.dart';
import 'package:flutter/material.dart';

class IndicatorWidget extends StatefulWidget {
  IndicatorWidget({Key? key, required this.number}) : super(key: key);
  final int number;

  @override
  State<IndicatorWidget> createState() => _IndicatorWidgetState();
}

class _IndicatorWidgetState extends State<IndicatorWidget> {
  Widget dot({required bool active}) {
    return Container(
      width: 26.0,
      height: 26.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? CustomColors.blueDefault : CustomColors.blackAsh,
      ),
    );
  }

  Widget dotPlaceholder() {
    return Container(
      height: 26,
      width: 20,
    );
  }

  Widget line({required bool active, required double width}) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: width,
            height: 6,
            decoration: BoxDecoration(
              color: active ? CustomColors.blueDefault : CustomColors.blackAsh,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 4;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        children: [
          Row(
            children: [
              dotPlaceholder(),
              line(active: widget.number > 1, width: width),
              dotPlaceholder(),
              line(active: widget.number > 2, width: width),
              dotPlaceholder(),
              line(active: widget.number > 3, width: width),
              dotPlaceholder(),
            ],
          ),
          Row(
            children: [
              dot(active: true),
              Expanded(
                  child: Container(
                color: Colors.transparent,
              )),
              dot(active: widget.number > 1),
              Expanded(
                  child: Container(
                color: Colors.transparent,
              )),
              dot(active: widget.number > 2),
              Expanded(
                  child: Container(
                color: Colors.blue,
              )),
              dot(active: widget.number > 3),
            ],
          ),
        ],
      ),
    );
  }
}
