def main():
    pass


def handle_result(args, result, target_window_id, boss):
    tab = boss.active_tab
    direction = args[1]
    neighbor = tab.neighboring_group_id(direction)
    if neighbor is None:
        if direction == 'left':
            boss.previous_tab()
        elif direction == 'right':
            boss.next_tab()
    else:
        boss.active_tab.neighboring_window(direction)
        return


handle_result.no_ui = True
