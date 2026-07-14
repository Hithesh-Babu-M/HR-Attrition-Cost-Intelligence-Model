-- ============================================
-- HR Attrition Cost Intelligence Model - SQL Queries
-- Dataset: IBM HR Analytics Employee Attrition
-- ============================================

-- Query 1: Overall attrition rate and estimated replacement cost
-- Business question: How many employees are leaving, and what does it cost?
-- Note: replacement cost assumes 50% of annual salary (conservative industry estimate)
SELECT
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited_employees,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_pct,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN MonthlyIncome * 12 * 0.5 ELSE 0 END), 2) AS total_replacement_cost
FROM Attrition;

-- Query 2: Attrition rate by JobRole
-- Business question: Which roles have the highest turnover risk?
SELECT
    JobRole,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited_employees,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM Attrition
GROUP BY JobRole
ORDER BY attrition_rate_pct DESC;

-- Query 3: Attrition rate by OverTime status
-- Business question: Does overtime correlate with attrition?
SELECT
    OverTime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited_employees,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM Attrition
GROUP BY OverTime
ORDER BY attrition_rate_pct DESC;