  dynamic "tag" {
    for_each = var.tags 
   content {
    key = tag.value.key
    value = tag.value.value
    propagate_at_launch = tag.value.propagate_at_launch
   }
  }