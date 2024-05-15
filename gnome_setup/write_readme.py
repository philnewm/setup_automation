# write_messages.py

from jinja2 import Environment, FileSystemLoader

import yaml

with open("../extensions/molecule/gnome_setup_test/molecule.yml", "r") as file:
    # TODO test other loader classes https://realpython.com/python-yaml/#historical-context
    molecule_config = yaml.load(file, yaml.CBaseLoader)

vm_list = molecule_config["platforms"]

with open("./defaults/main/extensions.yml", "r") as file:
    # TODO test other loader classes https://realpython.com/python-yaml/#historical-context
    extensions = yaml.load(file, yaml.CBaseLoader)

extension_list = extensions["gnome_extensions"]

with open("./defaults/main/themes.yml", "r") as file:
    # TODO test other loader classes https://realpython.com/python-yaml/#historical-context
    themes = yaml.load(file, yaml.CBaseLoader)

theme_list = themes["gnome_themes"]

# with open("../extensions/molecule/gnome_setup_test/converge.yml", "r"):
    # TODO get task content for setting up role
dconf = "[dconf](https://wiki.gnome.org/Projects/dconf)"

# for extensions in molecule_config['platforms']:
#     print(extensions['name'])

environment = Environment(loader=FileSystemLoader("templates/"))
results_filename = "readme.test"
results_template = environment.get_template("README_template.j2")
context = {
    "dconf": dconf,
    "vm_list": vm_list,
    "extension_list": extension_list,
    "theme_list": theme_list,
}

with open(results_filename, mode="w", encoding="utf-8")as message:
    message.write(results_template.render(context))
    print(f"wrote {results_filename}")
