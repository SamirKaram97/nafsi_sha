import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gp_nafsi/core/functions/init_music_service.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../firebase_options.dart';
import '../network/local/shared_helper.dart';
import '../network/remote/old_api_service.dart';
import '../../core/service/bloc_observer.dart';
