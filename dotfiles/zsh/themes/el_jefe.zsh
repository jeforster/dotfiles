# Font
POWERLEVEL9K_MODE="nerdfont-complete"

# Elements
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon user context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs custom_history time custom_date)

# Line Settings
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_FOREGROUND=244
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR="·"
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{244}╭─"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{244}╰─"
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_SUFFIX="%F{244}─╮"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_SUFFIX="%F{244}─╯"

# Seperators and Symbols
POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL="\uE0B2"
POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL="\uE0B0"

# OS
POWERLEVEL9K_OS_ICON_FOREGROUND="black"
POWERLEVEL9K_OS_ICON_BACKGROUND="white"

# User
POWERLEVEL9K_ALWAYS_SHOW_USER=true
POWERLEVEL9K_USER_ICON="\uF2BD"
POWERLEVEL9K_USER_DEFAULT_FOREGROUND="black"
POWERLEVEL9K_USER_DEFAULT_BACKGROUND="cyan"

# Context
POWERLEVEL9K_CONTEXT_TEMPLATE="\uF108 %m"
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="black"
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="magenta"

# Dir
POWERLEVEL9K_DIR_BACKGROUND="025"
POWERLEVEL9K_DIR_FOREGROUND="black"
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_unique"

# Status
POWERLEVEL9K_STATUS_OK="true"
POWERLEVEL9K_STATUS_CROSS="false"
POWERLEVEL9K_STATUS_VERBOSE="true"
POWERLEVEL9K_STATUS_OK_BACKGROUND='236'
POWERLEVEL9K_STATUS_OK_FOREGROUND='green'
POWERLEVEL9K_STATUS_ERROR_BACKGROUND='236'
POWERLEVEL9K_STATUS_ERROR_FOREGROUND='red'

# History
POWERLEVEL9K_CUSTOM_HISTORY='echo -e "\uf1da 265"'
POWERLEVEL9K_CUSTOM_HISTORY_BACKGROUND="245"
POWERLEVEL9K_CUSTOM_HISTORY_FOREGROUND="black"

# Time
POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M:%S}"
POWERLEVEL9K_TIME_ICON=""
POWERLEVEL9K_TIME_BACKGROUND='250'
POWERLEVEL9K_TIME_FOREGROUND='black'

# Date
POWERLEVEL9K_CUSTOM_DATE='echo -e "\uf073  `date +%D`"'
POWERLEVEL9K_CUSTOM_DATE_BACKGROUND="white"
POWERLEVEL9K_CUSTOM_DATE_FOREGROUND="black"

zplug "romkatv/powerlevel10k", as:theme, depth:1