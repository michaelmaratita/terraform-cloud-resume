output "checksum_crc32" {
  description = "The base64-encoded, 32-bit CRC32 checksum of the object."
  value = aws_s3_object.upload_object.checksum_crc32
}

output "checksum_crc32c" {
  description = "The base64-encoded, 32-bit CRC32C checksum of the object."
  value = aws_s3_object.upload_object.checksum_crc32c
}

output "checksum_sha1" {
  description = "The base64-encoded, 160-bit SHA-1 digest of the object."
  value = aws_s3_object.upload_object.checksum_sha1
}

output "checksum_sha256" {
  description = "The base64-encoded, 256-bit SHA-256 digest of the object."
  value = aws_s3_object.upload_object.checksum_sha256
}

output "etag" {
  description = "ETag generated for the object (an MD5 sum of the object content). For plaintext objects or objects encrypted with an AWS-managed key, the hash is an MD5 digest of the object data. For objects encrypted with a KMS key or objects created by either the Multipart Upload or Part Copy operation, the hash is not an MD5 digest, regardless of the method of encryption. More information on possible values can be found on Common Response Headers."
  value = aws_s3_object.upload_object.etag
}

output "id" {
  description = "key of the resource supplied above"
  value = aws_s3_object.upload_object.id
}

output "tags_all" {
  description = "Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value = aws_s3_object.upload_object.tags_all
}

output "version_id" {
  description = "Unique version ID value for the object, if bucket versioning is enabled."
  value = aws_s3_object.upload_object.version_id
}