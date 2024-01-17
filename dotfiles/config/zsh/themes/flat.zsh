# Font
POWERLEVEL9K_MODE="nerdfont-complete"

# Elements
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon user context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs custom_history time custom_date)

# Line Settings
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_FOREGROUND=244
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_BACKGROUND=
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR="·"
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="❯ "
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_SUFFIX=
POWERLEVEL9K_MULTILINE_LAST_PROMPT_SUFFIX=

# Global Defaults
if [ $(( RANDOM % 2 )) -eq 0 ]; then # Light
  POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='%235F\uE0B1'
  POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='%235F\uE0B3'
  POWERLEVEL9K_BACKGROUND="240"
  POWERLEVEL9K_FOREGROUND="black"
else # Dark
  POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='%244F\uE0B1'
  POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='%244F\uE0B3'
  POWERLEVEL9K_BACKGROUND="237"
  POWERLEVEL9K_FOREGROUND="white"
fi

# User
POWERLEVEL9K_ALWAYS_SHOW_USER=true
POWERLEVEL9K_USER_ICON="\uF2BD"
POWERLEVEL9K_USER_DEFAULT_FOREGROUND="magenta"

# Context
POWERLEVEL9K_CONTEXT_TEMPLATE="\uF108 %m"
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="cyan"

# Dir
POWERLEVEL9K_DIR_FOREGROUND="026"
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_unique"

# VCS
POWERLEVEL9K_VCS_FOREGROUND="black"
POWERLEVEL9K_VCS_CLEAN_FOREGROUND="lightgreen"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="lightyellow"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="lightyellow"

# Status
POWERLEVEL9K_STATUS_OK="true"
POWERLEVEL9K_STATUS_CROSS="false"
POWERLEVEL9K_STATUS_VERBOSE="true"

# History
POWERLEVEL9K_CUSTOM_HISTORY='echo -e "\uf1da 265"'

# Time
POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M:%S}"
POWERLEVEL9K_TIME_ICON=""

# Date
POWERLEVEL9K_CUSTOM_DATE='echo -e "\uf073 `date +%D`"'

zplug "romkatv/powerlevel10k", as:theme, depth:1