# write_messages.py

from jinja2 import Environment, FileSystemLoader

import yaml

with open("defaults/main/extensions.yml", "r") as file:
        yaml_content = yaml.safe_load(file)

for extensions in yaml_content['gnome_extensions']:
    print(extensions['name'])

# print(extensions_content.)

dconf = "[dconf](https://wiki.gnome.org/Projects/dconf)"
extensions = []



# environment = Environment(loader=FileSystemLoader("templates/"))
# results_filename = "students_results.html"
# results_template = environment.get_template("results.html")
# context = {
#     "students": students,
#     "test_name": test_name,
#     "max_score": max_score,
# }


# with open(results_filename, mode="w", encoding="utf-8")as message:
#     message.write(results_template.render(context))
#     print(f"wrote {results_filename}")
