provider "digitalocean" {
    token = "${var.digitalocean_token}"
}

# Create a new Web Droplet running ubuntu in the FRA1 region
resource "digitalocean_droplet" "terraform" {
    image  = "ubuntu-14-04-x64"
    name   = "terrform-droplet"
    region = "fra1"
    size   = "1gb"
}

# Create a new domain 
resource "digitalocean_domain" "terraform" {
    name = "asdfas5566.com"
    ip_address = "${digitalocean_droplet.terraform.ipv4_address}"
}

# Add a record to the domain
resource "digitalocean_record" "scotch" {
    domain = "${digitalocean_domain.terraform.name}"
    type = "CNAME"
    name = "terrraform-scotch"
    value =  "skyrunonline.com."
}
