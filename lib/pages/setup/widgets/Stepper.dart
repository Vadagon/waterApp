import 'package:flutter/material.dart';

class NavStepper extends StatefulWidget {
  final int index;

  const NavStepper({Key key, this.index});
  @override
  _NavStepperState createState() => _NavStepperState(this.index);
}

class _NavStepperState extends State<NavStepper> {

  _NavStepperState(int index);
  @override
    void initState() {
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 72,
      child: Stepper(
            type: StepperType.horizontal,
            currentStep: widget.index,
            steps: <Step>[
               Step(
                title:  Text('Gender'),
                content:  Text('This is the first step.'),
                isActive: widget.index >= 0,
                state: widget.index >= 0 ? StepState.complete : StepState.disabled,
              ),
               Step(
                title:  Text('Weight'),
                content:  Text('This is the second step.'),
                isActive: widget.index >= 0,
                state: widget.index >= 1 ? StepState.complete : StepState.disabled,
              ),
               Step(
                title:  Text('Height'),
                content:  Text('This is the third step.'),
                isActive: widget.index >= 0,
                state: widget.index >= 2 ? StepState.complete : StepState.disabled,
              ),
                Step(
                title:  Text('Years'),
                content:  Text('This is the third step.'),
                isActive: widget.index >= 0,
                state: widget.index >= 3 ? StepState.complete : StepState.disabled,
              ),
              
            ],
          ),
    );
  }
}