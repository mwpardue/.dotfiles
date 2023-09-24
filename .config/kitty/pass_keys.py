import re
# from typing import List
# from kitty.boss import Boss
from kittens.tui.handler import result_handler
from kitty.key_encoding import KeyEvent, parse_shortcut


def is_window_vim(window, vim_id):
    fp = window.child.foreground_processes
    return any(re.search(vim_id, p['cmdline'][0] if len(p['cmdline']) else '', re.I) for p in fp)


def encode_key_mapping(window, key_mapping):
    mods, key = parse_shortcut(key_mapping)
    event = KeyEvent(
        mods=mods,
        key=key,
        shift=bool(mods & 1),
        alt=bool(mods & 2),
        ctrl=bool(mods & 4),
        super=bool(mods & 8),
        hyper=bool(mods & 16),
        meta=bool(mods & 32),
    ).as_window_system_event()

    return window.encoded_key(event)


def main():
    pass


@result_handler(no_ui=True)
def handle_result(args, result, target_window_id, boss):
    tm = boss.active_tab_manager
    tab = boss.active_tab
    window = boss.window_id_map.get(target_window_id)
    direction = args[2]
    key_mapping = args[3]
    neighbor = tab.neighboring_group_id(direction)
    vim_id = args[4] if len(args) > 4 else "n?vim"
    fp = window.child.foreground_processes
    # print("TM")
    # print(tm)
    # print("TAB")
    # print(tab)
    # print("WINDOW")
    # print(window)
    # print("DIRECTION")
    # print(direction)
    # print("KEY MAPPING")
    # print(key_mapping)
    # print("NEIGHBOR")
    # print(neighbor)
    # print("VIM ID")
    # print(vim_id)
    # print("FP")
    # print(fp)

    # if window is None:
    #     return
    if is_window_vim(window, vim_id):
        encoded = encode_key_mapping(window, key_mapping)
        window.write_to_child(encoded)
    if neighbor is None and not is_window_vim(window, vim_id):
        if direction == 'left':
            boss.previous_tab()
        elif direction == 'right':
            boss.next_tab()
        else:
            boss.active_tab.neighboring_window(direction)
            return
    elif neighbor is not None and not is_window_vim(window, vim_id):
        boss.active_tab.neighboring_window(direction)
    # else:
    #     boss.active_tab.neighboring_window(direction)
