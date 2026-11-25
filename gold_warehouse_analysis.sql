SELECT 
    c.Demand_Season,
    COUNT(g.Date) AS total_trading_days,
    ROUND(AVG(g.Daily_Swing_INR), 2) AS avg_intraday_swing_inr,
    ROUND(MAX(g.Daily_Swing_INR), 2) AS max_single_day_swing_inr,
    ROUND(AVG(ABS(g.Daily_Change_Pct)), 2) AS avg_volatility_pct
FROM Fact_India_Gold g
JOIN Dim_Calendar c ON g.Date = c.Date
GROUP BY c.Demand_Season
ORDER BY avg_intraday_swing_inr DESC;
