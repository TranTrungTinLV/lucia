import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

final baseTheme = ThemeData.dark();
final baseTextTheme = GoogleFonts.plusJakartaSansTextTheme(baseTheme.textTheme);

final theme = ThemeData.dark().copyWith(
  textTheme: baseTextTheme.copyWith(
    headlineMedium: baseTextTheme.headlineMedium!.copyWith(
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.w800,
    ),
    headlineSmall: baseTextTheme.headlineSmall!.copyWith(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w800,
    ),
    titleMedium: baseTextTheme.titleMedium!.copyWith(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w800,
    ),
    titleSmall: baseTextTheme.titleSmall!.copyWith(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w800,
    ),
    bodyMedium: baseTextTheme.bodyMedium!.copyWith(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: baseTextTheme.bodySmall!.copyWith(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ),
);

class Freud {
  // Mindful Brown
  static const Color brown10 = Color(0xFFF7F4F2);
  static const Color brown20 = Color(0xFFE8DDD9);
  static const Color brown30 = Color(0xFFD6C2B8);
  static const Color brown40 = Color(0xFFC0A091);
  static const Color brown50 = Color(0xFFAC836C);
  static const Color brown60 = Color(0xFF926247);
  static const Color brown70 = Color(0xFF704A33);
  static const Color brown80 = Color(0xFF4F3422);
  static const Color brown90 = Color(0xFF372315);
  static const Color brown100 = Color(0xFF251404);

  // Optimistic Gray
  static const Color gray10 = Color(0xFFF5F5F5);
  static const Color gray20 = Color(0xFFE1E1E0);
  static const Color gray30 = Color(0xFFC9C7C5);
  static const Color gray40 = Color(0xFFACA9A5);
  static const Color gray50 = Color(0xFF928D86);
  static const Color gray60 = Color(0xFF736B66);
  static const Color gray70 = Color(0xFF5A554E);
  static const Color gray80 = Color(0xFF3F3C36);
  static const Color gray90 = Color(0xFF292723);
  static const Color gray100 = Color(0xFF161513);

  // Serenity Green
  static const Color green10 = Color(0xFFF0F2E8);
  static const Color green20 = Color(0xFFE5EAD7);
  static const Color green30 = Color(0xFFCFD9B5);
  static const Color green40 = Color(0xFFB4C48D);
  static const Color green50 = Color(0xFF9BB068);
  static const Color green60 = Color(0xFF7D944D);
  static const Color green70 = Color(0xFF5A6B38);
  static const Color green80 = Color(0xFF3D4A26);
  static const Color green90 = Color(0xFF29321A);
  static const Color green100 = Color(0xFF191E10);

  // Empathy Orange
  static const Color orange10 = Color(0xFFFFEDD5);
  static const Color orange20 = Color(0xFFFED7AA);
  static const Color orange30 = Color(0xFFFDBA74);
  static const Color orange40 = Color(0xFFFB8728);
  static const Color orange50 = Color(0xFFF97010);
  static const Color orange60 = Color(0xFFEA580C);
  static const Color orange70 = Color(0xFFC2410C);
  static const Color orange80 = Color(0xFF9A3412);
  static const Color orange90 = Color(0xFF7C2D12);
  static const Color orange100 = Color(0xFF431407);

  // Zen Yellow
  static const Color yellow10 = Color(0xFFFEF9C3);
  static const Color yellow20 = Color(0xFFFEF08A);
  static const Color yellow30 = Color(0xFFFDE047);
  static const Color yellow40 = Color(0xFFFACC15);
  static const Color yellow50 = Color(0xFFEAB308);
  static const Color yellow60 = Color(0xFFCA8A04);
  static const Color yellow70 = Color(0xFFA16207);
  static const Color yellow80 = Color(0xFF854D0E);
  static const Color yellow90 = Color(0xFF713F12);
  static const Color yellow100 = Color(0xFF422006);

  // Kind Purple
  static const Color purple10 = Color(0xFFEDE9FE);
  static const Color purple20 = Color(0xFFDDD6FE);
  static const Color purple30 = Color(0xFFC4B5FD);
  static const Color purple40 = Color(0xFFA78BFA);
  static const Color purple50 = Color(0xFF8B5CF6);
  static const Color purple60 = Color(0xFF7F45E2);
  static const Color purple70 = Color(0xFF7035CC);
  static const Color purple80 = Color(0xFF5D2AAD);
  static const Color purple90 = Color(0xFF4E248E);
  static const Color purple100 = Color(0xFF2E1065);

  // Present Red
  static const Color red10 = Color(0xFFFFE4E6);
  static const Color red20 = Color(0xFFFECDD3);
  static const Color red30 = Color(0xFFFDA4AF);
  static const Color red40 = Color(0xFFFB7185);
  static const Color red50 = Color(0xFFF43F5E);
  static const Color red60 = Color(0xFFE11D48);
  static const Color red70 = Color(0xFFBE123C);
  static const Color red80 = Color(0xFF9F1239);
  static const Color red90 = Color(0xFF881337);
  static const Color red100 = Color(0xFF4C0519);
}
