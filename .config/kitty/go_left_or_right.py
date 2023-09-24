from typing import List

from kitty.boss import Boss
from kittens.tui.handler import result_handler


def main(args: List[str]) -> None:
    pass

@result_handler(no_ui=True)
def handle_result(args: List[str], answer: str, target_window_id: int, boss: Boss) -> None:
    if len(args) != 2:
        return
    direction = args[1]
    if direction not in ('left', 'right'):
        return

    tm = boss.active_tab_manager
    tab = boss.active_tab
    if tm is None or tab is None:
        return

    neighbor = tab.neighboring_group_id(direction)
    if neighbor is not None:
        tab.windows.set_active_group(neighbor)
    elif len(tm.tabs) > 1:
        if direction == 'left':
            boss.previous_tab()
        else:
            boss.next_tab()
