import re
import subprocess


def get_battery_cells() -> list:
    # pmset = subprocess.run(["/usr/bin/pmset", "-g" "batt"], capture_output=True, text=True, check=True)
    pmset = subprocess.run(["/usr/bin/pmset", "-g", "batt"], capture_output=True, text=True, check=True)
    pmsetResult = pmset.stdout
    status = re.search(r"Battery Power|AC Power", pmsetResult)
    # status = pmsetSearch.group()
    pmsetSearchBatt = re.search(r"\((id=\d+)\)\t+(\d+)%", pmsetResult)
    percent = int(pmsetSearchBatt.group(2))
    print(status)
    print(percent)
    # if status == "AC Power":
    #     # TODO: declare the lambda once and don't repeat the code
    #     icon_color = UNPLUGGED_COLORS[
    #         min(UNPLUGGED_COLORS.keys(), key=lambda x: abs(x - percent))
    #     ]
    #     icon = UNPLUGGED_ICONS[
    #         min(UNPLUGGED_ICONS.keys(), key=lambda x: abs(x - percent))
    #     ]
    # elif status == "Battery Power":
    #     icon_color = UNPLUGGED_COLORS[
    #         min(UNPLUGGED_COLORS.keys(), key=lambda x: abs(x - percent))
    #     ]
    #     icon = PLUGGED_ICONS[
    #         min(PLUGGED_ICONS.keys(), key=lambda x: abs(x - percent))
    #     ]
    # else:
    #     icon_color = PLUGGED_COLORS[
    #         min(PLUGGED_COLORS.keys(), key=lambda x: abs(x - percent))
    #     ]
    #     icon = PLUGGED_ICONS[
    #         min(PLUGGED_ICONS.keys(), key=lambda x: abs(x - percent))
    #     ]
    # percent_cell = (bat_text_color, str(percent) + "% ")
    # icon_cell = (icon_color, icon)
    # return [percent_cell, icon_cell]
    return []
    # except FileNotFoundError:
    #     return []


get_battery_cells()
