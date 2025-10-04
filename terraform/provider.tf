terraform {
  required_version = ">= 0.13.0"

  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "3.0.2-rc04"
    }
  }
}

variable "proxmox_api_url" {
  type = string
}

variable "proxmox_api_token_id" {
  type = string
  sensitive = true
}

variable "proxmox_api_token_secret" {
  type = string
  sensitive = true
}

provider "proxmox" {
  pm_api_url = var.proxmox_api_url
  pm_api_token_id = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret

  #Skips SSL cert check. Set this to true for self-signed certs that aren't trusted by the client running terraform.
  pm_tls_insecure = true
}

variable "ssh_pubkey" {
  type = string
}

variable "ciuser" {
  type = string
}

variable "cipassword" {
  type = string
  sensitive = true
}

variable "vms" {
  type = map(object({
    node     = string
    ip       = string
    id       = string
    hostname = string
  }))
}

variable "nameserver" {
  type = string
}

variable "gateway" {
  type = string
}

variable "ssh_private_key_path" {
  type = string
}