resource "null_resource" "validator" {
  provisioner "local-exec" {
    // TODO: generate that number 10
    command = "${length(var.events) > 10 ? "exit 1" : ""}"
  }

  triggers {
    timestamp = "${timestamp()}"
  }
}
