enum CoinValue {
  fiveCent("5ct"),
  tenCent("10ct"),
  twentyCent("20ct"),
  fiftyCent("50ct"),
  oneEuro("1€"),
  twoEuro("2€");

  const CoinValue(this.displayName);

  final String displayName;
}
