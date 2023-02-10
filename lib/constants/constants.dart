import 'package:flutter/material.dart';

class CColor {
  static const Color topbar = Color(0xffeeeeee);
  static const Color border = Color(0xff333333);
  static const Color title = Colors.black;
  static const Color background = Colors.grey;
  static const Color dtext = Colors.grey;
  static const Color greyBackground = Colors.grey;
  static const Color ntext1 = Color(0xffffffff);
  static const Color ntext2 = Color(0xff222222);
  static const Color ltext = Colors.grey;
  static const Color select = Color.fromARGB(255, 144, 234, 213);
  static const Color unselect = Colors.grey;
  static const Color button = Color(0Xff62828f);
}

const List<String> freeList = [
  'Limitless Tasks',
  'Two-Factor Authentication',
  'Limitless Projects',
  'Limitless Messages',
  'Limitless Activity Log',
  '100MB File Storage',
  'Colaborative Docs',
  'List View Projects',
  'Board View Projects',
  'Calender View',
  'Basic Time Tracking',
  'Project Overview',
  'Project View',
  'Sprint Management',
  'Kanban Board',
  'iOS & and Android Mobile Apps',
  '24/7 Support',
];

const List<String> basicList = [
  'Limitless Storage',
  'Limitless Integration',
  'Limitless Dashboards',
  'Limitless Gantt charts',
  'Advanced search',
  'Limitless Custom fields',
  'Limitless  free guests',
  'Native Forms',
  'Agile Reporting',
  'Goals and portfolios',
  'Task Templates',
  'Milestones',
  'Admin Console',
  'Private teams & projects',
  'start dates and time',
  'Resources Management',
];

const List<String> premiumList = [
  'Portfolios',
  'Goals',
  'Workload',
  'Custom rules builder',
  'Form customization',
  'Approvals',
  'Proofing',
  'Lock custom fields',
  'Advanced integration',
  'Workspace-level templates',
  'Collections',
  'Observers',
  'Priority support',
  'Simple data export',
  'Admin and security features',
  'Organization visible boards',
  'Public board management',
  'Multi-board guests',
  'Attachment permissions',
];
const imgPath = 'assets/images';
List<Map<String, dynamic>> cryptoList = [
  {
    'name': 'Bitcoin',
    'symbol': 'BTC',
    'logo': '$imgPath/bitcoin.png',
    'address': '18Td9sG9no7HPmDQKwFi6N9bZJbjzF821x'
  },
  {
    'name': 'Etherium',
    'symbol': 'ETH',
    'logo': '$imgPath/ethereum.png',
    'address': '0xbfc2f23af03243fa60220037b86f00ed0ed4f5a1'
  },
  {
    'name': 'Tether',
    'symbol': 'USD',
    'logo': '$imgPath/usdt-tether.png',
    'address': 'TXj63seprxdnDNWxgwRswFjPemGmHcxSsr'
  },
  {
    'name': 'Binance',
    'symbol': 'BUSD',
    'logo': '$imgPath/bnb.png',
    'address': '0xbfc2f23af03243fa60220037b86f00ed0ed4f5a1'
  },
  {
    'name': 'Dogecoin',
    'symbol': 'DOGE',
    'logo': '$imgPath/dogecoin.png',
    'address': '0xbfc2f23af03243fa60220037b86f00ed0ed4f5a1'
  },
];

List<Map<String, dynamic>> creditCardList = [
  {
    'name': 'Master Card',
    'logo': '$imgPath/master-card.png',
  },
  {
    'name': 'VISA',
    'logo': '$imgPath/visa.png',
  },
  {
    'name': 'America Express',
    'logo': '$imgPath/america-express.png',
  },
  {
    'name': 'Discover',
    'logo': '$imgPath/discover.png',
  },
];

List<Map<String, dynamic>> debitCardList = [
  {
    'name': 'Debit Card',
    'logo': '$imgPath/debit-card.png',
  },
];

List<Map<String, dynamic>> bankTransfer = [
  {
    'name': 'Bank Transfer',
    'logo': '$imgPath/bank-transfer.png',
  },
];
