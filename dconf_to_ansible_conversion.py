import pprint

prefix = "/org/gnome/shell/extensions/dash-to-panel/"
tmp_setting_data = {}
input_file = "panel_settings.txt"
output_file = "panel_dict.yaml"

some_file = open(input_file, "r")
lines = some_file.readlines()

dict_output = open(output_file, "w")

for line in lines:
    line_list = line.split("=")
    setting_key = prefix + line_list[0]
    setting_value = line_list[1].strip("\n")
    tmp_setting_data[setting_key] = setting_value
    dict_output.writelines(
        "\"" +
        setting_key +
        "\": \"" +
        setting_value +
        "\"\n"
        )

pprint.pprint(tmp_setting_data)

