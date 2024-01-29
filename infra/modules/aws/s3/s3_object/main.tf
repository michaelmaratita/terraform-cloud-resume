resource "aws_s3_object" "upload_object" {
  bucket       = var.bucket_name
  key          = var.key
  source       = var.file_source
  content_type = var.content_type
  etag         = var.etag
}