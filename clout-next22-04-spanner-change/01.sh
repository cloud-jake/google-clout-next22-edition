#!/bin/bash

###################################
## Define Vairables Here         ##
###################################

source variables.inc 

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


gcloud dataflow flex-template run ${DATAFLOW_JOB} --template-file-gcs-location gs://dataflow-templates-us-east1/latest/flex/Spanner_Change_Streams_to_BigQuery --region ${REGION}  --parameters spannerInstanceId=${SOURCE_INSTANCE},spannerDatabase=${SOURCE_DATABASE},spannerMetadataInstanceId=${INSTANCE},spannerMetadataDatabase=${DATABASE},spannerChangeStreamName=${DATAFLOW_JOB},bigQueryDataset=${BQ_DATASET}
