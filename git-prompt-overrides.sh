Time12a="\$(date +%H:%M)"

# Configuration
GIT_PROMPT_SHOW_UNTRACKED_FILES="all"
GIT_PROMPT_IGNORE_STASH="1"

# Pre- and post-status prompt strings
GIT_PROMPT_COMMAND_FAIL="${ResetColor} ${RedBg}${BrightWhite} ✘-_LAST_COMMAND_STATE_ ${ResetColor}"
GIT_PROMPT_COMMAND_OK=""
GIT_PROMPT_START_USER="_LAST_COMMAND_INDICATOR_"
GIT_PROMPT_START_ROOT="${GIT_PROMPT_START_ROOT}"
GIT_PROMPT_END_USER="${ResetColor} ${BoldWhite}${Time12a}${BoldGreen} $ ${ResetColor}"
GIT_PROMPT_END_ROOT="${ResetColor} ${BoldWhite}${Time12a}${BoldRed} # ${ResetColor}"

# Individual overrides
GIT_PROMPT_BRANCH="${DimBlueBg}${BoldWhite}"
GIT_PROMPT_CHANGED="${DimBlueBg}${BoldYellow} ~"
GIT_PROMPT_CLEAN=""
GIT_PROMPT_CONFLICTS="${DimBlueBg}${BoldRed} ×"
GIT_PROMPT_PREFIX="${DimBlueBg}${BrightWhite}   "
GIT_PROMPT_REMOTE="${DimBlueBg}"
GIT_PROMPT_SEPARATOR=""
GIT_PROMPT_STAGED="${DimBlueBg}${BoldGreen} ±"
GIT_PROMPT_SUFFIX="${DimBlueBg}${DimBlueBg} "
GIT_PROMPT_UNTRACKED="${DimBlueBg}${BoldYellow} +"
GIT_PROMPT_VIRTUALENV=" ${DimGreenBg}${BoldWhite} _VIRTUALENV_ ${ResetColor}"

# Symbols
GIT_PROMPT_SYMBOLS_AHEAD="${BoldBlue}  "
GIT_PROMPT_SYMBOLS_BEHIND="${BoldBlue}  "
GIT_PROMPT_SYMBOLS_NO_REMOTE_TRACKING="${DimBlueBg}${BoldBlue} ⁜ ${ResetColor}"
GIT_PROMPT_SYMBOLS_PREHASH=":"
