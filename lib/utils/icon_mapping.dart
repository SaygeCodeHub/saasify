import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

IconData iconMapping(String key) {
  switch (key) {
    case 'ORDERS':
      return FontAwesomeIcons.list;
    case 'HR_PENDING_APPROVAL':
      return FontAwesomeIcons.thumbsUp;
    case 'HR_VIEW_ALL_EMPLOYEES':
      return FontAwesomeIcons.peopleGroup;
    case 'HR_SALARY_ROLLOUT':
      return FontAwesomeIcons.moneyBillTransfer;
    case 'HR_ADD_NEW_EMPLOYEE':
      return FontAwesomeIcons.personCirclePlus;
    case 'HR_APPLY_LEAVES':
      return FontAwesomeIcons.car;
    case 'HR_MY_LEAVES':
      return FontAwesomeIcons.hospital;
    case 'HR_TIMESHEET':
      return FontAwesomeIcons.businessTime;
    default:
      return FontAwesomeIcons.faceMehBlank;
  }
}
