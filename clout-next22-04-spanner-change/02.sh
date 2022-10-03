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


# Add Data
gcloud spanner databases execute-sql $SOURCE_DATABASE --instance=$SOURCE_INSTANCE --sql="INSERT INTO orders(OrderID,CustomerID,OrderDate,Price,ProductID) VALUES(123,456,'2022-04-26',99,789);"

