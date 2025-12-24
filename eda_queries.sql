--Country based user analysis, calculates ARPU to find valuable markets.

SELECT 
    country,
    COUNT(DISTINCT user_id) AS total_users,
    ROUND(SUM(iap_revenue + ad_revenue), 2) AS total_revenue,
    ROUND(SUM(iap_revenue + ad_revenue) / COUNT(DISTINCT user_id), 2) AS arpu,
    ROUND(100.0 * COUNT(DISTINCT CASE WHEN iap_revenue > 0 THEN user_id END) / COUNT(DISTINCT user_id), 2) AS payer_pct

FROM master_data
GROUP BY 1
HAVING total_users > 500
ORDER BY arpu DESC
LIMIT 15;

-- Platform based analysis.

SELECT 
    platform,
    COUNT(DISTINCT user_id) AS user_count,
    
    ROUND(AVG(iap_revenue), 2) AS avg_iap_revenue,
    ROUND(AVG(ad_revenue), 2) AS avg_ad_revenue,
    
    ROUND(AVG(iap_revenue + ad_revenue), 2) AS total_arpu

FROM master_data
WHERE platform IS NOT NULL
GROUP BY 1;

-- Loyalty Analysis

WITH UserSegments AS (
    SELECT 
        user_id,
        CASE 
            WHEN SUM(total_session_duration) < 300 THEN '1. Low (0-5 minutes)'
            WHEN SUM(total_session_duration) BETWEEN 300 AND 1200 THEN '2. Average (5-20 minutes)'
            ELSE '3. High (20+ minutes)' 
        END AS engagement_level
    FROM master_data
    GROUP BY 1
)
SELECT 
    seg.engagement_level,
    COUNT(DISTINCT seg.user_id) AS user_count,

    ROUND(AVG(m.iap_revenue + m.ad_revenue), 2) AS avg_revenue_per_user
    
FROM UserSegments seg
JOIN master_data m ON seg.user_id = m.user_id
GROUP BY 1
ORDER BY user_count;