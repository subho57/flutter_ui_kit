import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/meelaApp/models/MBModel.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBConts.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBImages.dart';

List<BudgetDetails> getBudgetDetailList() {
  List<BudgetDetails> budgetList = [];
  budgetList.add(BudgetDetails(percentage: 0.9, progressPercentage: '90%', budgetType: 'Budget', totalCost: '\$15,000'));
  budgetList.add(BudgetDetails(percentage: 0.7, progressPercentage: '70%', budgetType: 'Expenses', totalCost: '\$24,000'));
  return budgetList;
}

List<BudgetDetails> getBankList() {
  List<BudgetDetails> bankList = [];
  bankList.add(BudgetDetails(icon: Icons.location_on_outlined, totalCost: 'Bank of Sorbet ', budgetType: '72, Eastern Street, Uk'));
  bankList.add(BudgetDetails(icon: Icons.location_on_outlined, totalCost: 'City National Bank', budgetType: '72, Eastern Street, Uk'));
  bankList.add(BudgetDetails(icon: Icons.location_on_outlined, totalCost: 'Western Bank and ATM', budgetType: '72, Eastern Street, Uk'));
  bankList.add(BudgetDetails(icon: Icons.location_on_outlined, totalCost: 'City HallATM Hub', budgetType: '72, Eastern Street, Uk'));
  bankList.add(BudgetDetails(icon: Icons.location_on_outlined, totalCost: 'Bank of Sorbet ', budgetType: '72, Eastern Street, Uk'));
  bankList.add(BudgetDetails(icon: Icons.location_on_outlined, totalCost: 'City National Bank', budgetType: '72, Eastern Street, Uk'));
  bankList.add(BudgetDetails(icon: Icons.location_on_outlined, totalCost: 'Western Bank and ATM', budgetType: '72, Eastern Street, Uk'));
  bankList.add(BudgetDetails(icon: Icons.location_on_outlined, totalCost: 'City HallATM Hub', budgetType: '72, Eastern Street, Uk'));
  return bankList;
}

List<BudgetDetails> getOperationsList() {
  List<BudgetDetails> operationsList = [];
  operationsList.add(BudgetDetails(budgetType: 'Transfer', icon: AntDesign.swap));
  operationsList.add(BudgetDetails(budgetType: 'Withdraw', icon: Foundation.ticket));
  operationsList.add(BudgetDetails(budgetType: 'Deposit', icon: Entypo.documents));
  operationsList.add(BudgetDetails(budgetType: 'My Cards', icon: EvilIcons.credit_card));
  operationsList.add(BudgetDetails(budgetType: 'Analytics', icon: Feather.bar_chart_2));
  operationsList.add(BudgetDetails(budgetType: 'Budget', icon: Entypo.line_graph));
  return operationsList;
}

List<BudgetDetails> getSendMoneyList() {
  List<BudgetDetails> sendMoneyList = [];
  sendMoneyList.add(BudgetDetails(budgetType: 'Bank', icon: MaterialCommunityIcons.bank_outline));
  sendMoneyList.add(BudgetDetails(budgetType: 'TopUp', icon: Foundation.ticket));
  sendMoneyList.add(BudgetDetails(budgetType: 'QR Code', icon: FontAwesome.qrcode));
  sendMoneyList.add(BudgetDetails(budgetType: 'Nearby', icon: Entypo.location));

  return sendMoneyList;
}

List<BudgetDetails> getReceiptsList() {
  List<BudgetDetails> receiptsList = [];
  receiptsList.add(BudgetDetails(budgetType: 'Michel', totalCost: mb_profile1));
  receiptsList.add(BudgetDetails(budgetType: 'Billy', totalCost: mb_profile2));
  receiptsList.add(BudgetDetails(budgetType: 'Mark', totalCost: mb_profile3));
  receiptsList.add(BudgetDetails(budgetType: 'James', totalCost: mb_profile4));
  receiptsList.add(BudgetDetails(budgetType: 'Denial', totalCost: mb_profile5));

  return receiptsList;
}

List<BudgetDetails> getAddNewContactList() {
  List<BudgetDetails> addNewContactList = [];
  addNewContactList.add(BudgetDetails(budgetType: 'Michel', img: mb_profile1, totalCost: '+0 000 0000'));
  addNewContactList.add(BudgetDetails(budgetType: 'Billy', img: mb_profile2, totalCost: '+0 000 0000'));
  addNewContactList.add(BudgetDetails(budgetType: 'Mark', img: mb_profile3, totalCost: '+0 000 0000'));
  addNewContactList.add(BudgetDetails(budgetType: 'James', img: mb_profile4, totalCost: '+0 000 0000'));
  addNewContactList.add(BudgetDetails(budgetType: 'Denial', img: mb_profile5, totalCost: '+0 000 0000'));

  return addNewContactList;
}

List<BudgetDetails> getCategoryBudgetList() {
  List<BudgetDetails> categoryBudgetList = [];
  categoryBudgetList.add(BudgetDetails(budgetType: 'Bank', img: mb_home));
  categoryBudgetList.add(BudgetDetails(budgetType: 'Cash', img: mb_cash));
  categoryBudgetList.add(BudgetDetails(budgetType: 'Saving', img: mb_saving));
  categoryBudgetList.add(BudgetDetails(budgetType: 'Loan', img: mb_loan));

  return categoryBudgetList;
}

List<BudgetDetails> getCompleteList() {
  List<BudgetDetails> completeList = [];
  completeList.add(BudgetDetails(budgetType: '90% Completed', totalCost: '7 out of 10 completed'));
  completeList.add(BudgetDetails(budgetType: '70% Completed', totalCost: '5 out of 10 completed'));
  completeList.add(BudgetDetails(budgetType: '50% Completed', totalCost: '9 out of 10 completed'));
  return completeList;
}

List<BudgetDetails> getQuickActionList() {
  List<BudgetDetails> quickActionList = [];
  quickActionList.add(BudgetDetails(budgetType: '\$100'));
  quickActionList.add(BudgetDetails(budgetType: '\$300'));
  quickActionList.add(BudgetDetails(budgetType: '\$500'));

  return quickActionList;
}

List<BudgetDetails> getTransactionHistoryList() {
  List<BudgetDetails> transactionHistoryList = [];
  transactionHistoryList.add(
    BudgetDetails(img: mb_uber, budgetType: 'Uber Ride', totalCost: '\$100.20', progressPercentage: '10:45pm', date: '24/12/2020'),
  );
  transactionHistoryList.add(
    BudgetDetails(img: mb_subway, budgetType: 'Subway Dining', totalCost: '\$250.50', progressPercentage: '02:40pm', date: '21/10/2020'),
  );
  transactionHistoryList.add(
    BudgetDetails(img: mb_pizza, budgetType: 'PizzaHut', totalCost: '\$600.00', progressPercentage: '05:20pm', date: '01/01/2021'),
  );

  return transactionHistoryList;
}

List<BHMessageModel> getChatMsgData() {
  List<BHMessageModel> list = [];

  BHMessageModel c1 = BHMessageModel();
  c1.senderId = BHSender_id;
  c1.receiverId = BHReceiver_id;
  c1.msg = 'Helloo';
  c1.time = '1:43 AM';
  list.add(c1);

  BHMessageModel c2 = BHMessageModel();
  c2.senderId = BHSender_id;
  c2.receiverId = BHReceiver_id;
  c2.msg = 'How are you? What are you doing?';
  c2.time = '1:45 AM';
  list.add(c2);

  BHMessageModel c3 = BHMessageModel();
  c3.senderId = BHReceiver_id;
  c3.receiverId = BHSender_id;
  c3.msg = 'Helloo...';
  c3.time = '1:45 AM';
  list.add(c3);

  BHMessageModel c4 = BHMessageModel();
  c4.senderId = BHSender_id;
  c4.receiverId = BHReceiver_id;
  c4.msg = 'I am good. Can you do something for me? I need your help.';
  c4.time = '1:45 AM';
  list.add(c4);

  BHMessageModel c5 = BHMessageModel();
  c5.senderId = BHSender_id;
  c5.receiverId = BHReceiver_id;
  c5.msg = 'I am good. Can you do something for me? I need your help.';
  c5.time = '1:45 AM';
  list.add(c5);

  BHMessageModel c6 = BHMessageModel();
  c6.senderId = BHReceiver_id;
  c6.receiverId = BHSender_id;
  c6.msg = 'I am good. Can you do something for me? I need your help.';
  c6.time = '1:45 AM';
  list.add(c6);

  BHMessageModel c7 = BHMessageModel();
  c7.senderId = BHSender_id;
  c7.receiverId = BHReceiver_id;
  c7.msg = 'I am good. Can you do something for me? I need your help.';
  c7.time = '1:45 AM';
  list.add(c7);

  BHMessageModel c8 = BHMessageModel();
  c8.senderId = BHReceiver_id;
  c8.receiverId = BHSender_id;
  c8.msg = 'I am good. Can you do something for me? I need your help.';
  c8.time = '1:45 AM';
  list.add(c8);

  BHMessageModel c9 = BHMessageModel();
  c9.senderId = BHSender_id;
  c9.receiverId = BHReceiver_id;
  c9.msg = 'I am good. Can you do something for me? I need your help.';
  c9.time = '1:45 AM';
  list.add(c9);

  BHMessageModel c10 = BHMessageModel();
  c10.senderId = BHReceiver_id;
  c10.receiverId = BHSender_id;
  c10.msg = 'I am good. Can you do something for me? I need your help.';
  c10.time = '1:45 AM';
  list.add(c10);

  BHMessageModel c11 = BHMessageModel();
  c11.senderId = BHReceiver_id;
  c11.receiverId = BHSender_id;
  c11.msg = 'I am good. Can you do something for me? I need your help.';
  c11.time = '1:45 AM';
  list.add(c11);

  BHMessageModel c12 = BHMessageModel();
  c12.senderId = BHSender_id;
  c12.receiverId = BHReceiver_id;
  c12.msg = 'I am good. Can you do something for me? I need your help.';
  c12.time = '1:45 AM';
  list.add(c12);

  BHMessageModel c13 = BHMessageModel();
  c13.senderId = BHSender_id;
  c13.receiverId = BHReceiver_id;
  c13.msg = 'I am good. Can you do something for me? I need your help.';
  c13.time = '1:45 AM';
  list.add(c13);

  BHMessageModel c14 = BHMessageModel();
  c14.senderId = BHReceiver_id;
  c14.receiverId = BHSender_id;
  c14.msg = 'I am good. Can you do something for me? I need your help.';
  c14.time = '1:45 AM';
  list.add(c14);

  BHMessageModel c15 = BHMessageModel();
  c15.senderId = BHSender_id;
  c15.receiverId = BHReceiver_id;
  c15.msg = 'I am good. Can you do something for me? I need your help.';
  c15.time = '1:45 AM';
  list.add(c15);

  BHMessageModel c16 = BHMessageModel();
  c16.senderId = BHReceiver_id;
  c16.receiverId = BHSender_id;
  c16.msg = 'I am good. Can you do something for me? I need your help.';
  c16.time = '1:45 AM';
  list.add(c16);

  BHMessageModel c17 = BHMessageModel();
  c17.senderId = BHSender_id;
  c17.receiverId = BHReceiver_id;
  c17.msg = 'I am good. Can you do something for me? I need your help.';
  c17.time = '1:45 AM';
  list.add(c17);

  BHMessageModel c18 = BHMessageModel();
  c18.senderId = BHReceiver_id;
  c18.receiverId = BHSender_id;
  c18.msg = 'I am good. Can you do something for me? I need your help.';
  c18.time = '1:45 AM';
  list.add(c18);

  return list;
}

List<BudgetDetails> getMonthNameList() {
  List<BudgetDetails> monthList = [];
  monthList.add(BudgetDetails(nameMonth: 'January'));
  monthList.add(BudgetDetails(nameMonth: 'February'));
  monthList.add(BudgetDetails(nameMonth: 'March'));
  monthList.add(BudgetDetails(nameMonth: 'April'));
  monthList.add(BudgetDetails(nameMonth: 'May'));
  monthList.add(BudgetDetails(nameMonth: 'June'));
  monthList.add(BudgetDetails(nameMonth: 'July'));
  monthList.add(BudgetDetails(nameMonth: 'August'));
  monthList.add(BudgetDetails(nameMonth: 'September'));
  monthList.add(BudgetDetails(nameMonth: 'October'));
  monthList.add(BudgetDetails(nameMonth: 'November'));
  monthList.add(BudgetDetails(nameMonth: 'December'));

  return monthList;
}
