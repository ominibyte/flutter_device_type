import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_device_type/flutter_device_type.dart';

void main() {
  test('Test that size is not null', () {
    expect(Device.size, isNotNull);
    expect(Device.get().isIphoneX, isNotNull);
  });
}
