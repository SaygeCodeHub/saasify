import 'package:flutter/material.dart';
import 'package:saasify/configs/app_color.dart';
import '../data/models/dashboard/dashboard_card.dart';
import '../screens/coupon/coupon_screen.dart';
import '../screens/employee/employee_list.dart';
import '../screens/payment/payment_type_screen.dart';
import '../screens/branchgrid/branches_grid_screen.dart';
import '../screens/profile/profile_screen.dart';

List<DashboardCardData> dashboardCard = [
  DashboardCardData(
      iconName: Icons.shopping_bag_outlined,
      title: 'Total Order',
      subtitle: '',
      iconColor: AppColor.saasifyPastelOrange,
      containerColor: AppColor.saasifyOrange),
  DashboardCardData(
      iconName: Icons.shopping_bag_outlined,
      title: 'Unpaid Orders',
      subtitle: '',
      iconColor: AppColor.saasifyPastelBlue,
      containerColor: AppColor.saasifyBlue),
  DashboardCardData(
      iconName: Icons.shopping_bag_outlined,
      title: 'Paid Orders',
      subtitle: '',
      iconColor: AppColor.saasifyPastelGreen,
      containerColor: AppColor.saasifyGreen),
  DashboardCardData(
      iconName: Icons.monetization_on,
      title: 'Total Earning',
      subtitle: '',
      iconColor: AppColor.saasifyPastelPurple,
      containerColor: AppColor.saasifypurple)
];

List<DashboardListOptions> dashboardOptionList = [
  DashboardListOptions(
      iconName: Icons.person_outlined,
      routeName: ProfileScreen.routeName,
      title: 'Profile',
      subtitle: 'Manage Profile',
      iconColor: AppColor.saasifyPastelOrange,
      containerColor: AppColor.saasifyOrange),
  DashboardListOptions(
      iconName: Icons.store,
      routeName: StoreGridScreen.routeName,
      title: 'Branches',
      subtitle: 'Manage Branches',
      iconColor: AppColor.saasifyPastelBlue,
      containerColor: AppColor.saasifyBlue),
  DashboardListOptions(
      iconName: Icons.payment_outlined,
      routeName: PaymentTypeScreen.routeName,
      title: 'Payment Methods',
      subtitle: 'Manage Payment Methods',
      iconColor: AppColor.saasifyPastelGreen,
      containerColor: AppColor.saasifyGreen),
  DashboardListOptions(
      iconName: Icons.people,
      routeName: EmployeeListScreen.routeName,
      title: 'Employees',
      subtitle: 'Manage Employees',
      iconColor: AppColor.saasifyPastelPurple,
      containerColor: AppColor.saasifypurple),
  DashboardListOptions(
      iconName: Icons.discount,
      routeName: CouponScreen.routeName,
      title: 'Coupons',
      subtitle: 'Manage Coupons',
      iconColor: AppColor.saasifyPastelOrange,
      containerColor: AppColor.saasifyOrange)
];
