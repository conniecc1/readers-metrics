# Readers-core-metrics

This repo contains all the code needed to calculate the monthly Wikimedia movement metrics related to reading activity including page interactions (pageviews and seen previews) and unique devices. Dependencies include:

* This code is designed to run on one of the [SWAP](https://wikitech.wikimedia.org/wiki/SWAP) servers and will not work elsewhere.
* The Metics are calculated from the following sources:  
  + previews: [virtualpageview_hourly](https://wikitech.wikimedia.org/wiki/Analytics/Data_Lake/Traffic/Virtualpageview_hourly)
  + pageviews: [pageview hourly](https://wikitech.wikimedia.org/wiki/Analytics/Data_Lake/Traffic/Pageview_hourly), 
  + unique devices:  [unique_devices_per_project_family_monthly](https://wikitech.wikimedia.org/wiki/Analytics/Data_Lake/Traffic/Unique_Devices)


# Usage
1. Clone this onto one of the [SWAP](https://wikitech.wikimedia.org/wiki/SWAP) hosts.
1. In any order, run the two notebooks numbered 01
    * [01a-update_pageviews_table.ipynb](01a-update_pageviews_table.ipynb): creates or updates an intermediate pageview table in the cchen Hive database.
    * [01b-update_diversity_table.ipynb](01b-update_diversity_table.ipynb): creates or updates an intermediate pageview table  for global south and global north in the cchen Hive database.
1. In any order, run the two notebooks numbered 02
    * Run the notebook [02a-calculation.ipynb](02a-calculation.ipynb), which actually calculates the metrics (some of them using the pageview, preview and unique devices tables) and inserts them into metrics.tsv.
    * Run the notebook [02b-diversity-calculation.ipynb](02b-diversity-calculation.ipynb), which actually calculates the diversity metrics (using the pageview tables calculated in the previous step and preview table) and inserts them into diversity_metrics.tsv.
1. Run the notebook [03-report.ipynb](03-report.ipynb), which does a few simple transformations on the metrics and produces the table of values needed for the final report, as well as a graph of each metric.
1. Run the notebook [04-Visualiaztion.ipynb](03-Visualzation.ipynb), which provides YoY charts for metrics in the metrics deck.
1. Do any analysis you need to understand major trends (drawing on the analysis notes in past months' slides if needed). The [analysis folder](analysis) has a variety of notebook you could reuse; if you do new analysis, considering keeping it in an existing or new notebook in this folder, so it can be reused in the future.


## Data Definitions

Current definitions of these core metrics are documented in the [Wikimedia Audience Data Dictionary page](https://www.mediawiki.org/wiki/Wikimedia_Product/Data_dictionary#Core_metrics).
