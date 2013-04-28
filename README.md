Amazon Cloudwatch Extra Metrics for Linux AMIs
==============================================

Provides these Cloudwatch metrics which are not available in Amazon's "Detailed Monitoring" for EC2 instances by default.

* FreeMemoryMBytes
* ServiceAvailable-service
* UsedMemoryPercent
* YumUpdatesAvailable

Installation
------------
Presuming you already have an AWS account and an EC2 AMI running Linux:
* Install floodfx's [aws-tools](https://github.com/floodfx/aws-tools) on your server. Make sure the following environment variables are available when a metric script runs (this should be done after installing aws-tools):
	* `AWS_ACCESS_KEY_ID` - your AWS access key
	* `AWS_SECRET_ACCESS_KEY` - your AWS access key
	* `EC2_CERT` - path to your private certificate
	* `EC2_PRIVATE_KEY` - path to your private key
	* `AWS_TOOLS_HOME` - path to aws-tools
* Clone this repo somewhere on the AMI

Usage
-----
Set up a cron job to run a metric script from this repo at the desired interval. 

Here is an example of the ec2-user crontab which sends metrics. It sets environment variables from ~/.bash_profile before running a script:


	# memory stats every five minutes
	*/5 * * * * . $HOME/.bash_profile; /path/to/cloudwatch-extra-metrics/metrics/UsedMemoryPercent.sh
	*/5 * * * *  . $HOME/.bash_profile; /path/to/cloudwatch-extra-metrics/metrics/FreeMemoryMBytes.sh

	# reports a metric called ServiceAvailable-httpd
	*/5 * * * *  . $HOME/.bash_profile; /path/to/cloudwatch-extra-metrics/metrics/ServiceAvailable.sh httpd

	# yum updates status daily
	@daily . $HOME/.bash_profile; /path/to/cloudwatch-extra-metrics/metrics/YumUpdatesAvailable.sh

The ServiceAvailable metric requires password-less sudo for the user running the job (comes with the Amazon Linux ec2-user account, may not come with default user in other AMIs).