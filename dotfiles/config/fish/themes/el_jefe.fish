# User
function _tide_item_user
    _tide_print_item user " $USER"
end
set -U tide_user_color black
set -U tide_user_bg_color blue
set -U tide_user_icon X

# Hostname
function _tide_item_hostname
    _tide_print_item hostname " "(hostname -s)
end
set -U tide_hostname_color black
set -U tide_hostname_bg_color 62A

# Date
function _tide_item_date
    _tide_print_item date " "(date '+%m/%d/%Y')
end
set -U tide_date_color black
set -U tide_date_bg_color BBB

# MyTime
function _tide_item_mytime
    _tide_print_item mytime " "(date '+%H:%M:%S')
end
set -U tide_mytime_color black
set -U tide_mytime_bg_color 777

# Prompt Items
set -U tide_left_prompt_items os user hostname pwd git newline
set -U tide_right_prompt_items status cmd_duration mytime date