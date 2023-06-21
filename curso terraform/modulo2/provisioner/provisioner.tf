resource "null_resource" "processospowershell" {
  provisioner "local-exec" {
    command     = "get-process > lista.txt"
    interpreter = ["powershell", "-command"]
  }
}