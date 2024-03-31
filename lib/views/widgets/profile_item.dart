import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final String name;
  const ProfileItem({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(name,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),),InkWell(child: Icon(size:25,Icons.arrow_forward,color:Theme.of(context).primaryColor)),]),
    );
  }
}