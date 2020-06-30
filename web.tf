resource "digitalocean_ssh_key" "default" {
    name = "Terraform Example"
    public_key = file(var.pub_key)
}
resource "digitalocean_droplet" "terraform-www-1" {
    image = "ubuntu-18-04-x64"
    name = "terraform-www-1"
    region = "sgp1"
    size = "s-1vcpu-1gb"
    private_networking = true
    ssh_keys = [digitalocean_ssh_key.default.fingerprint]
    connection {
        host = self.ipv4_address
        user = "root"
        type = "ssh"
        private_key = file(var.pvt_key)
        timeout = "2m"
    }
    provisioner "remote-exec" {
        inline = [
        "export PATH=$PATH:/usr/bin",
        # install nginx
        "sudo apt-get update",
        "sudo apt-get -y install nginx"
        ]
    }
}

resource "digitalocean_droplet" "terraform-www-2" {
    image = "ubuntu-18-04-x64"
    name = "terraform-www-2"
    region = "sgp1"
    size = "s-1vcpu-1gb"
    private_networking = true
    ssh_keys = [digitalocean_ssh_key.default.fingerprint]
    connection {
        host = self.ipv4_address
        user = "root"
        type = "ssh"
        private_key = file(var.pvt_key)
        timeout = "2m"
    }
    provisioner "remote-exec" {
        inline = [
        "export PATH=$PATH:/usr/bin",
        # install nginx
        "sudo apt-get update",
        "sudo apt-get -y install nginx"
        ]
    }
}
