```
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "S3AccessForTerraformDev",
			"Effect": "Allow",
			"Action": [
				"*"
			],
			"Resource": [
				"arn:aws:s3:::dev-*",
				"arn:aws:s3:::dev-*/*"
			]
		},
		{
			"Sid": "DynamoDBAccessForTerraformDev",
			"Effect": "Allow",
			"Action": [
				"dynamodb:CreateTable",
				"dynamodb:DeleteTable",
				"dynamodb:DescribeTable",
				"dynamodb:PutItem",
				"dynamodb:GetItem",
				"dynamodb:DeleteItem",
				"dynamodb:Scan",
				"dynamodb:Query",
				"dynamodb:UpdateItem",
				"dynamodb:DescribeContinuousBackups",
				"dynamodb:UpdateContinuousBackups",
				"dynamodb:DescribeTimeToLive",
				"dynamodb:UpdateTimeToLive",
				"dynamodb:ListTagsOfResource",
				"dynamodb:TagResource"
			],
			"Resource": "arn:aws:dynamodb:us-east-1:<ACCOUNT_ID>:table/dev-*"
		},
		{
			"Sid": "CloudWatchLogsDev",
			"Effect": "Allow",
			"Action": [
				"logs:CreateLogGroup",
				"logs:CreateLogStream",
				"logs:PutLogEvents",
				"logs:DescribeLogGroups",
				"logs:DescribeLogStreams"
			],
			"Resource": "*"
		},
		{
			"Sid": "IAMPassRoleDev",
			"Effect": "Allow",
			"Action": [
				"iam:PassRole"
			],
			"Resource": "*"
		},
		{
			"Sid": "CloudFrontAccessDev",
			"Effect": "Allow",
			"Action": [
				"cloudfront:CreateDistribution",
				"cloudfront:UpdateDistribution",
				"cloudfront:GetDistribution",
				"cloudfront:DeleteDistribution",
				"cloudfront:ListDistributions",
				"cloudfront:GetDistributionConfig",
				"cloudfront:CreateInvalidation",
				"cloudfront:CreateCloudFrontOriginAccessIdentity",
				"cloudfront:GetCloudFrontOriginAccessIdentity",
				"cloudfront:DeleteCloudFrontOriginAccessIdentity",
				"cloudfront:TagResource",
				"cloudfront:ListTagsForResource"
			],
			"Resource": "*"
		}
	]
}
```

```

```
