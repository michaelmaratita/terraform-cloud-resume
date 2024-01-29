variable "bucket_name" {
  description = "The name of the S3 bucket"
  type = string
}

variable "content_type" {
  description = "(Optional) Standard MIME type describing the format of the object data, e.g., application/octet-stream. All Valid MIME Types are valid for this input."
  type = string
  default = "application/octet-stream"
}

variable "etag" {
  description = "(Optional) Triggers updates when the value changes. The only meaningful value is filemd5(\"path/to/file\") (Terraform 0.11.12 or later) or $${md5(file(\"path/to/file\"))} (Terraform 0.11.11 or earlier). This attribute is not compatible with KMS encryption, kms_key_id or server_side_encryption = \"aws:kms\", also if an object is larger than 16 MB, the AWS Management Console will upload or copy that object as a Multipart Upload, and therefore the ETag will not be an MD5 digest (see source_hash instead)."
  type = string
  nullable = true
  default = null
}

variable "file_source" {
  description = "(Optional, conflicts with content and content_base64) Path to a file that will be read and uploaded as raw bytes for the object content."
  type = string
  nullable = true
  default = null
}

variable "key" {
  description = "(Required) Name of the object once it is in the bucket."
  type = string
  nullable = false
}


