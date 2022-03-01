package terraform

deny[msg] {
  resource_change := input.resource_changes[_]
  resource_change.change.after.tags[_] == null
  msg := "Bucket does not have tags"
}
