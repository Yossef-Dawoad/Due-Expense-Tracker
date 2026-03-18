class CreateBudgetAlertPreferences {
  const CreateBudgetAlertPreferences({
    this.notifyAtNinetyPercent = true,
    this.notifyWhenExceeded = true,
    this.notifyBeforePeriodEnds = false,
  });

  final bool notifyAtNinetyPercent;
  final bool notifyWhenExceeded;
  final bool notifyBeforePeriodEnds;

  CreateBudgetAlertPreferences copyWith({
    bool? notifyAtNinetyPercent,
    bool? notifyWhenExceeded,
    bool? notifyBeforePeriodEnds,
  }) {
    return CreateBudgetAlertPreferences(
      notifyAtNinetyPercent:
          notifyAtNinetyPercent ?? this.notifyAtNinetyPercent,
      notifyWhenExceeded: notifyWhenExceeded ?? this.notifyWhenExceeded,
      notifyBeforePeriodEnds:
          notifyBeforePeriodEnds ?? this.notifyBeforePeriodEnds,
    );
  }
}
