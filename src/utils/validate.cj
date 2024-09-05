protected package compare_versions.utils

public func validate(version: String): Bool {
    let regex = VALIDREGEX
    match (regex.matches(version)) {
        case Some(_) => true
        case None => false
    }
}
