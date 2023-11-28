import yaml

provider_settings = {
    "gmail.com": {
        "valid": "true",
        "server_auth_method": 10,
        "server_hostname": "imap.gmail.com",
        "imap_port": 993,
        "socket_type": 3,
        "type": "imap",
        "smtp_auth_method": 10,
        "smtp_hostname": "smtp.gmail.com",
        "smtp_port": 465,
    },
    "web.de": {
        "valid": "true",
        "server_auth_method": None,
        "server_hostname": "imap.web.de",
        "imap_port": 993,
        "socket_type": 3,
        "type": "imap",
        "smtp_auth_method": 3,
        "smtp_hostname": "smtp.web.de",
        "smtp_port": 587,
    }
}

with open("provider.yml", "w") as file:
    yaml.dump(provider_settings, file)
    print("YAML file saved")
