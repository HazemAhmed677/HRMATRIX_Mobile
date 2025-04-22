import 'package:hrmatrix/core/helper/constants.dart';

import 'shard_pref_helper.dart';

Future<String> loadToken() async =>
    await SharedPrefHelper.getSecuredString(SharedPrefKeys.employeeToken);
