// =============================================================================
// Copyright (c) 2026 Dr. Ziad Ahmed El-Samman. All Rights Reserved.
// Developed & Owned by Dr. Ziad Ahmed El-Samman - Habitium Prime.
// =============================================================================
// HABITIUM PRIME — ULTRA-LUXURY GLASSMORPHIC HABIT TRACKER
// 100% Self-Contained Single File Ready for DartPad, Zapp.run & Production Flutter
// Multi-Language Support (Top 10 Global Languages with RTL support for Arabic)
// =============================================================================

import 'dart:async';
import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Color(0xFF08090B),
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const HabitiumPrimeApp());
}

// =============================================================================
// 1. GLOBAL MULTI-LANGUAGE LOCALIZATION SYSTEM (TOP 10 GLOBAL LANGUAGES)
// =============================================================================
enum AppLanguage {
  en, // English
  ar, // العربية (RTL)
  zh, // 中文
  es, // Español
  hi, // हिन्दी
  fr, // Français
  ru, // Русский
  pt, // Português
  de, // Deutsch
  ja, // 日本語
}

class LanguageMeta {
  final AppLanguage language;
  final String code;
  final String nativeName;
  final String englishName;
  final bool isRtl;

  const LanguageMeta({
    required this.language,
    required this.code,
    required this.nativeName,
    required this.englishName,
    this.isRtl = false,
  });
}

class AppLocalization {
  static const List<LanguageMeta> supportedLanguages = [
    LanguageMeta(language: AppLanguage.en, code: 'en', nativeName: 'English', englishName: 'English'),
    LanguageMeta(language: AppLanguage.ar, code: 'ar', nativeName: 'العربية', englishName: 'Arabic', isRtl: true),
    LanguageMeta(language: AppLanguage.zh, code: 'zh', nativeName: '中文', englishName: 'Chinese (Simplified)'),
    LanguageMeta(language: AppLanguage.es, code: 'es', nativeName: 'Español', englishName: 'Spanish'),
    LanguageMeta(language: AppLanguage.hi, code: 'hi', nativeName: 'हिन्दी', englishName: 'Hindi'),
    LanguageMeta(language: AppLanguage.fr, code: 'fr', nativeName: 'Français', englishName: 'French'),
    LanguageMeta(language: AppLanguage.ru, code: 'ru', nativeName: 'Русский', englishName: 'Russian'),
    LanguageMeta(language: AppLanguage.pt, code: 'pt', nativeName: 'Português', englishName: 'Portuguese'),
    LanguageMeta(language: AppLanguage.de, code: 'de', nativeName: 'Deutsch', englishName: 'German'),
    LanguageMeta(language: AppLanguage.ja, code: 'ja', nativeName: '日本語', englishName: 'Japanese'),
  ];

  static final Map<AppLanguage, Map<String, String>> _translations = {
    AppLanguage.en: {
      'app_name': 'Habitium Prime',
      'tagline': 'Ultra-Luxury Habit Tracker',
      'user_title': 'Alexander Vance',
      'user_tier': 'Titan Tier · 1,840 XP',
      'day_streak': 'Day Streak',
      'streak_lost': 'Streak Lost!',
      'restore_21d': 'Restore 21d',
      'today_output': "TODAY'S OUTPUT",
      'rituals_done': 'Rituals Done',
      'streak_shield': 'Streak Shield',
      'armed': 'Armed',
      'auto_freeze': '24h auto-freeze protection',
      'double_xp': 'Double XP',
      'active_2x': '2X Active',
      'xp_per_task': '+150 XP/task',
      'todays_rituals': "Today's Rituals",
      'new_ritual': 'New Ritual',
      'sponsored': 'SPONSORED',
      'partner_title': 'WHOOP 4.0 Titanium',
      'partner_desc': 'Passive biometric strain & recovery sync directly to Habitium rituals.',
      'nav_rituals': 'Rituals',
      'nav_social': 'Social Room',
      'nav_shield': 'Streak Shield',
      'room_badge': 'ELITE CHALLENGE ROOM',
      'room_multiplier': '1.5X XP Multiplier',
      'room_title': 'Obsidian 5AM Club',
      'room_desc': 'High-performers executing rituals before sunrise.',
      'pool_text': 'Pool: 1,240 Days',
      'members_active': '48 Members Active',
      'tab_leaderboard': 'Leaderboard',
      'tab_activity': 'Live Activity Feed',
      'done_today': 'Done Today',
      'completed': 'completed',
      'ad_title': 'Lost your Streak?',
      'ad_desc': 'Watch a 15-sec video to Restore your 21-Day Streak immediately.',
      'watch_video_btn': 'Watch 15-Sec Video (Restore Streak)',
      'video_complete': 'Video Complete!',
      'video_complete_desc': 'Your 21-Day Streak is eligible for immediate recovery.',
      'restore_streak_btn': 'Restore 21-Day Streak!',
      'sponsor_label': 'Patek Philippe Sponsor',
      'calatrava': 'Calatrava Masterworks',
      'calatrava_tagline': 'Master Your Hours.',
      'sovereign_streak': 'Day Sovereign Streak',
      'personal_best': 'Personal Best: 45 Days · Top 1% Global',
      'matrix_title': '21-Day Adherence Matrix',
      'full_adherence': '100% Adherence',
      'token_bank': 'Freeze Shield Token Bank',
      'tokens_available': 'tokens available. 1 consumed automatically on missed cutoff.',
      'simulate_loss': 'Simulate Streak Loss (Test Rewarded Ad)',
      'create_ritual': 'Create Ritual',
      'cadence_hint': 'e.g. Zone 2 Endurance Cadence',
      'enshrine_btn': 'Enshrine Ritual',
      'copyright_footer': '© 2026 Habitium Prime by Dr. Ziad Ahmed El-Samman. All Rights Reserved.',
      'select_language': 'Select Global Language',
    },
    AppLanguage.ar: {
      'app_name': 'هابيتيوم برايم',
      'tagline': 'متتبع العادات الفاخر النخبوي',
      'user_title': 'ألكسندر فانس',
      'user_tier': 'رتبة التيتان · ١,٨٤٠ نقطة',
      'day_streak': 'أيام متتالية',
      'streak_lost': 'فقدت السلسلة!',
      'restore_21d': 'استعادة ٢١ يوماً',
      'today_output': 'معدل إنجاز اليوم',
      'rituals_done': 'طقوس مكتملة',
      'streak_shield': 'درع حماية السلسلة',
      'armed': 'مفعل',
      'auto_freeze': 'تجميد تلقائي لمدة ٢٤ ساعة للحماية',
      'double_xp': 'مضاعفة النقاط',
      'active_2x': 'نشط ٢×',
      'xp_per_task': '+١٥٠ نقطة/عادة',
      'todays_rituals': 'طقوس اليوم',
      'new_ritual': 'طقس جديد',
      'sponsored': 'برعاية',
      'partner_title': 'ووب ٤.٠ تيتانيوم',
      'partner_desc': 'مزامنة قياسات الإجهاد والتعافي الحيوية مباشرة مع عاداتك.',
      'nav_rituals': 'الطقوس',
      'nav_social': 'غرفة التحدي',
      'nav_shield': 'درع السلسلة',
      'room_badge': 'غرفة التحدي النخبوية',
      'room_multiplier': 'مضاعف ١.٥× للنقاط',
      'room_title': 'نادي الخامسة صباحاً الأوبسيدياني',
      'room_desc': 'نخبة الرواد الملتزمين بإنجاز طقوسهم قبل شروق الشمس.',
      'pool_text': 'المجموع: ١,٢٤٠ يوماً',
      'members_active': '٤٨ عضواً نشطاً',
      'tab_leaderboard': 'لوحة الصدارة',
      'tab_activity': 'البث المباشر للإنجازات',
      'done_today': 'مكتمل اليوم',
      'completed': 'أنجز',
      'ad_title': 'هل فقدت سلسلتك الذهبية؟',
      'ad_desc': 'شاهد إعلاناً فاخراً مدته ١٥ ثانية لاستعادة سلسلة الـ ٢١ يوماً فوراً دون غرامة.',
      'watch_video_btn': 'مشاهدة فيديو ١٥ ثانية (استعادة السلسلة)',
      'video_complete': 'اكتملت المشاهدة بنجاح!',
      'video_complete_desc': 'تم التحقق. سلسلتك المكونة من ٢١ يوماً جاهزة للاسترداد الفوري.',
      'restore_streak_btn': 'استعادة سلسلة الـ ٢١ يوماً الآن!',
      'sponsor_label': 'برعاية باتيك فيليب الفاخرة',
      'calatrava': 'روائع كالاترافا الخالدة',
      'calatrava_tagline': 'أتقن إدارة ساعاتك وسيطر على مستقبلك.',
      'sovereign_streak': 'يوماً من السيادة المتواصلة',
      'personal_best': 'الرقم القياسي: ٤٥ يوماً · النخبة العالمية ١٪',
      'matrix_title': 'مصفوفة التزام ٢١ يوماً',
      'full_adherence': 'التزام بنسبة ١٠٠٪',
      'token_bank': 'بنك رموز تجميد السلسلة',
      'tokens_available': 'رموز متاحة. يُستهلك رمز تلقائياً عند فوات موعد الإنجاز.',
      'simulate_loss': 'محاكاة فقدان السلسلة (اختبار الإعلان المكافئ)',
      'create_ritual': 'تأسيس طقس جديد',
      'cadence_hint': 'مثال: تمارين التحمل زون ٢',
      'enshrine_btn': 'حفظ وتثبيت الطقس',
      'copyright_footer': '© 2026 Habitium Prime by Dr. Ziad Ahmed El-Samman. All Rights Reserved.',
      'select_language': 'اختر اللغة العالمية',
    },
    AppLanguage.zh: {
      'app_name': 'Habitium Prime 极致习惯',
      'tagline': '奢华暗黑拟态习惯追踪器',
      'user_title': '亚历山大·万斯',
      'user_tier': '泰坦等级 · 1,840 经验值',
      'day_streak': '天连续',
      'streak_lost': '连续中断！',
      'restore_21d': '恢复21天记录',
      'today_output': '今日达成率',
      'rituals_done': '个习惯已达成',
      'streak_shield': '连胜护盾',
      'armed': '已就绪',
      'auto_freeze': '24小时自动防冻结保护',
      'double_xp': '双倍经验',
      'active_2x': '双倍激活',
      'xp_per_task': '每个习惯+150经验',
      'todays_rituals': '今日习惯仪式',
      'new_ritual': '创建新习惯',
      'sponsored': '赞助合作',
      'partner_title': 'WHOOP 4.0 钛合金版',
      'partner_desc': '无感体征负荷与恢复监测，无缝同步至习惯系统。',
      'nav_rituals': '日常仪式',
      'nav_social': '社交擂台',
      'nav_shield': '连胜护盾',
      'room_badge': '精英挑战空间',
      'room_multiplier': '1.5倍经验加成',
      'room_title': '黑曜石清晨5点俱乐部',
      'room_desc': '在日出破晓之前执行高产习惯的先锋群体。',
      'pool_text': '全员总计：1,240天',
      'members_active': '48位精英成员在线',
      'tab_leaderboard': '荣誉排行榜',
      'tab_activity': '实时动态流',
      'done_today': '今日已成',
      'completed': '刚刚完成了',
      'ad_title': '中断了连续记录？',
      'ad_desc': '观看专属尊享15秒短片，即刻无损挽回21天荣耀记录。',
      'watch_video_btn': '观看15秒视频（立即恢复）',
      'video_complete': '观看完毕！',
      'video_complete_desc': '核验成功，您的21天连续记录可立即恢复。',
      'restore_streak_btn': '立即恢复21天连续记录！',
      'sponsor_label': '百达翡丽尊贵赞助',
      'calatrava': 'Calatrava 经典系列',
      'calatrava_tagline': '主宰光阴，传承非凡。',
      'sovereign_streak': '天卓越连续记录',
      'personal_best': '历史最佳：45天 · 位列全球前1%',
      'matrix_title': '21天全勤成就矩阵',
      'full_adherence': '100% 达成率',
      'token_bank': '冻结护盾代币库',
      'tokens_available': '枚护盾可用。错过截止时间时自动抵扣1枚。',
      'simulate_loss': '模拟断签（体验激励广告恢复）',
      'create_ritual': '铸造新习惯',
      'cadence_hint': '例如：二区有氧心肺耐力',
      'enshrine_btn': '铭刻此习惯',
      'copyright_footer': '© 2026 Habitium Prime by Dr. Ziad Ahmed El-Samman. All Rights Reserved.',
      'select_language': '切换全球语言',
    },
    AppLanguage.es: {
      'app_name': 'Habitium Prime',
      'tagline': 'Rastreador de Hábitos de Ultra Lujo',
      'user_title': 'Alexander Vance',
      'user_tier': 'Nivel Titán · 1.840 XP',
      'day_streak': 'Días de Racha',
      'streak_lost': '¡Racha Perdida!',
      'restore_21d': 'Restaurar 21d',
      'today_output': 'RENDIMIENTO HOY',
      'rituals_done': 'Rituales Completados',
      'streak_shield': 'Escudo de Racha',
      'armed': 'Armado',
      'auto_freeze': 'Protección de congelación 24h activa',
      'double_xp': 'Doble XP',
      'active_2x': '2X Activo',
      'xp_per_task': '+150 XP/ritual',
      'todays_rituals': 'Rituales de Hoy',
      'new_ritual': 'Nuevo Ritual',
      'sponsored': 'PATROCINADO',
      'partner_title': 'WHOOP 4.0 Titanium',
      'partner_desc': 'Sincronización biométrica pasiva de esfuerzo y recuperación.',
      'nav_rituals': 'Rituales',
      'nav_social': 'Sala Social',
      'nav_shield': 'Escudo de Racha',
      'room_badge': 'SALA DE DESAFÍO ÉLITE',
      'room_multiplier': 'Multiplicador 1.5X XP',
      'room_title': 'Club Obsidiana 5AM',
      'room_desc': 'Líderes de alto rendimiento antes del amanecer.',
      'pool_text': 'Total: 1.240 Días',
      'members_active': '48 Miembros Activos',
      'tab_leaderboard': 'Clasificación',
      'tab_activity': 'Actividad en Vivo',
      'done_today': 'Hoy',
      'completed': 'completó',
      'ad_title': '¿Perdiste tu Racha?',
      'ad_desc': 'Mira un video de 15 segundos para restaurar tu Racha de 21 Días de inmediato.',
      'watch_video_btn': 'Ver Video de 15s (Restaurar Racha)',
      'video_complete': '¡Video Completado!',
      'video_complete_desc': 'Tu racha de 21 días está lista para ser recuperada.',
      'restore_streak_btn': '¡Restaurar Racha de 21 Días!',
      'sponsor_label': 'Patrocinador Patek Philippe',
      'calatrava': 'Obras Maestras Calatrava',
      'calatrava_tagline': 'Domina tus horas.',
      'sovereign_streak': 'Días de Racha Soberana',
      'personal_best': 'Récord Personal: 45 Días · Top 1% Global',
      'matrix_title': 'Matriz de Adherencia de 21 Días',
      'full_adherence': '100% Adherencia',
      'token_bank': 'Banco de Fichas de Congelación',
      'tokens_available': 'fichas disponibles. Se consume 1 automáticamente.',
      'simulate_loss': 'Simular Pérdida de Racha (Probar Anuncio)',
      'create_ritual': 'Crear Ritual',
      'cadence_hint': 'ej. Cadencia Zona 2 de Resistencia',
      'enshrine_btn': 'Consagrar Ritual',
      'copyright_footer': '© 2026 Habitium Prime by Dr. Ziad Ahmed El-Samman. All Rights Reserved.',
      'select_language': 'Seleccionar Idioma Global',
    },
    AppLanguage.hi: {
      'app_name': 'हबिटियम प्राइम',
      'tagline': 'अल्ट्रा-लक्जरी हैबिट ट्रैकर',
      'user_title': 'अलेक्जेंडर वेंस',
      'user_tier': 'टाइटन स्तर · 1,840 XP',
      'day_streak': 'दिन की स्ट्रीक',
      'streak_lost': 'स्ट्रीक टूटी!',
      'restore_21d': '21 दिन पुनर्प्राप्त करें',
      'today_output': 'आज का आउटपुट',
      'rituals_done': 'आदतें पूर्ण हुईं',
      'streak_shield': 'स्ट्रीक शील्ड',
      'armed': 'सक्रिय',
      'auto_freeze': '24 घंटे का ऑटो-फ्रीज सुरक्षा कवच',
      'double_xp': 'डबल XP',
      'active_2x': '2X सक्रिय',
      'xp_per_task': '+150 XP/कार्य',
      'todays_rituals': 'आज की आदतें',
      'new_ritual': 'नई आदत जोड़ें',
      'sponsored': 'प्रायोजित',
      'partner_title': 'WHOOP 4.0 टाइटेनियम',
      'partner_desc': 'बायोमेट्रिक तनाव और रिकवरी डेटा का सीधा समन्वय।',
      'nav_rituals': 'आदतें',
      'nav_social': 'सोशल रूम',
      'nav_shield': 'स्ट्रीक शील्ड',
      'room_badge': 'एलीट चैलेंज रूम',
      'room_multiplier': '1.5X XP गुणक',
      'room_title': 'ऑब्सिडियन 5 AM क्लब',
      'room_desc': 'सूर्योदय से पहले लक्ष्यों को हासिल करने वाले उच्च निष्पादक।',
      'pool_text': 'कुल पूल: 1,240 दिन',
      'members_active': '48 सदस्य सक्रिय',
      'tab_leaderboard': 'लीडरबोर्ड',
      'tab_activity': 'लाइव गतिविधियाँ',
      'done_today': 'आज पूर्ण',
      'completed': 'ने पूर्ण किया',
      'ad_title': 'क्या आपकी स्ट्रीक टूट गई?',
      'ad_desc': 'अपनी 21-दिवसीय स्ट्रीक तुरंत पुनर्प्राप्त करने के लिए 15 सेकंड का वीडियो देखें।',
      'watch_video_btn': '15 सेकंड का वीडियो देखें (स्ट्रीक बहाल करें)',
      'video_complete': 'वीडियो पूर्ण हुआ!',
      'video_complete_desc': 'आपकी 21-दिवसीय स्ट्रीक तुरंत पुनर्प्राप्ति के लिए तैयार है।',
      'restore_streak_btn': '21-दिवसीय स्ट्रीक तुरंत बहाल करें!',
      'sponsor_label': 'पटेक फिलिप स्पॉन्सर',
      'calatrava': 'कैलात्रावा मास्टरवर्क्स',
      'calatrava_tagline': 'अपने समय पर अधिकार रखें।',
      'sovereign_streak': 'दिन की सर्वोच्च स्ट्रीक',
      'personal_best': 'व्यक्तिगत सर्वश्रेष्ठ: 45 दिन · शीर्ष 1% वैश्विक',
      'matrix_title': '21-दिवसीय निरंतरता मैट्रिक्स',
      'full_adherence': '100% निरंतरता',
      'token_bank': 'फ्रीज शील्ड टोकन बैंक',
      'tokens_available': 'टोकन उपलब्ध। चूकने पर 1 टोकन स्वतः उपयोग होता है।',
      'simulate_loss': 'स्ट्रीक टूटने का परीक्षण करें',
      'create_ritual': 'नई आदत स्थापित करें',
      'cadence_hint': 'जैसे: ज़ोन 2 कार्डियो स्टेमिना',
      'enshrine_btn': 'आदत स्थापित करें',
      'copyright_footer': '© 2026 Habitium Prime by Dr. Ziad Ahmed El-Samman. All Rights Reserved.',
      'select_language': 'वैश्विक भाषा चुनें',
    },
    AppLanguage.fr: {
      'app_name': 'Habitium Prime',
      'tagline': 'Suivi des Habitudes Ultra-Luxe',
      'user_title': 'Alexander Vance',
      'user_tier': 'Rang Titan · 1 840 XP',
      'day_streak': 'Jours de Série',
      'streak_lost': 'Série Perdue !',
      'restore_21d': 'Restaurer 21j',
      'today_output': "RENDEMENT D'AUJOURD'HUI",
      'rituals_done': 'Rituels Accomplis',
      'streak_shield': 'Bouclier de Série',
      'armed': 'Armé',
      'auto_freeze': 'Protection de gel automatique 24h',
      'double_xp': 'Double XP',
      'active_2x': '2X Actif',
      'xp_per_task': '+150 XP/rituel',
      'todays_rituals': "Rituels d'Aujourd'hui",
      'new_ritual': 'Nouveau Rituel',
      'sponsored': 'SPONSORISÉ',
      'partner_title': 'WHOOP 4.0 Titane',
      'partner_desc': 'Synchronisation biométrique passive de récupération et de strain.',
      'nav_rituals': 'Rituels',
      'nav_social': 'Salon Social',
      'nav_shield': 'Bouclier',
      'room_badge': 'SALON DÉFI ÉLITE',
      'room_multiplier': 'Multiplicateur XP 1.5X',
      'room_title': 'Club Obsidienne 5H',
      'room_desc': 'Exécuter ses rituels fondamentaux avant le lever du soleil.',
      'pool_text': 'Total : 1 240 Jours',
      'members_active': '48 Membres Actifs',
      'tab_leaderboard': 'Classement',
      'tab_activity': 'Activité en Direct',
      'done_today': "Aujourd'hui",
      'completed': 'a accompli',
      'ad_title': 'Série Interrompue ?',
      'ad_desc': 'Regardez une vidéo de 15 sec pour restaurer immédiatement votre série de 21 jours.',
      'watch_video_btn': 'Voir la vidéo 15s (Restaurer)',
      'video_complete': 'Vidéo Terminée !',
      'video_complete_desc': 'Votre série de 21 jours est éligible à la récupération immédiate.',
      'restore_streak_btn': 'Restaurer la Série de 21 Jours !',
      'sponsor_label': 'Sponsor Patek Philippe',
      'calatrava': 'Chefs-d’œuvre Calatrava',
      'calatrava_tagline': 'Maîtrisez votre temps.',
      'sovereign_streak': 'Jours de Série Souveraine',
      'personal_best': 'Record : 45 Jours · Top 1% Mondial',
      'matrix_title': 'Matrice d’Adhérence 21 Jours',
      'full_adherence': '100% Adhérence',
      'token_bank': 'Banque de Jetons Bouclier',
      'tokens_available': 'jetons disponibles. 1 consommé automatiquement.',
      'simulate_loss': 'Simuler la Perte de Série (Tester la Pub)',
      'create_ritual': 'Créer un Rituel',
      'cadence_hint': 'ex. Endurance Zone 2 Cardiaque',
      'enshrine_btn': 'Graver le Rituel',
      'copyright_footer': '© 2026 Habitium Prime by Dr. Ziad Ahmed El-Samman. All Rights Reserved.',
      'select_language': 'Choisir la Langue',
    },
    AppLanguage.ru: {
      'app_name': 'Habitium Prime',
      'tagline': 'Премиальный Трекер Привычек',
      'user_title': 'Александр Вэнс',
      'user_tier': 'Ранг Титана · 1 840 XP',
      'day_streak': 'Дней Серии',
      'streak_lost': 'Серия Прервана!',
      'restore_21d': 'Восстановить 21д',
      'today_output': 'РЕЗУЛЬТАТ СЕГОДНЯ',
      'rituals_done': 'Ритуалов Завершено',
      'streak_shield': 'Щит Серии',
      'armed': 'Активен',
      'auto_freeze': '24-часовая автозащита от сгорания',
      'double_xp': 'Двойной XP',
      'active_2x': '2X Активен',
      'xp_per_task': '+150 XP/ритуал',
      'todays_rituals': 'Ритуалы Сегодня',
      'new_ritual': 'Новый Ритуал',
      'sponsored': 'СПОНСОР',
      'partner_title': 'WHOOP 4.0 Titanium',
      'partner_desc': 'Пассивная биометрическая синхронизация нагрузки и сна.',
      'nav_rituals': 'Ритуалы',
      'nav_social': 'Клуб',
      'nav_shield': 'Щит Серии',
      'room_badge': 'ЭЛИТНЫЙ КЛУБ',
      'room_multiplier': 'Множитель 1.5X XP',
      'room_title': 'Обсидиановый Клуб 5 Утра',
      'room_desc': 'Лидеры, выполняющие главные ритуалы до рассвета солнца.',
      'pool_text': 'Общий пул: 1 240 Дней',
      'members_active': '48 Участников Онлайн',
      'tab_leaderboard': 'Таблица Лидеров',
      'tab_activity': 'Лента Событий',
      'done_today': 'Сегодня',
      'completed': 'выполнил',
      'ad_title': 'Потеряли Серию?',
      'ad_desc': 'Посмотрите 15-секундное видео, чтобы мгновенно восстановить серию 21 дня без потерь.',
      'watch_video_btn': 'Смотреть видео 15 сек (Восстановить)',
      'video_complete': 'Просмотр Завершен!',
      'video_complete_desc': 'Ваша 21-дневная серия подтверждена для мгновенного возврата.',
      'restore_streak_btn': 'Восстановить 21-Дневную Серию!',
      'sponsor_label': 'Спонсор Patek Philippe',
      'calatrava': 'Шедевры Calatrava',
      'calatrava_tagline': 'Властвуйте над своим временем.',
      'sovereign_streak': 'Дней Непрерывной Серии',
      'personal_best': 'Рекорд: 45 Дней · Топ 1% в Мире',
      'matrix_title': 'Матрица 21 Дня',
      'full_adherence': '100% Выполнение',
      'token_bank': 'Банк Защитных Токенов',
      'tokens_available': 'токенов доступно. Списывается при пропуске дедлайна.',
      'simulate_loss': 'Симулировать Срыв Серии (Тест Рекламы)',
      'create_ritual': 'Создать Ритуал',
      'cadence_hint': 'напр. Зона 2 Кардио Выносливость',
      'enshrine_btn': 'Закрепить Ритуал',
      'copyright_footer': '© 2026 Habitium Prime by Dr. Ziad Ahmed El-Samman. All Rights Reserved.',
      'select_language': 'Выбрать Язык',
    },
    AppLanguage.pt: {
      'app_name': 'Habitium Prime',
      'tagline': 'Rastreador de Hábitos de Luxo',
      'user_title': 'Alexander Vance',
      'user_tier': 'Nível Titã · 1.840 XP',
      'day_streak': 'Dias de Sequência',
      'streak_lost': 'Sequência Perdida!',
      'restore_21d': 'Restaurar 21d',
      'today_output': 'PRODUÇÃO DE HOJE',
      'rituals_done': 'Rituais Concluídos',
      'streak_shield': 'Escudo de Sequência',
      'armed': 'Armado',
      'auto_freeze': 'Proteção de congelamento automático 24h',
      'double_xp': 'XP em Dobro',
      'active_2x': '2X Ativo',
      'xp_per_task': '+150 XP/ritual',
      'todays_rituals': 'Rituais de Hoje',
      'new_ritual': 'Novo Ritual',
      'sponsored': 'PATROCINADO',
      'partner_title': 'WHOOP 4.0 Titânio',
      'partner_desc': 'Sincronização biométrica passiva de recuperação e esforço.',
      'nav_rituals': 'Rituais',
      'nav_social': 'Sala Social',
      'nav_shield': 'Escudo',
      'room_badge': 'SALA DE DESAFIO ELITE',
      'room_multiplier': 'Multiplicador 1.5X XP',
      'room_title': 'Clube Obsidiana 5AM',
      'room_desc': 'Indivíduos de alta performance antes do amanhecer.',
      'pool_text': 'Total: 1.240 Dias',
      'members_active': '48 Membros Ativos',
      'tab_leaderboard': 'Classificação',
      'tab_activity': 'Atividade ao Vivo',
      'done_today': 'Hoje',
      'completed': 'completou',
      'ad_title': 'Perdeu sua Sequência?',
      'ad_desc': 'Assista a um vídeo de 15 segundos para restaurar seus 21 Dias imediatamente.',
      'watch_video_btn': 'Assistir Vídeo de 15s (Restaurar)',
      'video_complete': 'Vídeo Concluído!',
      'video_complete_desc': 'Sua sequência de 21 dias está pronta para restauração.',
      'restore_streak_btn': 'Restaurar Sequência de 21 Dias!',
      'sponsor_label': 'Patrocínio Patek Philippe',
      'calatrava': 'Obras-Primas Calatrava',
      'calatrava_tagline': 'Domine as suas horas.',
      'sovereign_streak': 'Dias de Sequência Soberana',
      'personal_best': 'Recorde Pessoal: 45 Dias · Top 1% Global',
      'matrix_title': 'Matriz de Aderência de 21 Dias',
      'full_adherence': '100% Aderência',
      'token_bank': 'Banco de Fichas de Proteção',
      'tokens_available': 'fichas disponíveis. 1 consumida ao perder prazo.',
      'simulate_loss': 'Simular Perda de Sequência (Testar Anúncio)',
      'create_ritual': 'Criar Ritual',
      'cadence_hint': 'ex. Cadência de Zona 2 Cardíaca',
      'enshrine_btn': 'Consagrar Ritual',
      'copyright_footer': '© 2026 Habitium Prime by Dr. Ziad Ahmed El-Samman. All Rights Reserved.',
      'select_language': 'Selecionar Idioma Global',
    },
    AppLanguage.de: {
      'app_name': 'Habitium Prime',
      'tagline': 'Ultra-Luxus Gewohnheiten-Tracker',
      'user_title': 'Alexander Vance',
      'user_tier': 'Titan Rang · 1.840 XP',
      'day_streak': 'Tage Serie',
      'streak_lost': 'Serie Verloren!',
      'restore_21d': '21 Tage Wiederherstellen',
      'today_output': 'HEUTIGE LEISTUNG',
      'rituals_done': 'Rituale Erledigt',
      'streak_shield': 'Serien-Schild',
      'armed': 'Aktiv',
      'auto_freeze': '24h automatischer Einfrierschutz',
      'double_xp': 'Doppelte XP',
      'active_2x': '2X Aktiv',
      'xp_per_task': '+150 XP/Ritual',
      'todays_rituals': 'Heutige Rituale',
      'new_ritual': 'Neues Ritual',
      'sponsored': 'GESPONSERT',
      'partner_title': 'WHOOP 4.0 Titan',
      'partner_desc': 'Passive biometrische Belastungs- & Erholungssynchronisierung.',
      'nav_rituals': 'Rituale',
      'nav_social': 'Social Room',
      'nav_shield': 'Schild',
      'room_badge': 'ELITE CHALLENGE RAUM',
      'room_multiplier': '1.5X XP Multiplikator',
      'room_title': 'Obsidian 5 Uhr Club',
      'room_desc': 'Spitzenleistung vor dem Sonnenaufgang etablieren.',
      'pool_text': 'Gesamtpool: 1.240 Tage',
      'members_active': '48 Aktive Mitglieder',
      'tab_leaderboard': 'Bestenliste',
      'tab_activity': 'Live Aktivitätsfeed',
      'done_today': 'Heute',
      'completed': 'erledigte',
      'ad_title': 'Serie Verloren?',
      'ad_desc': '15-Sekunden Video ansehen, um die 21-Tage-Serie sofort wiederherzustellen.',
      'watch_video_btn': '15-Sek Video ansehen (Wiederherstellen)',
      'video_complete': 'Video Beendet!',
      'video_complete_desc': 'Ihre 21-Tage-Serie ist zur sofortigen Wiederherstellung bereit.',
      'restore_streak_btn': '21-Tage-Serie Jetzt Wiederherstellen!',
      'sponsor_label': 'Patek Philippe Sponsor',
      'calatrava': 'Calatrava Meisterwerke',
      'calatrava_tagline': 'Beherrschen Sie Ihre Zeit.',
      'sovereign_streak': 'Tage Souveräne Serie',
      'personal_best': 'Persönliche Bestleistung: 45 Tage · Top 1% Global',
      'matrix_title': '21-Tage Adhärenz-Matrix',
      'full_adherence': '100% Erfüllung',
      'token_bank': 'Einfrier-Token Bank',
      'tokens_available': 'Token verfügbar. 1 wird bei Fristversäumnis verbraucht.',
      'simulate_loss': 'Serienverlust Simulieren (Ad Testen)',
      'create_ritual': 'Ritual Erstellen',
      'cadence_hint': 'z.B. Zone 2 Ausdauer Kadenz',
      'enshrine_btn': 'Ritual Verankern',
      'copyright_footer': '© 2026 Habitium Prime by Dr. Ziad Ahmed El-Samman. All Rights Reserved.',
      'select_language': 'Sprache Wählen',
    },
    AppLanguage.ja: {
      'app_name': 'Habitium Prime 極上の習慣',
      'tagline': 'ウルトララグジュアリー習慣トラッカー',
      'user_title': 'アレクサンダー・ヴァンス',
      'user_tier': 'タイタン階級 · 1,840 XP',
      'day_streak': '日連続達成',
      'streak_lost': '連続記録ストップ！',
      'restore_21d': '21日記録を復活',
      'today_output': '本日の達成率',
      'rituals_done': '個の習慣完了',
      'streak_shield': '連続シールド',
      'armed': '配備完了',
      'auto_freeze': '24時間自動フリーズ保護機能',
      'double_xp': 'XP2倍ブースト',
      'active_2x': '2倍発動中',
      'xp_per_task': '習慣ごとに+150 XP',
      'todays_rituals': '本日の習慣儀式',
      'new_ritual': '新規儀式を作成',
      'sponsored': '公式パートナー',
      'partner_title': 'WHOOP 4.0 チタニウム',
      'partner_desc': '生体負荷と回復指標をパッシブにHabitiumへ同期。',
      'nav_rituals': '儀式',
      'nav_social': 'ソーシャルルーム',
      'nav_shield': '連続シールド',
      'room_badge': 'エリート挑戦ルーム',
      'room_multiplier': '1.5倍 XP乗数',
      'room_title': 'オブシディアン 朝5時クラブ',
      'room_desc': '日の出前に卓越した習慣を完遂するトップパフォーマー。',
      'pool_text': '総累計：1,240日',
      'members_active': '48名のメンバーが活動中',
      'tab_leaderboard': 'リーダーボード',
      'tab_activity': 'ライブアクティビティ',
      'done_today': '本日完了',
      'completed': 'が完了しました',
      'ad_title': '連続記録が途切れましたか？',
      'ad_desc': '15秒のリワード動画を視聴すると、21日間の連続記録を即座に無損害で復元できます。',
      'watch_video_btn': '15秒動画を視聴（記録を即座に復活）',
      'video_complete': '動画視聴完了！',
      'video_complete_desc': '認証完了。21日間の連続記録を即座に復活できます。',
      'restore_streak_btn': '21日間の記録を今すぐ復活！',
      'sponsor_label': 'パテック フィリップ 提供',
      'calatrava': 'カラトラバの至高の傑作',
      'calatrava_tagline': '時を支配し、次世代へ受け継ぐ。',
      'sovereign_streak': '日間の覇者連続記録',
      'personal_best': '自己最高：45日 · 世界上位1%のエリート',
      'matrix_title': '21日間継続達成マトリクス',
      'full_adherence': '達成率 100%',
      'token_bank': 'フリーズシールド金庫',
      'tokens_available': '個配備中。期限超過時に自動で1個消費されます。',
      'simulate_loss': '途切れをシミュレート（リワード広告体験）',
      'create_ritual': '新たな儀式を創出',
      'cadence_hint': '例：ゾーン2 持久力トレーニング',
      'enshrine_btn': '習慣を刻み込む',
      'copyright_footer': '© 2026 Habitium Prime by Dr. Ziad Ahmed El-Samman. All Rights Reserved.',
      'select_language': '言語を切り替える',
    },
  };

  static String tr(AppLanguage lang, String key) {
    return _translations[lang]?[key] ?? _translations[AppLanguage.en]?[key] ?? key;
  }

  static bool isRtl(AppLanguage lang) {
    return lang == AppLanguage.ar;
  }
}

// =============================================================================
// 2. DESIGN TOKENS & COLOR PALETTE
// =============================================================================
class HabitiumColors {
  static const Color obsidianBackground = Color(0xFF08090B);
  static const Color obsidianSurface = Color(0xFF0D0F12);
  static const Color obsidianCard = Color(0xFF13171F);
  static const Color obsidianBorder = Color(0x1AFFFFFF);

  static const Color electricMint = Color(0xFF00FF9D);
  static const Color emeraldGlow = Color(0xFF05B36F);
  static const Color goldRose = Color(0xFFFFD700);
  static const Color goldAccent = Color(0xFFD4AF37);
  static const Color crimsonWarning = Color(0xFFFF4D4D);

  static const Color slatePrimary = Color(0xFFF8FAFC);
  static const Color slateMuted = Color(0xFF94A3B8);
  static const Color slateSubtle = Color(0xFF64748B);
}

// =============================================================================
// 3. DATA MODELS
// =============================================================================
enum HabitCategory { mind, body, focus, recovery, craft }

class HabitItem {
  final String id;
  final String title;
  final HabitCategory category;
  final String target;
  final int streakDays;
  final int xpReward;
  final IconData icon;
  bool isCompleted;

  HabitItem({
    required this.id,
    required this.title,
    required this.category,
    required this.target,
    required this.streakDays,
    required this.xpReward,
    required this.icon,
    this.isCompleted = false,
  });

  String getCategoryLabel(AppLanguage lang) {
    switch (category) {
      case HabitCategory.mind:
        return lang == AppLanguage.ar ? 'العقل' : (lang == AppLanguage.zh ? '心智' : (lang == AppLanguage.ja ? '知性' : 'Mind'));
      case HabitCategory.body:
        return lang == AppLanguage.ar ? 'الجسد' : (lang == AppLanguage.zh ? '体魄' : (lang == AppLanguage.ja ? '身体' : 'Body'));
      case HabitCategory.focus:
        return lang == AppLanguage.ar ? 'التركيز' : (lang == AppLanguage.zh ? '专注' : (lang == AppLanguage.ja ? '集中' : 'Focus'));
      case HabitCategory.recovery:
        return lang == AppLanguage.ar ? 'التعافي' : (lang == AppLanguage.zh ? '恢复' : (lang == AppLanguage.ja ? '回復' : 'Recovery'));
      case HabitCategory.craft:
        return lang == AppLanguage.ar ? 'الإتقان' : (lang == AppLanguage.zh ? '技艺' : (lang == AppLanguage.ja ? '鍛錬' : 'Craft'));
    }
  }
}

class FriendUser {
  final String id;
  final String name;
  final String handle;
  final int rank;
  final int streak;
  final int xp;
  final int habitsDone;
  final int totalHabits;
  int cheers;
  bool hasCheered;

  FriendUser({
    required this.id,
    required this.name,
    required this.handle,
    required this.rank,
    required this.streak,
    required this.xp,
    required this.habitsDone,
    required this.totalHabits,
    this.cheers = 0,
    this.hasCheered = false,
  });
}

class LiveActivity {
  final String id;
  final String userName;
  final String habitTitle;
  final String category;
  final String timeAgo;
  final int streak;
  final int xp;
  int cheers;
  bool userCheered;

  LiveActivity({
    required this.id,
    required this.userName,
    required this.habitTitle,
    required this.category,
    required this.timeAgo,
    required this.streak,
    required this.xp,
    this.cheers = 0,
    this.userCheered = false,
  });
}

// =============================================================================
// 4. MAIN APPLICATION ROOT
// =============================================================================
class HabitiumPrimeApp extends StatefulWidget {
  const HabitiumPrimeApp({super.key});

  @override
  State<HabitiumPrimeApp> createState() => _HabitiumPrimeAppState();
}

class _HabitiumPrimeAppState extends State<HabitiumPrimeApp> {
  AppLanguage _currentLanguage = AppLanguage.en;

  void _changeLanguage(AppLanguage newLang) {
    setState(() {
      _currentLanguage = newLang;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isRtl = AppLocalization.isRtl(_currentLanguage);

    return MaterialApp(
      title: 'Habitium Prime',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: HabitiumColors.obsidianBackground,
        fontFamily: 'Roboto',
        colorScheme: const ColorScheme.dark(
          primary: HabitiumColors.electricMint,
          secondary: HabitiumColors.goldRose,
          surface: HabitiumColors.obsidianSurface,
        ),
      ),
      builder: (context, child) {
        return Directionality(
          textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
          child: child!,
        );
      },
      home: MainNavigationShell(
        currentLanguage: _currentLanguage,
        onLanguageChanged: _changeLanguage,
      ),
    );
  }
}

// =============================================================================
// 5. MAIN NAVIGATION SHELL
// =============================================================================
class MainNavigationShell extends StatefulWidget {
  final AppLanguage currentLanguage;
  final ValueChanged<AppLanguage> onLanguageChanged;

  const MainNavigationShell({
    super.key,
    required this.currentLanguage,
    required this.onLanguageChanged,
  });

  @override
  State<MainNavigationShell> createState() => _MainNavigationShellState();
}

class _MainNavigationShellState extends State<MainNavigationShell> {
  int _currentIndex = 0;

  int _streakDays = 21;
  bool _streakBroken = false;
  int _freezeTokens = 2;
  bool _doubleXpActive = true;

  late List<HabitItem> _habits;
  late List<FriendUser> _friends;
  late List<LiveActivity> _activities;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() {
    _habits = [
      HabitItem(
        id: '1',
        title: 'Deep Cold Plunge & Breathwork',
        category: HabitCategory.body,
        target: '10 min',
        streakDays: 21,
        xpReward: 120,
        icon: Icons.ac_unit,
        isCompleted: true,
      ),
      HabitItem(
        id: '2',
        title: 'High-Output Focus Block',
        category: HabitCategory.focus,
        target: '90 min',
        streakDays: 14,
        xpReward: 180,
        icon: Icons.bolt,
        isCompleted: true,
      ),
      HabitItem(
        id: '3',
        title: 'Obsidian Journaling & Review',
        category: HabitCategory.mind,
        target: '15 min',
        streakDays: 21,
        xpReward: 110,
        icon: Icons.edit_note,
        isCompleted: true,
      ),
      HabitItem(
        id: '4',
        title: 'Zone 2 Cardiovascular Cadence',
        category: HabitCategory.body,
        target: '45 min',
        streakDays: 8,
        xpReward: 140,
        icon: Icons.directions_run,
        isCompleted: false,
      ),
      HabitItem(
        id: '5',
        title: 'Hypnagogic Sleep Architecture',
        category: HabitCategory.recovery,
        target: '8 hrs',
        streakDays: 21,
        xpReward: 150,
        icon: Icons.bedtime,
        isCompleted: false,
      ),
    ];

    _friends = [
      FriendUser(
        id: 'f1',
        name: 'Marcus Sterling',
        handle: '@msterling',
        rank: 1,
        streak: 42,
        xp: 4890,
        habitsDone: 6,
        totalHabits: 6,
        cheers: 38,
      ),
      FriendUser(
        id: 'f2',
        name: 'Elena Rostova',
        handle: '@erostova',
        rank: 2,
        streak: 28,
        xp: 3420,
        habitsDone: 5,
        totalHabits: 6,
        cheers: 29,
      ),
      FriendUser(
        id: 'f3',
        name: 'Alexander Vance (You)',
        handle: '@avance',
        rank: 3,
        streak: 21,
        xp: 1840,
        habitsDone: 3,
        totalHabits: 5,
        cheers: 24,
      ),
      FriendUser(
        id: 'f4',
        name: 'Kaito Tanaka',
        handle: '@ktanaka',
        rank: 4,
        streak: 19,
        xp: 1650,
        habitsDone: 3,
        totalHabits: 5,
        cheers: 18,
      ),
    ];

    _activities = [
      LiveActivity(
        id: 'a1',
        userName: 'Marcus Sterling',
        habitTitle: 'Deep Cold Plunge & Breathwork',
        category: 'Body',
        timeAgo: '4m ago',
        streak: 42,
        xp: 120,
        cheers: 8,
      ),
      LiveActivity(
        id: 'a2',
        userName: 'Elena Rostova',
        habitTitle: 'High-Output Focus Block',
        category: 'Focus',
        timeAgo: '16m ago',
        streak: 28,
        xp: 180,
        cheers: 14,
        userCheered: true,
      ),
      LiveActivity(
        id: 'a3',
        userName: 'Kaito Tanaka',
        habitTitle: 'Zone 2 Cardiovascular Cadence',
        category: 'Body',
        timeAgo: '38m ago',
        streak: 19,
        xp: 140,
        cheers: 6,
      ),
    ];
  }

  void _toggleHabit(HabitItem habit) {
    HapticFeedback.lightImpact();
    setState(() {
      habit.isCompleted = !habit.isCompleted;
    });
  }

  void _triggerSimulateStreakBreak() {
    setState(() {
      _streakDays = 0;
      _streakBroken = true;
    });
    _showRewardedAdModal();
  }

  void _restoreStreak() {
    setState(() {
      _streakDays = 21;
      _streakBroken = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: HabitiumColors.obsidianSurface,
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: [
            const Icon(Icons.local_fire_department, color: HabitiumColors.goldRose),
            const SizedBox(width: 8),
            Text(
              AppLocalization.tr(widget.currentLanguage, 'restore_streak_btn'),
              style: const TextStyle(color: HabitiumColors.slatePrimary, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void _showRewardedAdModal() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => RewardedAdDialog(
        currentLanguage: widget.currentLanguage,
        onStreakRestored: _restoreStreak,
      ),
    );
  }

  void _showStreakShieldModal() {
    showDialog(
      context: context,
      builder: (ctx) => StreakShieldDialog(
        currentLanguage: widget.currentLanguage,
        streakDays: _streakDays,
        freezeTokens: _freezeTokens,
        onSimulateBreak: _triggerSimulateStreakBreak,
      ),
    );
  }

  void _showAddHabitDialog() {
    showDialog(
      context: context,
      builder: (ctx) => NewHabitDialog(
        currentLanguage: widget.currentLanguage,
        onAddHabit: (title, category, target, xp) {
          setState(() {
            _habits.insert(
              0,
              HabitItem(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                title: title,
                category: category,
                target: target,
                streakDays: 1,
                xpReward: xp,
                icon: Icons.star_outline,
                isCompleted: false,
              ),
            );
          });
        },
      ),
    );
  }

  void _showLanguagePicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return Container(
          decoration: BoxDecoration(
            color: HabitiumColors.obsidianSurface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            border: const Border(top: BorderSide(color: HabitiumColors.obsidianBorder)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalization.tr(widget.currentLanguage, 'select_language'),
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: HabitiumColors.slateMuted),
                    onPressed: () => Navigator.pop(ctx),
                  ),
                ],
              ),
              const Divider(color: HabitiumColors.obsidianBorder),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: AppLocalization.supportedLanguages.length,
                  itemBuilder: (context, i) {
                    final meta = AppLocalization.supportedLanguages[i];
                    final isSelected = widget.currentLanguage == meta.language;

                    return ListTile(
                      dense: true,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      tileColor: isSelected ? HabitiumColors.electricMint.withOpacity(0.12) : null,
                      leading: Text(
                        meta.code.toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isSelected ? HabitiumColors.electricMint : HabitiumColors.slateMuted,
                        ),
                      ),
                      title: Text(
                        meta.nativeName,
                        style: TextStyle(
                          color: isSelected ? Colors.white : HabitiumColors.slatePrimary,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      subtitle: Text(meta.englishName, style: const TextStyle(fontSize: 11, color: HabitiumColors.slateMuted)),
                      trailing: isSelected ? const Icon(Icons.check, color: HabitiumColors.electricMint) : null,
                      onTap: () {
                        widget.onLanguageChanged(meta.language);
                        Navigator.pop(ctx);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final lang = widget.currentLanguage;

    final screens = [
      DashboardScreen(
        currentLanguage: lang,
        habits: _habits,
        streakDays: _streakDays,
        streakBroken: _streakBroken,
        freezeTokens: _freezeTokens,
        doubleXpActive: _doubleXpActive,
        onToggleHabit: _toggleHabit,
        onOpenShield: _showStreakShieldModal,
        onOpenAd: _showRewardedAdModal,
        onOpenLanguagePicker: _showLanguagePicker,
        onToggleDoubleXp: () {
          setState(() {
            _doubleXpActive = !_doubleXpActive;
          });
        },
        onAddHabit: _showAddHabitDialog,
      ),
      SocialRoomScreen(
        currentLanguage: lang,
        friends: _friends,
        activities: _activities,
        onCheerFriend: (f) {
          setState(() {
            f.hasCheered = !f.hasCheered;
            f.cheers += f.hasCheered ? 1 : -1;
          });
        },
        onCheerActivity: (a) {
          setState(() {
            a.userCheered = !a.userCheered;
            a.cheers += a.userCheered ? 1 : -1;
          });
        },
      ),
      StreakShieldScreen(
        currentLanguage: lang,
        streakDays: _streakDays,
        freezeTokens: _freezeTokens,
        onSimulateBreak: _triggerSimulateStreakBreak,
      ),
    ];

    return Scaffold(
      backgroundColor: HabitiumColors.obsidianBackground,
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: HabitiumColors.obsidianSurface.withOpacity(0.92),
          border: const Border(top: BorderSide(color: HabitiumColors.obsidianBorder)),
        ),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              backgroundColor: Colors.transparent,
              elevation: 0,
              selectedItemColor: HabitiumColors.electricMint,
              unselectedItemColor: HabitiumColors.slateMuted,
              selectedFontSize: 11,
              unselectedFontSize: 11,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                HapticFeedback.selectionClick();
                setState(() => _currentIndex = index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.compass_calibration_outlined),
                  activeIcon: const Icon(Icons.compass_calibration),
                  label: AppLocalization.tr(lang, 'nav_rituals'),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.people_outline),
                  activeIcon: const Icon(Icons.people),
                  label: AppLocalization.tr(lang, 'nav_social'),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.shield_outlined),
                  activeIcon: const Icon(Icons.shield),
                  label: AppLocalization.tr(lang, 'nav_shield'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// 6. DASHBOARD SCREEN
// =============================================================================
class DashboardScreen extends StatelessWidget {
  final AppLanguage currentLanguage;
  final List<HabitItem> habits;
  final int streakDays;
  final bool streakBroken;
  final int freezeTokens;
  final bool doubleXpActive;
  final Function(HabitItem) onToggleHabit;
  final VoidCallback onOpenShield;
  final VoidCallback onOpenAd;
  final VoidCallback onOpenLanguagePicker;
  final VoidCallback onToggleDoubleXp;
  final VoidCallback onAddHabit;

  const DashboardScreen({
    super.key,
    required this.currentLanguage,
    required this.habits,
    required this.streakDays,
    required this.streakBroken,
    required this.freezeTokens,
    required this.doubleXpActive,
    required this.onToggleHabit,
    required this.onOpenShield,
    required this.onOpenAd,
    required this.onOpenLanguagePicker,
    required this.onToggleDoubleXp,
    required this.onAddHabit,
  });

  @override
  Widget build(BuildContext context) {
    final lang = currentLanguage;
    final completedCount = habits.where((h) => h.isCompleted).length;
    final completionRatio = habits.isEmpty ? 0.0 : completedCount / habits.length;

    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Header
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.between,
                children: [
                  GestureDetector(
                    onTap: onOpenShield,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2.5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: HabitiumColors.goldRose, width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: HabitiumColors.goldRose.withOpacity(0.4),
                                blurRadius: 10,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: const CircleAvatar(
                            radius: 19,
                            backgroundColor: Color(0xFF1E2430),
                            child: Icon(Icons.person, color: HabitiumColors.goldRose, size: 22),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalization.tr(lang, 'user_title'),
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: HabitiumColors.slatePrimary,
                              ),
                            ),
                            Text(
                              AppLocalization.tr(lang, 'user_tier'),
                              style: TextStyle(
                                fontSize: 11,
                                color: HabitiumColors.slateMuted.withOpacity(0.9),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Right: Language Selector & Streak Badge
                  Row(
                    children: [
                      GestureDetector(
                        onTap: onOpenLanguagePicker,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.06),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white.withOpacity(0.1)),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.language, size: 14, color: HabitiumColors.electricMint),
                              const SizedBox(width: 4),
                              Text(
                                lang.name.toUpperCase(),
                                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),

                      if (streakBroken)
                        GestureDetector(
                          onTap: onOpenAd,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.18),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.red.withOpacity(0.5)),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.local_fire_department, color: Colors.redAccent, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  AppLocalization.tr(lang, 'restore_21d'),
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      else
                        GestureDetector(
                          onTap: onOpenShield,
                          child: GlassContainer(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            borderRadius: 14,
                            borderColor: HabitiumColors.goldRose.withOpacity(0.35),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.local_fire_department,
                                  color: HabitiumColors.goldRose,
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '$streakDays ${AppLocalization.tr(lang, "day_streak")}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: HabitiumColors.slatePrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // 7-Day Quick Strip
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.02),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white.withOpacity(0.05)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildDayDot('M', '5', true, false),
                    _buildDayDot('T', '6', true, false),
                    _buildDayDot('W', '7', true, false),
                    _buildDayDot('T', '8', true, false),
                    _buildDayDot('F', '9', true, false),
                    _buildDayDot('S', '10', true, false),
                    _buildDayDot('S', '11', false, true),
                  ],
                ),
              ),
            ),
          ),

          // Circular Animated Progress Ring
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: CircularProgressRing(
                  currentLanguage: lang,
                  percentage: completionRatio,
                  completed: completedCount,
                  total: habits.length,
                ),
              ),
            ),
          ),

          // Gamification Challenge Banner
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              child: GlassContainer(
                padding: const EdgeInsets.all(12),
                borderRadius: 18,
                borderColor: HabitiumColors.goldRose.withOpacity(0.2),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: onOpenShield,
                      child: Row(
                        children: [
                          Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: HabitiumColors.goldRose.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.shield,
                              color: HabitiumColors.goldRose,
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    AppLocalization.tr(lang, 'streak_shield'),
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                                    decoration: BoxDecoration(
                                      color: HabitiumColors.electricMint.withOpacity(0.12),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      '$freezeTokens ${AppLocalization.tr(lang, "armed")}',
                                      style: const TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.bold,
                                        color: HabitiumColors.electricMint,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                AppLocalization.tr(lang, 'auto_freeze'),
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: HabitiumColors.slateMuted,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(width: 1, height: 28, color: Colors.white.withOpacity(0.08)),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: onToggleDoubleXp,
                      child: Row(
                        children: [
                          Icon(
                            Icons.bolt,
                            color: doubleXpActive
                                ? HabitiumColors.electricMint
                                : HabitiumColors.slateMuted,
                            size: 18,
                          ),
                          const SizedBox(width: 4),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                doubleXpActive
                                    ? AppLocalization.tr(lang, 'active_2x')
                                    : AppLocalization.tr(lang, 'double_xp'),
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: doubleXpActive
                                      ? HabitiumColors.electricMint
                                      : HabitiumColors.slatePrimary,
                                ),
                              ),
                              Text(
                                AppLocalization.tr(lang, 'xp_per_task'),
                                style: const TextStyle(
                                  fontSize: 9,
                                  color: HabitiumColors.slateMuted,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Section Title
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.between,
                children: [
                  Text(
                    AppLocalization.tr(lang, 'todays_rituals'),
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: HabitiumColors.slatePrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: onAddHabit,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.06),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white.withOpacity(0.08)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.add, size: 14, color: HabitiumColors.electricMint),
                          const SizedBox(width: 4),
                          Text(
                            AppLocalization.tr(lang, 'new_ritual'),
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Habit Cards List
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index == 2) {
                  return NativeSponsorCardWidget(currentLanguage: lang);
                }
                final habitIndex = index > 2 ? index - 1 : index;
                if (habitIndex >= habits.length) return null;
                final habit = habits[habitIndex];
                return HabitCardWidget(
                  currentLanguage: lang,
                  habit: habit,
                  onToggle: () => onToggleHabit(habit),
                );
              },
              childCount: habits.length + 1,
            ),
          ),

          // LEGAL COPYRIGHT FOOTER NOTICE
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Center(
                child: Text(
                  AppLocalization.tr(lang, 'copyright_footer'),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: HabitiumColors.slateSubtle,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDayDot(String label, String day, bool done, bool isToday) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isToday ? HabitiumColors.electricMint.withOpacity(0.16) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: isToday
            ? Border.all(color: HabitiumColors.electricMint.withOpacity(0.4))
            : null,
      ),
      child: Column(
        children: [
          Text(label, style: const TextStyle(fontSize: 9, color: HabitiumColors.slateMuted)),
          const SizedBox(height: 2),
          Text(
            day,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: isToday ? HabitiumColors.electricMint : HabitiumColors.slatePrimary,
            ),
          ),
          const SizedBox(height: 2),
          Container(
            width: 4,
            height: 4,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: done
                  ? HabitiumColors.electricMint
                  : (isToday ? HabitiumColors.goldRose : Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// 7. SOCIAL ROOM SCREEN
// =============================================================================
class SocialRoomScreen extends StatefulWidget {
  final AppLanguage currentLanguage;
  final List<FriendUser> friends;
  final List<LiveActivity> activities;
  final Function(FriendUser) onCheerFriend;
  final Function(LiveActivity) onCheerActivity;

  const SocialRoomScreen({
    super.key,
    required this.currentLanguage,
    required this.friends,
    required this.activities,
    required this.onCheerFriend,
    required this.onCheerActivity,
  });

  @override
  State<SocialRoomScreen> createState() => _SocialRoomScreenState();
}

class _SocialRoomScreenState extends State<SocialRoomScreen> {
  int _activeSegment = 0;

  @override
  Widget build(BuildContext context) {
    final lang = widget.currentLanguage;

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        children: [
          GlassContainer(
            padding: const EdgeInsets.all(16),
            borderRadius: 20,
            borderColor: HabitiumColors.goldRose.withOpacity(0.3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.between,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: HabitiumColors.goldRose.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: HabitiumColors.goldRose.withOpacity(0.3)),
                      ),
                      child: Text(
                        AppLocalization.tr(lang, 'room_badge'),
                        style: const TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          color: HabitiumColors.goldRose,
                        ),
                      ),
                    ),
                    Text(
                      AppLocalization.tr(lang, 'room_multiplier'),
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: HabitiumColors.electricMint,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  AppLocalization.tr(lang, 'room_title'),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  AppLocalization.tr(lang, 'room_desc'),
                  style: const TextStyle(
                    fontSize: 11,
                    color: HabitiumColors.slateMuted,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.between,
                  children: [
                    Text(
                      AppLocalization.tr(lang, 'pool_text'),
                      style: const TextStyle(fontSize: 11, color: HabitiumColors.slatePrimary),
                    ),
                    Text(
                      AppLocalization.tr(lang, 'members_active'),
                      style: const TextStyle(fontSize: 11, color: HabitiumColors.slateMuted),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),

          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.04),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _activeSegment = 0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: _activeSegment == 0
                            ? HabitiumColors.obsidianCard
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          AppLocalization.tr(lang, 'tab_leaderboard'),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: _activeSegment == 0
                                ? Colors.white
                                : HabitiumColors.slateMuted,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _activeSegment = 1),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: _activeSegment == 1
                            ? HabitiumColors.obsidianCard
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          AppLocalization.tr(lang, 'tab_activity'),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: _activeSegment == 1
                                ? Colors.white
                                : HabitiumColors.slateMuted,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),

          if (_activeSegment == 0) ...[
            for (final friend in widget.friends) _buildFriendRow(friend, lang),
          ] else ...[
            for (final act in widget.activities) _buildActivityRow(act, lang),
          ],
        ],
      ),
    );
  }

  Widget _buildFriendRow(FriendUser f, AppLanguage lang) {
    Color rankColor = HabitiumColors.slateMuted;
    if (f.rank == 1) rankColor = HabitiumColors.goldRose;
    if (f.rank == 2) rankColor = const Color(0xFFC0C0C0);
    if (f.rank == 3) rankColor = const Color(0xFFCD7F32);

    return GlassContainer(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      borderRadius: 16,
      borderColor: f.rank == 1
          ? HabitiumColors.goldRose.withOpacity(0.3)
          : HabitiumColors.obsidianBorder,
      child: Row(
        children: [
          Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              color: rankColor.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '#${f.rank}',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: rankColor),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  f.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${f.xp} XP · ${f.habitsDone}/${f.totalHabits} ${AppLocalization.tr(lang, "done_today")}',
                  style: const TextStyle(fontSize: 11, color: HabitiumColors.slateMuted),
                ),
              ],
            ),
          ),
          Row(
            children: [
              const Icon(Icons.local_fire_department, color: HabitiumColors.goldRose, size: 14),
              Text(
                '${f.streak}d',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () => widget.onCheerFriend(f),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: f.hasCheered ? Colors.pink.withOpacity(0.18) : Colors.white.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.favorite,
                    size: 14,
                    color: f.hasCheered ? Colors.pinkAccent : HabitiumColors.slateMuted,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActivityRow(LiveActivity a, AppLanguage lang) {
    return GlassContainer(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      borderRadius: 16,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 16,
            backgroundColor: Color(0xFF1F2430),
            child: Icon(Icons.person_outline, size: 18, color: Colors.white),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.between,
                  children: [
                    Text(
                      a.userName,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(a.timeAgo, style: const TextStyle(fontSize: 10, color: HabitiumColors.slateMuted)),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  a.habitTitle,
                  style: const TextStyle(fontSize: 13, color: HabitiumColors.electricMint, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  '${a.category} · 🔥 ${a.streak}d · +${a.xp} XP',
                  style: const TextStyle(fontSize: 10, color: HabitiumColors.slateMuted),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => widget.onCheerActivity(a),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: a.userCheered ? Colors.pink.withOpacity(0.16) : Colors.white.withOpacity(0.04),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.favorite, size: 12, color: a.userCheered ? Colors.pinkAccent : HabitiumColors.slateMuted),
                  const SizedBox(width: 4),
                  Text('${a.cheers}', style: const TextStyle(fontSize: 10, color: Colors.white)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// 8. STREAK SHIELD SCREEN
// =============================================================================
class StreakShieldScreen extends StatelessWidget {
  final AppLanguage currentLanguage;
  final int streakDays;
  final int freezeTokens;
  final VoidCallback onSimulateBreak;

  const StreakShieldScreen({
    super.key,
    required this.currentLanguage,
    required this.streakDays,
    required this.freezeTokens,
    required this.onSimulateBreak,
  });

  @override
  Widget build(BuildContext context) {
    final lang = currentLanguage;

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: [
          Center(
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: HabitiumColors.goldRose.withOpacity(0.15),
                shape: BoxShape.circle,
                border: Border.all(color: HabitiumColors.goldRose.withOpacity(0.4)),
              ),
              child: const Icon(Icons.shield, color: HabitiumColors.goldRose, size: 30),
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: Text(
              '$streakDays ${AppLocalization.tr(lang, "sovereign_streak")}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          Center(
            child: Text(
              AppLocalization.tr(lang, 'personal_best'),
              style: const TextStyle(fontSize: 12, color: HabitiumColors.slateMuted),
            ),
          ),
          const SizedBox(height: 20),

          GlassContainer(
            padding: const EdgeInsets.all(14),
            borderRadius: 18,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.between,
                  children: [
                    Text(AppLocalization.tr(lang, 'matrix_title'), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    Text(AppLocalization.tr(lang, 'full_adherence'), style: const TextStyle(fontSize: 11, color: HabitiumColors.electricMint)),
                  ],
                ),
                const SizedBox(height: 12),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                  ),
                  itemCount: 21,
                  itemBuilder: (ctx, i) {
                    return Container(
                      decoration: BoxDecoration(
                        color: HabitiumColors.electricMint.withOpacity(0.15),
                        border: Border.all(color: HabitiumColors.electricMint.withOpacity(0.4)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Center(
                        child: Icon(Icons.check, size: 14, color: HabitiumColors.electricMint),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),

          GlassContainer(
            padding: const EdgeInsets.all(14),
            borderRadius: 18,
            borderColor: HabitiumColors.goldRose.withOpacity(0.2),
            child: Row(
              children: [
                const Icon(Icons.ac_unit, color: Colors.cyanAccent, size: 22),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalization.tr(lang, 'token_bank'),
                        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(
                        '$freezeTokens ${AppLocalization.tr(lang, "tokens_available")}',
                        style: const TextStyle(fontSize: 11, color: HabitiumColors.slateMuted),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.withOpacity(0.18),
              foregroundColor: Colors.redAccent,
              side: BorderSide(color: Colors.red.withOpacity(0.4)),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            ),
            onPressed: onSimulateBreak,
            icon: const Icon(Icons.warning_amber_rounded),
            label: Text(
              AppLocalization.tr(lang, 'simulate_loss'),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 30),
          Center(
            child: Text(
              AppLocalization.tr(lang, 'copyright_footer'),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
                color: HabitiumColors.slateSubtle,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// 9. CORE WIDGET: GLASS CONTAINER
// =============================================================================
class GlassContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double borderRadius;
  final Color? borderColor;

  const GlassContainer({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius = 16.0,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
        child: Container(
          padding: padding ?? const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: HabitiumColors.obsidianCard.withOpacity(0.72),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: borderColor ?? HabitiumColors.obsidianBorder,
              width: 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );

    if (margin != null) {
      return Padding(padding: margin!, child: content);
    }
    return content;
  }
}

// =============================================================================
// 10. ANIMATED CIRCULAR PROGRESS RING
// =============================================================================
class CircularProgressRing extends StatelessWidget {
  final AppLanguage currentLanguage;
  final double percentage;
  final int completed;
  final int total;
  final double size;

  const CircularProgressRing({
    super.key,
    required this.currentLanguage,
    required this.percentage,
    required this.completed,
    required this.total,
    this.size = 186.0,
  });

  @override
  Widget build(BuildContext context) {
    final lang = currentLanguage;
    final percentInt = (percentage * 100).toInt();

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size),
            painter: _RingPainter(progress: percentage),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppLocalization.tr(lang, 'today_output'),
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                  color: HabitiumColors.slateMuted,
                ),
              ),
              const SizedBox(height: 2),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$percentInt',
                    style: const TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: HabitiumColors.slatePrimary,
                      letterSpacing: -1,
                    ),
                  ),
                  const Text(
                    '%',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: HabitiumColors.electricMint,
                    ),
                  ),
                ],
              ),
              Text(
                '$completed/$total ${AppLocalization.tr(lang, "rituals_done")}',
                style: const TextStyle(
                  fontSize: 11,
                  color: HabitiumColors.slateMuted,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  final double progress;
  _RingPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - 24) / 2;
    const strokeWidth = 11.0;

    final trackPaint = Paint()
      ..color = Colors.white.withOpacity(0.06)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius, trackPaint);

    if (progress <= 0) return;

    final rect = Rect.fromCircle(center: center, radius: radius);
    const sweepGradient = SweepGradient(
      startAngle: -math.pi / 2,
      endAngle: 3 * math.pi / 2,
      colors: [
        HabitiumColors.emeraldGlow,
        HabitiumColors.electricMint,
        Color(0xFF80FFD0),
      ],
      transform: GradientRotation(-math.pi / 2),
    );

    final progressPaint = Paint()
      ..shader = sweepGradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final sweepAngle = 2 * math.pi * progress;
    canvas.drawArc(rect, -math.pi / 2, sweepAngle, false, progressPaint);

    final glowPaint = Paint()
      ..color = HabitiumColors.electricMint.withOpacity(0.35)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth + 4
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
    canvas.drawArc(rect, -math.pi / 2, sweepAngle, false, glowPaint);
  }

  @override
  bool shouldRepaint(covariant _RingPainter oldDelegate) => oldDelegate.progress != progress;
}

// =============================================================================
// 11. HABIT CARD WIDGET
// =============================================================================
class HabitCardWidget extends StatelessWidget {
  final AppLanguage currentLanguage;
  final HabitItem habit;
  final VoidCallback onToggle;

  const HabitCardWidget({
    super.key,
    required this.currentLanguage,
    required this.habit,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      borderRadius: 18,
      borderColor: habit.isCompleted
          ? HabitiumColors.electricMint.withOpacity(0.35)
          : HabitiumColors.obsidianBorder,
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: habit.isCompleted
                  ? HabitiumColors.electricMint.withOpacity(0.12)
                  : Colors.white.withOpacity(0.04),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: habit.isCompleted
                    ? HabitiumColors.electricMint.withOpacity(0.3)
                    : Colors.white.withOpacity(0.08),
              ),
            ),
            child: Icon(
              habit.icon,
              size: 20,
              color: habit.isCompleted
                  ? HabitiumColors.electricMint
                  : HabitiumColors.slatePrimary,
            ),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  habit.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: habit.isCompleted
                        ? HabitiumColors.slateMuted
                        : HabitiumColors.slatePrimary,
                    decoration: habit.isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Text(
                      habit.getCategoryLabel(currentLanguage),
                      style: const TextStyle(fontSize: 11, color: HabitiumColors.slateMuted),
                    ),
                    const SizedBox(width: 4),
                    const Text('·', style: TextStyle(color: HabitiumColors.slateSubtle)),
                    const SizedBox(width: 4),
                    Text(
                      habit.target,
                      style: const TextStyle(fontSize: 11, color: HabitiumColors.slateMuted),
                    ),
                    const SizedBox(width: 6),
                    Row(
                      children: [
                        const Icon(Icons.local_fire_department, size: 11, color: Colors.amber),
                        Text(
                          '${habit.streakDays}d',
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: onToggle,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: habit.isCompleted ? HabitiumColors.electricMint : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: habit.isCompleted
                      ? HabitiumColors.electricMint
                      : Colors.white.withOpacity(0.24),
                  width: 2,
                ),
                boxShadow: habit.isCompleted
                    ? [
                        BoxShadow(
                          color: HabitiumColors.electricMint.withOpacity(0.4),
                          blurRadius: 10,
                        ),
                      ]
                    : null,
              ),
              child: habit.isCompleted
                  ? const Icon(Icons.check, size: 18, color: HabitiumColors.obsidianBackground)
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// 12. NATIVE SPONSORED AD CARD
// =============================================================================
class NativeSponsorCardWidget extends StatelessWidget {
  final AppLanguage currentLanguage;
  const NativeSponsorCardWidget({super.key, required this.currentLanguage});

  @override
  Widget build(BuildContext context) {
    final lang = currentLanguage;

    return GlassContainer(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      borderRadius: 18,
      borderColor: HabitiumColors.goldRose.withOpacity(0.3),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.04),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: HabitiumColors.goldRose.withOpacity(0.3)),
            ),
            child: const Icon(Icons.watch, color: HabitiumColors.goldRose, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                      decoration: BoxDecoration(
                        color: HabitiumColors.goldRose.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: HabitiumColors.goldRose.withOpacity(0.3)),
                      ),
                      child: Text(
                        AppLocalization.tr(lang, 'sponsored'),
                        style: const TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          color: HabitiumColors.goldRose,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      AppLocalization.tr(lang, 'partner_title'),
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  AppLocalization.tr(lang, 'partner_desc'),
                  style: const TextStyle(fontSize: 10, color: HabitiumColors.slateMuted),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 12, color: HabitiumColors.goldRose),
        ],
      ),
    );
  }
}

// =============================================================================
// 13. REWARDED AD SIMULATOR DIALOG (15-SECOND STREAK RESTORE)
// =============================================================================
class RewardedAdDialog extends StatefulWidget {
  final AppLanguage currentLanguage;
  final VoidCallback onStreakRestored;

  const RewardedAdDialog({
    super.key,
    required this.currentLanguage,
    required this.onStreakRestored,
  });

  @override
  State<RewardedAdDialog> createState() => _RewardedAdDialogState();
}

class _RewardedAdDialogState extends State<RewardedAdDialog> {
  bool _isPlaying = false;
  int _secondsLeft = 15;
  bool _rewardReady = false;
  Timer? _timer;

  void _startVideo() {
    setState(() {
      _isPlaying = true;
      _secondsLeft = 15;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_secondsLeft <= 1) {
        t.cancel();
        setState(() {
          _isPlaying = false;
          _rewardReady = true;
          _secondsLeft = 0;
        });
      } else {
        setState(() {
          _secondsLeft--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = widget.currentLanguage;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(20),
      child: GlassContainer(
        padding: const EdgeInsets.all(22),
        borderRadius: 24,
        borderColor: Colors.white.withOpacity(0.12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(Icons.close, size: 18, color: HabitiumColors.slateMuted),
              ),
            ),
            if (!_isPlaying && !_rewardReady) ...[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.15),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.amber.withOpacity(0.4)),
                ),
                child: const Icon(Icons.local_fire_department, color: Colors.amber, size: 34),
              ),
              const SizedBox(height: 14),
              Text(
                AppLocalization.tr(lang, 'ad_title'),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 6),
              Text(
                AppLocalization.tr(lang, 'ad_desc'),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12, color: HabitiumColors.slateMuted, height: 1.4),
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HabitiumColors.electricMint,
                    foregroundColor: HabitiumColors.obsidianBackground,
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: _startVideo,
                  icon: const Icon(Icons.play_arrow),
                  label: Text(
                    AppLocalization.tr(lang, 'watch_video_btn'),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ] else if (_isPlaying) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalization.tr(lang, 'sponsor_label'), style: const TextStyle(fontSize: 11, color: HabitiumColors.slateMuted)),
                  Text(
                    '$_secondsLeft s',
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: HabitiumColors.goldRose),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.watch, color: HabitiumColors.goldRose, size: 40),
                      const SizedBox(height: 8),
                      Text(
                        AppLocalization.tr(lang, 'calatrava'),
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        AppLocalization.tr(lang, 'calatrava_tagline'),
                        style: const TextStyle(color: HabitiumColors.slateMuted, fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              LinearProgressIndicator(
                value: (15 - _secondsLeft) / 15.0,
                backgroundColor: Colors.white.withOpacity(0.1),
                color: HabitiumColors.electricMint,
              ),
            ] else if (_rewardReady) ...[
              const Icon(Icons.check_circle_outline, color: HabitiumColors.electricMint, size: 50),
              const SizedBox(height: 10),
              Text(
                AppLocalization.tr(lang, 'video_complete'),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 4),
              Text(
                AppLocalization.tr(lang, 'video_complete_desc'),
                style: const TextStyle(fontSize: 11, color: HabitiumColors.slateMuted),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HabitiumColors.goldRose,
                    foregroundColor: HabitiumColors.obsidianBackground,
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    widget.onStreakRestored();
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.local_fire_department),
                  label: Text(
                    AppLocalization.tr(lang, 'restore_streak_btn'),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// 14. STREAK SHIELD DIALOG
// =============================================================================
class StreakShieldDialog extends StatelessWidget {
  final AppLanguage currentLanguage;
  final int streakDays;
  final int freezeTokens;
  final VoidCallback onSimulateBreak;

  const StreakShieldDialog({
    super.key,
    required this.currentLanguage,
    required this.streakDays,
    required this.freezeTokens,
    required this.onSimulateBreak,
  });

  @override
  Widget build(BuildContext context) {
    final lang = currentLanguage;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: GlassContainer(
        padding: const EdgeInsets.all(20),
        borderRadius: 22,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.between,
              children: [
                Text(AppLocalization.tr(lang, 'streak_shield'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.close, size: 18),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              '$streakDays ${AppLocalization.tr(lang, "sovereign_streak")}',
              style: const TextStyle(fontSize: 14, color: HabitiumColors.goldRose, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              '$freezeTokens ${AppLocalization.tr(lang, "tokens_available")}',
              style: const TextStyle(fontSize: 12, color: HabitiumColors.slateMuted),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.withOpacity(0.2),
                foregroundColor: Colors.redAccent,
                side: BorderSide(color: Colors.red.withOpacity(0.4)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                onSimulateBreak();
              },
              child: Text(AppLocalization.tr(lang, 'simulate_loss')),
            ),
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// 15. NEW HABIT CREATOR DIALOG
// =============================================================================
class NewHabitDialog extends StatefulWidget {
  final AppLanguage currentLanguage;
  final Function(String, HabitCategory, String, int) onAddHabit;

  const NewHabitDialog({
    super.key,
    required this.currentLanguage,
    required this.onAddHabit,
  });

  @override
  State<NewHabitDialog> createState() => _NewHabitDialogState();
}

class _NewHabitDialogState extends State<NewHabitDialog> {
  final _titleController = TextEditingController();
  HabitCategory _category = HabitCategory.body;
  final String _target = '30 min';
  final int _xp = 120;

  @override
  Widget build(BuildContext context) {
    final lang = widget.currentLanguage;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: GlassContainer(
        padding: const EdgeInsets.all(20),
        borderRadius: 22,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.between,
              children: [
                Text(AppLocalization.tr(lang, 'create_ritual'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.close, size: 18),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _titleController,
              style: const TextStyle(color: Colors.white, fontSize: 13),
              decoration: InputDecoration(
                hintText: AppLocalization.tr(lang, 'cadence_hint'),
                hintStyle: const TextStyle(color: HabitiumColors.slateMuted, fontSize: 13),
                filled: true,
                fillColor: Colors.white.withOpacity(0.04),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<HabitCategory>(
                    value: _category,
                    dropdownColor: HabitiumColors.obsidianCard,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.04),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    items: const [
                      DropdownMenuItem(value: HabitCategory.body, child: Text('Body / الجسد / 体魄')),
                      DropdownMenuItem(value: HabitCategory.mind, child: Text('Mind / العقل / 心智')),
                      DropdownMenuItem(value: HabitCategory.focus, child: Text('Focus / التركيز / 专注')),
                      DropdownMenuItem(value: HabitCategory.recovery, child: Text('Recovery / التعافي / 恢复')),
                      DropdownMenuItem(value: HabitCategory.craft, child: Text('Craft / الإتقان / 技艺')),
                    ],
                    onChanged: (v) => setState(() => _category = v ?? HabitCategory.body),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: HabitiumColors.electricMint,
                  foregroundColor: HabitiumColors.obsidianBackground,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  if (_titleController.text.trim().isNotEmpty) {
                    widget.onAddHabit(_titleController.text.trim(), _category, _target, _xp);
                    Navigator.of(context).pop();
                  }
                },
                child: Text(AppLocalization.tr(lang, 'enshrine_btn'), style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
