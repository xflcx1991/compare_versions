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

package compare_versions

import std.collection.HashMap
import std.collection.collectString
import std.collection.contains

private let OPERATIONRESMAP = HashMap<String, Array<Ordering>>(
    (">", [Ordering.GT]),
    ("<", [Ordering.LT]),
    ("=", [Ordering.EQ]),
    (">=", [Ordering.GT, Ordering.EQ]),
    ("<=", [Ordering.LT, Ordering.EQ]),
    ("!=", [Ordering.LT, Ordering.GT]),
)
private let ALLOWEDOPERATIONS = OPERATIONRESMAP.keys()

/**
 * 给定两个版本号和关系比较符，返回比较结果
 * @param v1:String - 第一个版本号
 * @param v2:String - 第二个版本号
 * @param operation:String - 关系比较符
 * @returns Bool true-比较结果为真，false-比较结果为假
 */
public func compare(v1: String, v2: String, operation: String): Bool {
    // validate input operator
    assertValidOperation(operation)

    let compareRes = compareVersions(v1, v2)

    // let v: Bool
    let res = OPERATIONRESMAP.get(operation)?.contains(compareRes)

    return res ?? false
}

/**
 * 给定两个版本号和关系比较符，返回比较结果
 * @param v1:String - 第一个版本号
 * @param v2:String - 第二个版本号
 * @param operation:Ordering - 关系比较符
 * @returns Bool true-比较结果为真，false-比较结果为假
 */
private func compare(v1: String, v2: String, operation: Ordering): Bool {
    return match (operation) {
        case Ordering.EQ => compare(v1, v2, "=")
        case Ordering.GT => compare(v1, v2, ">")
        case Ordering.LT => compare(v1, v2, "<")
    }
}

/**
 * 给定关系比较符，判断是否合法，不合法抛出异常，不需要返回值
 * @param operation - First version to compare
 * @returns () 不需要返回值
 * @throws NoneValueException
 */
private func assertValidOperation(operation: String): Unit {
    if (!ALLOWEDOPERATIONS.contains(operation)) {
        throw NoneValueException(
            // >, <, =, >=, <=
            "Invalid operation: ${operation},valide operations are: " +
            "${ALLOWEDOPERATIONS |> collectString<String>(delimiter: ", ")}")
    }
}
