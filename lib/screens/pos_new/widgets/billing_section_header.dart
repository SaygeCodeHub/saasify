import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/customer/customer_bloc.dart';
import 'package:saasify/bloc/customer/customer_event.dart';
import 'package:saasify/bloc/customer/customer_state.dart';
import 'package:saasify/bloc/pos/billing_bloc.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/constants/string_constants.dart';

import '../../../configs/app_spacing.dart';

class BillingSectionHeader extends StatelessWidget {
  const BillingSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContactTile(isContact: true),
          SizedBox(height: spacingSmall),
          Divider(color: AppColor.saasifyPaleGrey, thickness: 1)
        ]);
  }
}

class ContactTile extends StatelessWidget {
  final bool isContact;
  static bool addedContact = false;
  const ContactTile({super.key, required this.isContact});

  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerBloc, CustomerStates>(builder: (context, state) {
      if (state is CustomerFetched) {
        context.read<BillingBloc>().customer.customerName = state.name;
        return Column(children: [
          Row(children: [
            Text(
              StringConstants.kMembershipNO,
              style: Theme.of(context).textTheme.xTiniest.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColor.saasifyDarkestBlack),
            ),
            const SizedBox(width: spacingSmall),
            Text(
              context.read<BillingBloc>().customer.customerContact,
              style: Theme.of(context)
                  .textTheme
                  .xTiniest
                  .copyWith(color: AppColor.saasifyGreyBlue),
            ),
            const SizedBox(width: spacingXSmall),
            InkWell(
                onTap: () {
                  context
                      .read<CustomerBloc>()
                      .add(GetCustomer(customerContact: ''));
                  context.read<BillingBloc>().customer.customerName = '';
                },
                child: const Icon(Icons.mode_edit_outline_outlined,
                    size: spacingStandard, color: AppColor.saasifyGreyBlue))
          ]),
          const SizedBox(height: spacingXXSmall),
          Row(children: [
            Text(
              StringConstants.kCustomerName,
              style: Theme.of(context).textTheme.xTiniest.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColor.saasifyDarkestBlack),
            ),
            const SizedBox(width: spacingSmall),
            Text(
              context.read<BillingBloc>().customer.customerName,
              style: Theme.of(context)
                  .textTheme
                  .xTiniest
                  .copyWith(color: AppColor.saasifyGreyBlue),
            )
          ])
        ]);
      }
      return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            child: Form(
                key: formKey,
                child: TextFormField(
                  inputFormatters: (isContact)
                      ? <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ]
                      : null,
                  maxLength: 10,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Contact no.';
                    }
                    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                      return "Please Enter a valid Phone No.";
                    }
                    return null;
                  },
                  initialValue:
                      context.read<BillingBloc>().customer.customerContact,
                  onChanged: (value) {
                    context.read<BillingBloc>().customer.customerContact =
                        value;
                  },
                  decoration: const InputDecoration(
                      counterText: '', hintText: 'Enter Contact no.'),
                ))),
        IconButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<CustomerBloc>().add(GetCustomer(
                    customerContact:
                        context.read<BillingBloc>().customer.customerContact));
              }
            },
            icon: const Icon(Icons.search))
      ]);
    });
  }
}
