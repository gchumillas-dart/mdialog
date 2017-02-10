import 'dart:async';

import 'package:modal_dialog/modal_dialog.dart';

Future<Null> main() async {
  await alert('It works!');
  if (await confirm('Are you sure?')) {
    print('ok');
  }
}
