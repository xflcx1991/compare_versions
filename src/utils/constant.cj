protected package compare_versions.utils

import std.regex.Regex

protected let VALIDREGEXSTR = ###"^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)$"###
protected let VALIDREGEX = Regex(VALIDREGEXSTR)
