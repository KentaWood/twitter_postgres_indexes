SELECT 
    data->>'lang' AS lang,
    COUNT(DISTINCT data->>'id') AS count
FROM tweets_jsonb
WHERE data->'entities'->'hashtags' @> '[{"text":"coronavirus"}]'::jsonb
	OR data->'extended_tweet'->'entities'->'hashtags' @> '[{"text":"coronavirus"}]'::jsonb
GROUP BY lang
ORDER BY count DESC, lang;
