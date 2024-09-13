import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';
import 'package:netflixclone/declaration/textstyle.dart';

class PaymentHistoryScreen extends StatefulWidget {
  const PaymentHistoryScreen({super.key});

  @override
  State<PaymentHistoryScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
  String _selectedFilter = 'All';

  // Sample payment history for demonstration
  List<Map<String, dynamic>> paymentHistory = [
    {
      'date': '12 Sep 2014',
      'type': 'Basic',
      'amount': '\$7.99',
      'method': 'Credit Card (**** 1234)',
      'status': 'Success',
    },
    {
      'date': '12 Aug 2017',
      'type': 'Premium',
      'amount': '\$13.99',
      'method': 'Credit Card (**** 1234)',
      'status': 'Success',
    },
    {
      'date': '12 Jul 2020',
      'type': 'Standard',
      'amount': '\$10.99',
      'method': 'Credit Card (**** 1234)',
      'status': 'Success',
    },
    {
      'date': '12 Jun 2022',
      'type': 'Premium',
      'amount': '\$13.99',
      'method': 'Credit Card (**** 1234)',
      'status': 'Failed',
    },
    {
      'date': '12 Jun 2022',
      'type': 'Premium',
      'amount': '\$13.99',
      'method': 'Credit Card (**** 1234)',
      'status': 'Success',
    },
    {
      'date': '26 Jun 2024',
      'type': 'Premium',
      'amount': '\$13.99',
      'method': 'Credit Card (**** 1234)',
      'status': 'Success',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Filter payment history based on selected filter
    List<Map<String, dynamic>> filteredPayments = paymentHistory.where((payment) {
      if (_selectedFilter == 'All') {
        return true;
      } else {
        return payment['status'] == _selectedFilter;
      }
    }).toList();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: AppColors.white,
          ),
        ),
        title: const Text('Payment History'),
        centerTitle: true,
        actions: [
          // Popup menu All, Success, Failed
          PopupMenuButton<String>(
            color: AppColors.blackCard,
            onSelected: (String value) {
              setState(() {
                _selectedFilter = value;
              });
            },
            itemBuilder: (BuildContext context) {
              return ['All', 'Success', 'Failed'].map((String filter) {
                return PopupMenuItem<String>(
                  value: filter,
                  child: Text(filter),
                );
              }).toList();
            },
            icon: const Icon(Icons.filter_list, color: AppColors.white),
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'View Your Payment History',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredPayments.length,
                itemBuilder: (context, index) {
                  return _buildPaymentHistoryTile(filteredPayments[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  // Card Method/Fun
  Widget _buildPaymentHistoryTile(Map<String, dynamic> payment) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.grayCard,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${payment['type']}",
                style: AppTextStyles.hedgingTextStyle.copyWith(color: AppColors.redColor.withOpacity(0.9), letterSpacing: 1.5),
              ),
              Text(
                "${payment['amount']}",
                style: AppTextStyles.textStyle,
              ),
            ],
          ),
          const Divider(),
          const SizedBox(height: 8),
          // Date and Message
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                payment['date'],
                style: AppTextStyles.textStyle,
              ),
              Row(
                children: [
                  payment['status'] == 'Success'
                      ? Image.asset('assets/displayMessageIcon/success_icon.png', color: AppColors.green, width: 24, height: 28)
                      : Image.asset('assets/displayMessageIcon/warning_icon.png', color: AppColors.errorColor, width: 24, height: 28),
                  const SizedBox(width: 8),
                  Text(
                    payment['status'],
                    style: AppTextStyles.textStyle.copyWith(color: payment['status'] == 'Success' ? AppColors.green : AppColors.errorColor),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            payment['method'],
            style: AppTextStyles.subTextStyle,
          ),
        ],
      ),
    );
  }
}
