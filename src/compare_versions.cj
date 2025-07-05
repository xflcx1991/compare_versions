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

import compare_versions.utils.validateAndParse
import compare_versions.utils.compareSegments
import std.regex.Regex
/**
 * Compare [semver](https://semver.org) version strings to find greater, equal or lesser. // cjlint-ignore !G.OTH.03 suppress this warning
 * This library supports the full semver specification, including comparing versions with different number of digits like `1.0.0`, `1.0`, `1`, and pre-release versions like `1.0.0-alpha`.
 * @param v1 - First version to compare
 * @param v2 - Second version to compare
 * @returns -1 if v1 is less than v2, 0 if they are equal, 1 if v1 is greater than v2
 * @throws IllegalArgumentException if the version string is not valid
 */
public func compareVersions(v1: String, v2: String): Ordering {
    // 合法版本号字符串解析后的分组
    let n1 = validateAndParse(v1)
    let n2 = validateAndParse(v2)

    // validate numbers
    let r: Ordering = compareSegments(n1, n2)

    // validate pre-release
    // 以后再说，现在的版本号标准里没有pre-release和build info

    return r
}
