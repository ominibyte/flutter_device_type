import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test that size is not null', () {
    expect(Device.size, isNotNull);
    expect(Device.get().isIphoneX, isNotNull);
    expect(Device.get().hasNotch, isNotNull);
  });
}
