import configparser
import pprint

default_config = configparser.ConfigParser()
default_config.read("gnome_config.ini")

custom_config_path = "/mnt/Projects/coding/config/gnome/custom/gnome_basics_config.yml"
custom_config = configparser.ConfigParser()
custom_config.read(custom_config_path)

pprint.pprint(default_config.sections)


def traverse_and_apply_changes_iterative(default_data, changes_data):
    pass
    
    # stack = [(default_data, changes_data)]

    # while stack:
    #     default_item, changes_item = stack.pop()

    #     for key, value in changes_item.items():
    #         if key in default_item:
    #             if isinstance(value, dict) and isinstance(default_item[key], dict):
    #                 stack.append((default_item[key], value))
    #             elif isinstance(value, list) and isinstance(default_item[key], list):
    #                 # Handle the case when the value is a list
    #                 default_item[key].extend(value)
    #             else:
    #                 # Update the value for other types
    #                 default_item[key] = value
    #         else:
    #             # Handle new keys in changes_data not present in default_data
    #             default_item[key] = value
