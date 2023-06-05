import 'package:book_tickets_app/screens_authenticate/authenticate.dart';
import 'package:flutter/material.dart';

import '../screens_main/bottom_bar.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    //return either home or authenticate widget
    return Authenticate();
  }
}
