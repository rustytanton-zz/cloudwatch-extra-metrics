#!/bin/bash

# some code ripped from this page:
# https://forums.aws.amazon.com/message.jspa?messageID=266893

export AWS_CLOUDWATCH_URL=https://monitoring.amazonaws.com

# get ec2 instance id
instanceid=`wget -q -O - http://169.254.169.254/latest/meta-data/instance-id`

yum check-update

# return code will be 100 if updates are available, 0 otherwise
# the metric won't appear in cloudwatch until the first time a 100 is returned
updatescode=$?

mon-put-data --metric-name "YumUpdatesAvailable" --namespace "System/Linux" --dimensions "InstanceId=$instanceid" --value "$updatescode"