import 'package:flutter/material.dart';

class TaskModel {
  String title;
  String detail;

  TextEditingController titleController = TextEditingController();
  TextEditingController detailController = TextEditingController();

  String get getTitle => title;
  String get getDetail => detail;

  set setTitle(String title) {
    this.title = title;
  }

  set setDetail(String detail) {
    this.detail = detail;
  }

  TaskModel({required this.title, required this.detail});
}
