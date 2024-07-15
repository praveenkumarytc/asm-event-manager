import 'dart:io';
import 'package:flutter/material.dart';

TextInputType numberKeyBoard = Platform.isAndroid ? TextInputType.number : const TextInputType.numberWithOptions(signed: true, decimal: true);
