import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

int generateRandomCode() {
  return math.Random().nextInt(9000) + 1000;
}

int generateRandomOffset() {
  return math.Random().nextInt(10000);
}

int calculateNewScore(
  int currentScore,
  int currentValue,
  bool correct,
) {
  return currentScore + (correct ? 1 : -1) * currentValue;
}
