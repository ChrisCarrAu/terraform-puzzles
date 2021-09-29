# NOTE: Requires Terraform 14 or above - otherwise the data block will check for the file's existence before it is created
resource "null_resource" "get_date_file" {
    provisioner "local-exec" {
      # Note that this forces writing to the file as UTF-8
      command = "Get-Date -UFormat \"%A\" | Out-File -encoding ASCII today.txt"
      interpreter = [
        "PowerShell",
        "-Command"
      ]
    }
    triggers = {
      always_run = timestamp()
    }
}

data "local_file" "date" {
    filename = "${path.module}/today.txt"
    depends_on = [
      null_resource.get_date_file
    ]
}

output "env_from_file" {
  value = trimspace(data.local_file.date.content)
}
