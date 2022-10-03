REGION=us-central1

PROJECT=qwiklabs-gcp-01-d8416842edd2

INSTANCE=ordermeta
DATABASE=ordermeta-db
TABLE_NAME=stream_meta

BQ_DATASET=stream_meta

################################################
LOCATION=regional-${REGION}

SOURCE_INSTANCE=orders
SOURCE_DATABASE=orders-db
SOURCE_TABLE_NAME=orders

STREAM_NAME=ordersstream

DATAFLOW_JOB=streamjob
