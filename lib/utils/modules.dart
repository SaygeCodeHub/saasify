import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saasify/data/enums/modules_enum.dart';
import 'package:saasify/data/models/generalModels/value_card_model.dart';

List<ValueCardModel> hrmsFeatures = [
  ValueCardModel(
      cardHeading: Modules.pendingApprovals.name,
      value: '10',
      iconData: FontAwesomeIcons.solidThumbsUp,
      onTap: (BuildContext context) {
        Navigator.pushNamed(context, '');
      },
      moduleId: 0.1)
];
