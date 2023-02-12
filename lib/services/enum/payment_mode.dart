enum PaymentMode {
  cryptocurrency("Cryptocurrency"),
  creditCard("Credit Card"),
  debitCard("Debit Card"),
  bankTransfer("Bank Tranfer");

  final String title;
  const PaymentMode(this.title);
}
