// ignore_for_file: constant_identifier_names

enum LoadState { loading, idle, success, error, loadmore, done }

enum CurrentState { loggedIn, onboarded, initial }

enum OverLayType { loader, message, none }

enum MessageType { error, success, info, warning }

enum BusinessType { single, multiple }

enum ProductType { data, airtime, sendmoney, electricity, cabletv }

enum ServiceCategory { pay, essentials, lifestyle, business }

enum NotificationType {
  promotion,
  complaint,
  admin,
  general,
  message,
}

enum TransType {
  debit(name: 'DEBIT'),
  credit(name: 'CREDIT');

  final String name;

  const TransType({required this.name});
}

enum VerifyType {
  Email(name: "email"),
  PhoneNumber(name: "phoneNumber");

  final String name;

  const VerifyType({
    required this.name,
  });
}

enum PermissionStatus {
  denied,
  deniedForever,
  whileInUse,
  always,
  unableToDetermine,
  initial,
}
