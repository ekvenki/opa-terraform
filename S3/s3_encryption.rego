package terraform

deny[msg] {
  resource_change := input.resource_changes[_]

  encryption_algorithm := resource_change.change.after.server_side_encryption_configuration[_].rule[_].apply_server_side_encryption_by_default[_].sse_algorithm
  encryption_algorithm := "aws:kms"
  msg : = "Bucket is not encrypted using the allowed encryption algorithm which is CMK"

}
