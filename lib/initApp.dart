import 'package:flutter/material.dart';

import 'domain/bindings/UserBinding.dart';
import 'utils/Utils.dart';

Future<void> initApp() async {
  WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();

  UsersBinding().dependencies();

  Utils utils = Utils();
}
