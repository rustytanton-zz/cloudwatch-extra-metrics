#!/bin/bash
 
# based on an example from this page:
# https://forums.aws.amazon.com/message.jspa?messageID=266893

export AWS_CLOUDWATCH_URL=https://monitoring.amazonaws.com
 
# get ec2 instance id
instanceid=`wget -q -O - http://169.254.169.254/latest/meta-data/instance-id`
 
memtotal=`free -m | grep 'Mem' | tr -s ' ' | cut -d ' ' -f 2`
memfree=`free -m | grep 'buffers/cache' | tr -s ' ' | cut -d ' ' -f 4`
let "memused=100-memfree*100/memtotal"
 
mon-put-data --metric-name "UsedMemoryPercent" --namespace "System/Linux" --dimensions "InstanceId=$instanceid" --value "$memused" --unit "Percent"