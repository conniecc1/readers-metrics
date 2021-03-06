SELECT
    DATE_FORMAT(date, 'YYYY-MM-01') AS month,
    SUM(unique_devices) AS unique_devices
FROM
(
    SELECT
      CONCAT(year,'-',LPAD(month,2,'0'),'-01') AS date,
      uniques_estimate as unique_devices
    FROM 
        wmf.unique_devices_per_project_family_monthly
    WHERE 
        year >= 2014
      AND project_family = 'wikipedia'
) a
WHERE DATE_FORMAT(date, 'YYYY-MM-01') = "{metrics_month_first_day}"
GROUP BY DATE_FORMAT(date, 'YYYY-MM-01') 
LIMIT 1000