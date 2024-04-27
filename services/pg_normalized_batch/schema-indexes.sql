SET max_parallel_workers = 80;
SET maintenance_work_mem TO '16 GB';

CREATE INDEX idx_tag_id_tweets ON tweet_tags (tag, id_tweets);
CREATE INDEX idx_tag ON tweet_tags (tag);
CREATE INDEX idx_id_tweets_tag ON tweet_tags (id_tweets, tag);
CREATE INDEX idx_tweet_tags_tag_id_tweets ON tweet_tags (tag, id_tweets);
CREATE INDEX idx_tweets_id_tweets_lang ON tweets (id_tweets, lang);
CREATE INDEX idx_tweets_text_gin ON tweets USING GIN (to_tsvector('english', text));
CREATE INDEX idx_land ON tweets (lang);
