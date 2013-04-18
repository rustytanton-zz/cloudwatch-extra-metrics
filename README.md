Amazon Cloudwatch Extra Metrics for Linux AMIs
==============================================

Provides these Cloudwatch metrics which are not available in Amazon's "Detailed Monitoring" for EC2 instances by default:

* FreeMemoryMBytes
* UsedMemoryPercent

Installation
------------
Presuming you already have an AWS account and an EC2 AMI running Linux:
* Install floodfx's [aws-tools](https://github.com/floodfx/aws-tools) on your server
* Clone this repo somewhere on the AMI

Usage
-----
Set up a cron job to run a metric script from this repo at the desired interval
