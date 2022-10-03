#!/bin/bash

###################################
## Define Vairables Here         ##
###################################

source variables.inc 

#PROJECT=

#REGION=

#INSTANCE=
#DATABASE=
#TABLE_NAME=

#BQ_DATASET=

################################################
#LOCATION=regional-${REGION}

#SOURCE_INSTANCE=orders
#SOURCE_DATABASE=orders-db
#SOURCE_TABLE_NAME=orders

#STREAM_NAME=ordersstream

#DATAFLOW_JOB=streamjob

gcloud config set project $PROJECT


#"parameters":{
#"bigQueryDataset":"stream_meta",
#"labels":"{\n 
#	\"goog-dataflow-provided-template-name\" : \"spanner_change_streams_to_bigquery\",\n 
#	\"goog-dataflow-provided-template-type\" : \"flex\"\n}
#
#	\n","spannerChangeStreamName":"streamjob",
#	"spannerDatabase":"orders-db",
#	"spannerInstanceId":"orders",
#	"spannerMetadataDatabase":"ordermeta-db",
#	"spannerMetadataInstanceId":"ordermeta",
#


#gcloud dataflow jobs run $DATAFLOW_JOB \
#    --gcs-location gs://dataflow-templates/2022-07-18-00_rc00/spanner-changestreams-to-bigquery \
#    --region $REGION \
#    --parameters \
#spannerChangeStreamName=$STREAM_NAME,\
#spannerDatabase=$SOURCE_DATABASE,\
#spannerInstanceId=$SOURCE_INSTANCE,\
#spannerMetadataDatabase=$DATABASE,\
#spannerMetadataInstanceId=$INSTANCE,\
#bigQueryDataset=$BQ_DATASET

# dataflow redo
#gcloud dataflow jobs run $INSTANCE --gcs-location gs://dataflow-templates/latest/GCS_Text_to_Cloud_Spanner --region $REGION

#gcloud spanner databases create $DATABASE --instance=$INSTANCE --database-dialect=GOOGLE_STANDARD_SQL --ddl="CREATE TABLE ${TABLE_NAME} (ShipName STRING(200),Registry STRING(200),ShipClass STRING(200),Description STRING(2560),) PRIMARY KEY(Registry);"

# Add Data
gcloud spanner databases execute-sql $SOURCE_DATABASE --instance=$SOURCE_INSTANCE --sql="INSERT INTO orders(OrderID,CustomerID,OrderDate,Price,ProductID) VALUES(123,456,'2022-04-26',99,789);"


echo "dataflow jobs run $DATAFLOW_JOB "
#    --gcs-location gs://dataflow-templates/2022-07-18-00_rc00/spanner-changestreams-to-bigquery \
#    --region $REGION \
#    --parameters \
echo "Job Name: ${DATAFLOW_JOB}"
echo ""
echo "REGION: ${REGION}"
echo ""
echo "spannerInstanceId=$SOURCE_INSTANCE"
echo "spannerDatabase=$SOURCE_DATABASE"
echo "spannerMetadataInstanceId=$INSTANCE"
echo "spannerMetadataDatabase=$DATABASE"
echo "spannerChangeStreamName=$STREAM_NAME"
echo "bigQueryDataset=$BQ_DATASET"

