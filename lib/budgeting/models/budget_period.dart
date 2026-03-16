enum BudgetPeriod { monthly, weekly }

extension BudgetPeriodLabelX on BudgetPeriod {
  String get label {
    switch (this) {
      case BudgetPeriod.monthly:
        return 'Monthly';
      case BudgetPeriod.weekly:
        return 'Weekly';
    }
  }
}
