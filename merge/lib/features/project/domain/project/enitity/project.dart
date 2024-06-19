// domain/project/entities/project.dart

import 'package:equatable/equatable.dart';

enum Specialization { frontEnd, backEnd, mobile }

enum TechStack {
  react,
  angular,
  vue,
  node,
  express,
  django,
  reactNative,
  flutter,
  swift
}

class Project extends Equatable {
  final String id;
  final String projectName;
  final String projectDescription;
  final Specialization specialization;
  final List<TechStack> techStacks;
  final DateTime applicationDeadline;
  final int intakeNumber;
  final int projectDurationInDays;
  final String createdBy;

  Project({
    required this.id,
    required this.projectName,
    required this.projectDescription,
    required this.specialization,
    required this.techStacks,
    required this.applicationDeadline,
    required this.intakeNumber,
    required this.projectDurationInDays,
    required this.createdBy,
  });

  @override
  List<Object?> get props => [
        id,
        projectName,
        projectDescription,
        specialization,
        techStacks,
        applicationDeadline,
        intakeNumber,
        projectDurationInDays,
        createdBy,
      ];
}
