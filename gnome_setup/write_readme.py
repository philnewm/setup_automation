import os
import yaml

from jinja2 import Environment, FileSystemLoader
try:
    from yaml import CSafeLoader as SafeLoader
except ImportError:
    from yaml import SafeLoader

# hardcoded values
dconf = "[dconf](https://wiki.gnome.org/Projects/dconf)"
test_env_path = "`extensions/molecule/gnome_setup_test`"

# dynamic values
# TODO loop through data files
with open("../extensions/molecule/gnome_setup_test/molecule.yml", "r") as file:
    molecule_config = yaml.load(file, yaml.CSafeLoader)

vm_list = [distro["name"] for distro in molecule_config["platforms"]]

with open("./defaults/main/extensions.yml", "r") as file:
    extensions = yaml.load(file, SafeLoader)

extension_list = extensions["gnome_extensions"]

with open("./defaults/main/themes.yml", "r") as file:
    themes = yaml.load(file, yaml.CSafeLoader)

theme_list = themes["gnome_themes"]

with open("../extensions/molecule/gnome_setup_test/converge.yml", "rt") as file:
    yaml_content = yaml.load(file, yaml.CSafeLoader)

role_present = f"---\n\n{yaml.dump(yaml_content[0], Dumper=yaml.CSafeDumper, indent=2, sort_keys=False)}\n..."

with open("./vars/main.yml", "rt") as file:
    vars_content = yaml.load(file, yaml.CSafeLoader)

global_dependencies = vars_content["dependencies"]
print(theme_list)

def generate_tree_visualization(base_path, prefix=""):
    tree_visualization = []
    items = sorted(os.listdir(base_path))
    pointers = ['┣ ' for _ in items[:-1]] + ['┗ ']

    for pointer, item in zip(pointers, items):
        path = os.path.join(base_path, item)
        if os.path.isdir(path):
            tree_visualization.append(f"{prefix}{pointer}📂 {item}")
            extension = '┃ ' if pointer == '┣ ' else '  '
            tree_visualization.extend(generate_tree_visualization(path, prefix + extension))
        else:
            tree_visualization.append(f"{prefix}{pointer}📜 {item}")
    
    return tree_visualization

root_dir = "/home/dev_test/setup_automation/gnome_setup"
tree_visualization = generate_tree_visualization(root_dir)
tree_text = "\n ".join(tree_visualization)
dir_structure = f"📦 {os.path.basename(root_dir)}\n {os.path.basename(tree_text)}\n"

# output file
environment = Environment(loader=FileSystemLoader("templates/"))
results_filename = "readme_test.md"
results_template = environment.get_template("README_template.j2")
context = {
    "dconf": dconf,
    "vm_list": vm_list,
    "dir_structure": dir_structure,
    "test_env_path": test_env_path,
    "extension_list": extension_list,
    "theme_list": theme_list,
    "role_present": role_present,
    "global_dependencies": global_dependencies
}

with open(results_filename, mode="w", encoding="utf-8") as message:
    message.write(results_template.render(context))
    print(f"wrote {results_filename}")
