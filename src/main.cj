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

import std.regex.*

main(): Unit {

    // println(r2)
    let a = ##"^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)$"##
    let r1 = Regex(a)
    match (r1.matches("1.20.3")) {
        case Some(r) => println(r.matchStr())
        case None => println("None")
    }
    // let r2 = Regex("ab", RegexOption().ignoreCase())
    // match (r1.matches("aB")) {
    //     case Some(r) => println(r.matchStr())
    //     case None => println("None")
    // }
    // match (r2.matches("aB")) {
    //     case Some(r) => println(r.matchStr())
    //     case None => println("None")
    // }
}
