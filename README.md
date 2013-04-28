Amazon Cloudwatch Extra Metrics for Linux AMIs
==============================================

Provides these Cloudwatch metrics which are not available in Amazon's "Detailed Monitoring" for EC2 instances by default:

* FreeMemoryMBytes
* UsedMemoryPercent
* YumUpdatesAvailable

Installation
------------
Presuming you already have an AWS account and an EC2 AMI running Linux:
* Install floodfx's [aws-tools](https://github.com/floodfx/aws-tools) on your server. Make sure the following environment variables are available when the script runs (this should be done after installing aws-tools):
	* `AWS_ACCESS_KEY_ID` - your AWS access key
	* `AWS_SECRET_ACCESS_KEY` - your AWS access key
	* `EC2_CERT` - path to your private certificate
	* `EC2_PRIVATE_KEY` - path to your private key
	* `AWS_TOOLS_HOME` - path to aws-tools
* Clone this repo somewhere on the AMI

Usage
-----
Set up a cron job to run a metric script from this repo at the desired interval. 

Here is an example crontab which sends metrics every five minutes, it sets environment variables from ~/.bash_profile before running:


	*/5 * * * * . $HOME/.bash_profile; /path/to/cloudwatch-extra-metrics/metrics/UsedMemoryPercent.sh
	*/5 * * * *  . $HOME/.bash_profile; /path/to/cloudwatch-extra-metrics/metrics/FreeMemoryMBytes.sh
