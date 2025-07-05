/* cjlint-ignore -start !G.OTH.03  suppress this stupid warning */
/**
 * Copyright (c) 2024 xffish(xffish#126.com)
 * terminalcolor is licensed under Mulan PSL v2.
 * You can use this software according to the terms and conditions of the Mulan PSL v2.
 * You may obtain a copy of Mulan PSL v2 at:
 *          https://license.coscl.org.cn/MulanPSL2
 * THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
 * EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
 * MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
 * See the Mulan PSL v2 for more details.
 */
/* cjlint-ignore -end suppress this stupid warning */

internal package compare_versions.utils

import std.collection.ArrayList
import std.convert.Parsable
import std.math
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

    let arr = VALIDREGEX.find(version,group: true)
    let resultList = ArrayList<String>()

    match (arr) {
        case Some(r) =>
            if (r.groupCount() > 0) {
                for (i in 1..=r.groupCount()) {
                    resultList.add(r.matchString(i))
                }
            } else {
                // 还能到这里？
                throw IllegalArgumentException(
                    "Not valid semantic version: ${version} received,groupCount() = ${r.groupCount()}")
            }
        case None => println("None")
    }
    return resultList
}

/**
 * 比较两个版本号大小
 * 不再做 validate 验证，调用者要自己保证先校验合法版本号
 * @param v1
 * @param v2
 * @return -1: v1 < v2; 0: v1 = v2; 1: v1 > v2
 */
protected func compareSegments(v1: ArrayList<String>, v2: ArrayList<String>): Ordering {
    let loopCeil = max(v1.size, v2.size)

    for (i in 0..loopCeil) {
        let r = compareStrings(v1.get(i) ?? "0", v2.get(i) ?? "0")
        if (r != Ordering.EQ) {
            return r
        }
    }
    return Ordering.EQ
}

/**
 * 比较两个片段字符串大小，比如 1.2.3 和 1.2.4中传进来比较 1和1 2和2 3和4
 * 考虑纯数字和字母混合情况（虽然现在不支持字母，但是提前准备好支持）
 * @param s1
 * @param s2
 * @return 0: 相等; 1: s1 > s2; -1: s1 < s2
 */
internal func compareStrings(s1: String, s2: String): Ordering {
    // 暂时不考虑通配符

    let a1: ?Int64 = Int64.tryParse(s1)
    let a2: ?Int64 = Int64.tryParse(s2)

    let result: Ordering

    match ((a1, a2)) {
        case (Some(n1), Some(n2)) => // 如果两个参数都是纯数字
            result = n1.compare(n2)
        case _ => // 如果两个参数中有一个不是纯数字，则比较字符串
            result = s1.compare(s2)
    }
    return result
}
