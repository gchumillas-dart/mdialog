import 'dart:async';

import 'package:modal_dialog/modal_dialog.dart';

Future<Null> main() async {
  await alert('We will proceed to format the Hard Disk');
  print('Ok, you\'ve been alerted');

  if (await confirm('Are you sure?')) {
    print('Formating Hard Disk ...');
  }
}
