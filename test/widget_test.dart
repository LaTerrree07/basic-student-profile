import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:student_profile_app/student_profile_app.dart';

void main() {
  testWidgets('Student information and hobbies are present', (tester) async {
    await tester.pumpWidget(const StudentProfileApp());
    for (final text in [
      'Student Profile',
      'EL',
      'Earth Justin Lim',
      'BS Information Technology',
      '553550',
      '3rd Year - PS303',
      'CCE106L',
      'e.lim.553550@umindanao.edu.ph',
      'About Me',
      'Watching movies',
      'Playing badminton',
      'Listening to music',
    ]) {
      expect(find.text(text), findsOneWidget);
    }
    expect(
      find.textContaining('My goal is to develop useful applications'),
      findsOneWidget,
    );
    expect(find.byType(Chip), findsNWidgets(3));
    expect(tester.takeException(), isNull);
  });

  for (final width in [320.0, 390.0, 1024.0]) {
    for (final scale in [1.0, 2.0]) {
      testWidgets('Profile at width $width with ${scale}x text', (
        tester,
      ) async {
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);
        addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
        tester.view.devicePixelRatio = 1;
        tester.view.physicalSize = Size(width, 700);
        tester.platformDispatcher.textScaleFactorTestValue = scale;

        await tester.pumpWidget(const StudentProfileApp());
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);

        final profileContext = tester.element(
          find.byType(SingleChildScrollView),
        );
        expect(MediaQuery.textScalerOf(profileContext).scale(16), 16 * scale);
        expect(Theme.of(profileContext).useMaterial3, isTrue);
        expect(
          Theme.of(profileContext).colorScheme.primary,
          const Color(0xFF142D4E),
        );

        // Wrapping must preserve every line rather than silently truncate text.
        for (final paragraph in tester.renderObjectList<RenderParagraph>(
          find.byType(RichText),
        )) {
          expect(
            paragraph.didExceedMaxLines,
            isFalse,
            reason: paragraph.text.toPlainText(),
          );
          final left = paragraph.localToGlobal(Offset.zero).dx;
          expect(left, greaterThanOrEqualTo(0));
          expect(left + paragraph.size.width, lessThanOrEqualTo(width));
        }

        final scrollable = tester.state<ScrollableState>(
          find.byType(Scrollable),
        );
        expect(scrollable.position.maxScrollExtent, greaterThan(0));
        expect(find.text('Student Profile').hitTestable(), findsOneWidget);
        await tester.drag(
          find.byType(SingleChildScrollView),
          const Offset(0, -300),
        );
        await tester.pumpAndSettle();
        expect(scrollable.position.pixels, greaterThan(0));
        await tester.ensureVisible(find.text('Listening to music'));
        await tester.pumpAndSettle();
        expect(find.text('Listening to music').hitTestable(), findsOneWidget);
        expect(tester.takeException(), isNull);
      });
    }
  }
}
