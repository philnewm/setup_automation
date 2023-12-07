import yaml
import xml.etree.ElementTree as ET

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

def parse_dict_to_yaml(provider_settings):
    with open("provider.yml", "w") as file:
        yaml.dump(provider_settings, file)
        print("YAML file saved")
    
def parse_xml_to_yaml(file_path):
    tree = ET.parse(file_path)
    root = tree.getroot()
    
    data = {}
    for group in root.findall('./group'):
        group_name = group.get('name')
        data[group_name] = {}
        for option in group.findall('./option'):
            key = option.get('key')
            value = option.get('value')
            data[group_name][key] = value
    
    return data

# Write YAML data to a file
input_path = "/home/mainws/Documents/player.cfg"
output_path = "/home/mainws/Documents/player.yaml"
data = parse_xml_to_yaml(input_path)
with open(output_path, 'w') as yaml_file:
    yaml.dump(data, yaml_file, default_flow_style=False)



