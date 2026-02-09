import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:robertdarin/ui/security/pin_gate.dart';
import 'package:robertdarin/ui/security/pin_lock_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('PIN setup and confirm flow works without auto input', (WidgetTester tester) async {
    var unlocked = false;

    await tester.pumpWidget(
      MaterialApp(
        home: PinLockOverlay(
          userId: 'test-user',
          email: 'test@example.com',
          mode: PinGateMode.setup,
          onUnlocked: () => unlocked = true,
          onSignOut: () async {},
        ),
      ),
    );
    await tester.pumpAndSettle();

    final absorbFinder = find.descendant(
      of: find.byType(PinLockOverlay),
      matching: find.byType(AbsorbPointer),
    );
    final absorb = tester.widget<AbsorbPointer>(absorbFinder);
    expect(absorb.absorbing, isFalse);

    ElevatedButton button = tester.widget(find.byType(ElevatedButton));
    expect(button.onPressed, isNull);

    Future<void> enterPin(String pin) async {
      for (final ch in pin.split('')) {
        final keyFinder = find.widgetWithText(TextButton, ch);
        final keyButton = tester.widget<TextButton>(keyFinder);
        expect(keyButton.onPressed, isNotNull);
        keyButton.onPressed!.call();
        await tester.pump(const Duration(milliseconds: 30));
      }
    }

    await enterPin('1234');
    await tester.pump();

    button = tester.widget(find.byType(ElevatedButton));
    expect(button.onPressed, isNotNull);

    final saveButton = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(saveButton.onPressed, isNotNull);
    saveButton.onPressed!.call();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));
    await tester.runAsync(() => Future.delayed(const Duration(milliseconds: 200)));
    await tester.pump();

    button = tester.widget(find.byType(ElevatedButton));
    expect(button.onPressed, isNull);

    await enterPin('1234');
    await tester.pump();

    button = tester.widget(find.byType(ElevatedButton));
    expect(button.onPressed, isNotNull);

    final confirmButton = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(confirmButton.onPressed, isNotNull);
    confirmButton.onPressed!.call();
    await tester.pump();
    await tester.runAsync(() => Future.delayed(const Duration(milliseconds: 50)));
    await tester.pump();

    expect(unlocked, isTrue);

    final ok = await PinLockService.instance.verifyPin('test-user', '1234');
    expect(ok, isTrue);
  });
}
