package terraform

deny [msg] {
  resource_change := input.resource_changes[_]

  resource_change.change.after.acl != "private"
  msg := "Bucket is not private"
}
