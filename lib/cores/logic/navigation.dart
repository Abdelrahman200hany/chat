import 'package:flutter/material.dart';

void NavigateTo({required Widget To  ,required context })
{
 Navigator.push(context, MaterialPageRoute(builder: (context)=>To ));

}