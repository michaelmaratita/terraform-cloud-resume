locals {
  mime_types = jsondecode(file("${path.module}/mime.json"))
}

resource "aws_s3_bucket" "cdn_bucket" {
  bucket        = var.bucket_name

  tags = {
    Name        = var.bucket_name
    terraform   = true
  }
}

resource "aws_s3_bucket_website_configuration" "website_configuration" {
  bucket   = aws_s3_bucket.cdn_bucket.bucket

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_object" "upload_assets_images_files" {
  for_each               = fileset("${var.public_path}/css_js_files", "**")
  bucket                 = aws_s3_bucket.cdn_bucket.bucket
  key                    = "/${each.key}"
  source                 = "${var.public_path}/css_js_files/${each.value}"
  content_type           = lookup(local.mime_types, regex("\\.[^.]+$", each.value), "text/html")
  etag                 = filemd5("${var.public_path}/css_js_files/${each.key}")

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_s3_object" "upload_pdfs" {
  for_each               = fileset("${var.public_path}/files", "**")
  bucket                 = aws_s3_bucket.cdn_bucket.bucket
  key                    = "/${each.key}"
  source                 = "${var.public_path}/files/${each.value}"
  content_type           = "application/pdf"
  etag                 = filemd5("${var.public_path}/files/${each.key}")

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_s3_object" "upload_html" {
  for_each               = fileset("${var.public_path}/html_files", "**")
  bucket                 = aws_s3_bucket.cdn_bucket.bucket
  key                    = "/${each.key}"
  source                 = "${var.public_path}/html_files/${each.value}"
  content_type           = "text/html"
  etag                 = filemd5("${var.public_path}/html_files/${each.key}")

  lifecycle {
    create_before_destroy = true
  }
}