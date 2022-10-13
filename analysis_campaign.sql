WITH rules AS (
    SELECT
        CASE 
        WHEN channel = "" THEN ""
        WHEN LOWER(campaign) LIKE "%nonbranded%" THEN "Nonbranded"
        WHEN LOWER(campaign) LIKE "%ramadhanamanah%" THEN "Ramadhan Amanah"
        WHEN LOWER(campaign) LIKE "%grandpromo%" THEN "Grand Promo"
        WHEN LOWER(campaign) LIKE "%microcampaign%" THEN "Micro Campaign"
        WHEN LOWER(campaign) LIKE "%branded%" THEN "branded"
        WHEN LOWER(campaign) LIKE "%showroom%" THEN "showroomdealer"
        WHEN LOWER(campaign) LIKE "%cashback4%" THEN "Cashback4mio"
        WHEN LOWER(campaign) LIKE "%dp10%" THEN "DP10%"
        WHEN LOWER(campaign) LIKE "%dp15%" THEN "DP15%"
        WHEN LOWER(campaign) LIKE "%prelaunch_%" THEN "Prelaunch"
        WHEN LOWER(campaign) LIKE "%bunga0%" THEN "Bunga0%"
        WHEN LOWER(campaign) LIKE "%bunga3%" THEN "Bunga3%"
        WHEN LOWER(campaign) LIKE "%pestaakhir%" THEN "PestaAkhirTahun"
        WHEN LOWER(campaign) LIKE "%specialpackage%" THEN "Prelaunch"
        ELSE ""
        END AS campaign_group
        , campaign_id
    FROM `myproject.mydataset.campaigns`
)

SELECT
  cp.date
  , cr.campaign_group
  , SUM(cp.clicks) as total_clicks
  , SUM(cp.view) as total_view
  , SUM(cp.clicks) / SUM(cp.view) as click_through_rate
FROM `myproject.mydataset.campaign_performance` cp
  LEFT JOIN campaigns_rule cr
    ON cr.campaign_id = cp.campaign_id
