/// Consolidate imports that are common across the app.
//-------------------------------

///flutter
export 'package:bloc/bloc.dart';

///packages
export 'package:easy_localization/easy_localization.dart';
export 'package:equatable/equatable.dart';
export 'package:flutter/material.dart' hide TextDirection;
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart'
    show SizeExtension, ScreenUtilInit;
export "package:wasla/app/services/localization/language_manager.dart";
export "package:wasla/app/shared/printer_manager.dart";

///cubit
export 'package:wasla/presentation/modules/onboarding/cubit/onboarding_cubit.dart';

///project files
export "package:wasla/presentation/resources/managers/assets_manager.dart";
export "package:wasla/presentation/resources/managers/color_manager.dart";
export "package:wasla/presentation/resources/managers/font_manager.dart";
export "package:wasla/presentation/resources/managers/icons_manager.dart";
export "package:wasla/presentation/resources/managers/responsive_manager.dart";
export "package:wasla/presentation/resources/managers/routes_manager.dart";
export "package:wasla/presentation/resources/managers/strings_manager.dart";
export "package:wasla/presentation/resources/managers/styles_manager.dart";
export "package:wasla/presentation/resources/managers/theme_manager.dart";
export "package:wasla/presentation/resources/managers/values_manager.dart";
