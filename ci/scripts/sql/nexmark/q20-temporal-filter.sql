-- noinspection SqlNoDataSourceInspectionForFile
-- noinspection SqlResolveForFile
CREATE SINK nexmark_q20_temporal_filter AS
SELECT auction,
       bidder,
       price,
       channel,
       url,
       B.date_time as bid_date_time,
       B.extra     as bid_extra,
       item_name,
       description,
       initial_bid,
       reserve,
       A.date_time as auction_date_time,
       expires,
       seller,
       category,
       A.extra     as auction_extra
FROM bid_filtered AS B
         INNER JOIN auction AS A on B.auction = A.id
WHERE A.category = 10
WITH ( connector = 'blackhole', type = 'append-only', force_append_only = 'true');
