import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ShowDate extends Equatable {
  final int id;
  final DateTime date;
  final List<TimeOfDay> time;

  ShowDate(this.id, this.date, this.time);

  @override
  List<Object> get props => [id, date, time];
}