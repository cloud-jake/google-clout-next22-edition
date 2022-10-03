#!/bin/bash

###################################
## Define Vairables Here         ##
###################################

source variables.inc 

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

# Enable Services
# gcloud services enable spanner.googleapis.com dataflow.googleapis.com

# 1-a - Create Instacne
gcloud spanner instances create $INSTANCE --project $PROJECT --config=$LOCATION --description=$INSTANCE --nodes=1 

# 1-b - Create Database
gcloud spanner databases create $DATABASE --project $PROJECT --instance=$INSTANCE --database-dialect=GOOGLE_STANDARD_SQL --project $PROJECT

# 1-c - Create BigQuery DataSet
bq --location=$REGION --project_id=${PROJECT} mk --dataset --default_table_expiration 0 $BQ_DATASET

# 2 - Create Change Stream
gcloud spanner databases ddl update --project $PROJECT $SOURCE_DATABASE --instance=${SOURCE_INSTANCE} --ddl="CREATE CHANGE STREAM ${STREAM_NAME} FOR ${SOURCE_TABLE_NAME};"



# dataflow redo
#gcloud dataflow jobs run $INSTANCE --gcs-location gs://dataflow-templates/latest/GCS_Text_to_Cloud_Spanner --region $REGION 



# Add Data
#gcloud spanner databases execute-sql $SOURCE_DATABASE --instance=$SOURCE_INSTANCE --sql="INSERT INTO orders(OrderID,CustomerID,OrderDate,Price,ProductID) VALUES(123,456,'2022-04-26',99,789);"

