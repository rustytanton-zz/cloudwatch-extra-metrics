#!/bin/bash

# some code ripped from this page:
# https://forums.aws.amazon.com/message.jspa?messageID=266893

# arg 1 is service to check, this is required
servicename=$1
if [[ -z $servicename ]]; then exit 1; fi

export AWS_CLOUDWATCH_URL=https://monitoring.amazonaws.com

# get ec2 instance id
instanceid=`wget -q -O - http://169.254.169.254/latest/meta-data/instance-id`

sudo service --status-all | grep $servicename

# return code is 0 if running, 1 if not
# the metric won't appear in cloudwatch until the first time a 1 is returned
availcode=$?

mon-put-data --metric-name "ServiceRunning-$servicename" --namespace "System/Linux" --dimensions "InstanceId=$instanceid" --value "$availcode"