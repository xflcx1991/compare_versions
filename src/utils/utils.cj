protected package compare_versions.utils

import std.collection.ArrayList
/**
 * Validate and parse a semantic version string.
 *
 * @param String 待解析的版本字符串
 * @return  ArrayList<String> 分组后的结果
 * @throws IllegalArgumentException if the version string is not valid
 */
protected func validateAndParse(version: String): ArrayList<String> {
    let matchResult = validate(version)
    if (!matchResult) {
        throw IllegalArgumentException("Not valid semantic version: ${version} received")
    }

    let arr = VALIDREGEX.matches(version)
    let resultList = ArrayList<String>()

    match (arr) {
        case Some(r) =>
            // println("groupNum : ${r.groupNumber()}")
            if (r.groupNumber() > 0) {
            for (i in 1..=r.groupNumber()) {
                // println("group ${i} : ${r.matchStr(i)}")
                resultList.append(r.matchStr(i))
                // let pos = r.matchPosition(i)
                // println("position : [${pos.start}, ${pos.end})")
            }
        } else {
            // 还能到这里？
            throw IllegalArgumentException(
                "Not valid semantic version: ${version} received,groupNumber() = ${r.groupNumber()}")
        }
        case None => println("None")
    }
    return resultList
}
