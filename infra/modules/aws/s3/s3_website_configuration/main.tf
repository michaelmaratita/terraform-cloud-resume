data "aws_iam_policy_document" "bucket_policy" {
  statement {
    sid = var.sid
    effect = "Allow"

    principals {
      type = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    actions = [
      "s3:GetObject"
    ]
    
    resources = var.resource

    condition {
      test = "StringEquals"
      variable = "AWS:SourceArn"
      values = [ var.cloudfront_distribution_arn ]
    }
  }
}

resource "aws_s3_bucket_website_configuration" "website_configuration" {
  bucket   = var.bucket_name

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = var.bucket_name
  policy = data.aws_iam_policy_document.bucket_policy.json
}