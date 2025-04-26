import 'package:flutter/material.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;

  const StepIndicator({Key? key, required this.currentStep}) : super(key: key);

  Widget stepCircle(int step) {
    bool isCompleted = currentStep > step;
    bool isCurrent = currentStep == step;

    Widget child;
    if (isCompleted) {
      child = Icon(Icons.check, color: brandGoldColor, size: 20);
    } else if (isCurrent) {
      child = Container(
        width: 12,
        height: 12,
        decoration: const BoxDecoration(
          color: brandGoldColor,
          shape: BoxShape.circle,
        ),
      );
    } else {
      child = Icon(Icons.circle_outlined, color: Colors.white, size: 14);
    }

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: isCompleted ? Colors.white : Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(color: brandGoldColor, width: 2),
      ),
      child: Center(child: child),
    );
  }

  Widget buildStep(int step, String label, bool isLast) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              stepCircle(step),
              if (!isLast)
                Expanded(
                  child: Container(
                    height: 2,
                    color: currentStep > step ? brandGoldColor : brandGoldColor,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontFamily: 'JosefinSans',
                  fontSize: 12,
                  color: currentStep >= step ? brandGreyColor : brandGreyColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildStep(1, 'Allocated', false),
        buildStep(2, 'Inprogress', false),
        buildStep(3, 'Completed', false),
        buildStep(4, 'Delivered', true),
      ],
    );
  }
}
