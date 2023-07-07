< (year, month) =>
  month -= 1
  begin_ms = Date.UTC year, month
  end_ms = Date.UTC year, month + 1, 0, 23, 59, 59, 999
  [begin_ms, end_ms]


