SET max_parallel_workers = 80;
SET maintenance_work_mem TO '16 GB';

CREATE INDEX hashtags_gin ON tweets_jsonb USING gin((data->'entities'->'hashtags'));
CREATE INDEX ex_hashtags_gin ON tweets_jsonb USING gin((data->'extended_tweet'->'entities'->'hashtags'));
CREATE INDEX text_gin ON tweets_jsonb USING gin(to_tsvector('english', COALESCE(data->'extended_tweet'->>'full_text', data->>'text')));
