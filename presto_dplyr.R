library(RPresto)
library(tidyverse)
library(DBI)
db <- src_presto(
  host='47.93.29.9',
  port=8080,
  user='yanagishima',
  schema='dws_bobo_logs',
  catalog='hive',
  source='yanagishima')

iris <- tbl(db, 'dws_bobo_sdk_all')
iris %>% select(dt,eventid) %>% group_by(eventid) %>% summarise(n = count(eventid))


con <- dbConnect(
  RPresto::Presto(),
  host='47.93.29.9',
  port=8080,
  user='yanagishima',
  schema='default',
  catalog='hive',
  source='yanagishima'
)
