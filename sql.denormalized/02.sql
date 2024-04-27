SELECT tag, COUNT(*) AS count
FROM (
    SELECT DISTINCT 
        data->>'id' as id_tweets, 
        '#' || (jsonb_array_elements(data->'entities'->'hashtags' || coalesce(data->'extended_tweet'->'entities'->'hashtags','[]'))->>'text') as tag
    FROM tweets_jsonb
    WHERE data->'entities'->'hashtags' @> '[{"text": "coronavirus"}]'::jsonb
    UNION 
    SELECT DISTINCT 
        data->>'id' as id_tweets, 
        '#' || (jsonb_array_elements(data->'entities'->'hashtags' || coalesce(data->'extended_tweet'->'entities'->'hashtags','[]'))->>'text') as tag
    FROM tweets_jsonb
    WHERE data->'extended_tweet'->'entities'->'hashtags' @> '[{"text": "coronavirus"}]'::jsonb
) AS derived_table
GROUP BY tag
ORDER BY count DESC, tag
Limit 1000;
