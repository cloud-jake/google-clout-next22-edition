#



REGION=us-central1

INSTANCE=
DATABASE=

BQ_DATASET=

################################################
LOCATION=regional-${REGION}

PROJECT=`gcloud config get-value project`

SOURCE_INSTANCE=orders
SOURCE_DATABASE=orders-db
SOURCE_TABLE_NAME=orders

STREAM_NAME=ordersstream

DATAFLOW_JOB=streamjob
