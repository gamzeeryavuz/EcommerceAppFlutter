import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;

  const MyButton({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(   
            color:Theme.of(context).colorScheme.primary,
           
          ),  
          padding: const EdgeInsets.all(25), 
          

          child: child, 

        ));
  }
}
