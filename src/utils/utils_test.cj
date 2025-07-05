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

@Test
private class UtilsTest {
    /**
     * 纯数字和点组成的字符串
     */
    @TestCase
    func testValidateAndParse(): Unit {
        @PowerAssert(validateAndParse("1.2.3") == ArrayList<String>(["1", "2", "3"]))
        @AssertThrows[IllegalArgumentException](validateAndParse("1.2.3.4"))
    }

    @TestCase
    func testCompareStrings(): Unit {
        @PowerAssert(compareStrings("1","2") == Ordering.LT)
        @PowerAssert(compareStrings("2","1") == Ordering.GT)
        @PowerAssert(compareStrings("1","1") == Ordering.EQ)
        @PowerAssert(compareStrings("1","10") == Ordering.LT)
        @PowerAssert(compareStrings("100","2") == Ordering.GT)
        @PowerAssert(compareStrings("200","1") == Ordering.GT)

        @PowerAssert(compareStrings("a","b") == Ordering.LT)
        @PowerAssert(compareStrings("a1","a2") == Ordering.LT)
        @PowerAssert(compareStrings("a1b","a1b") == Ordering.EQ)
        @PowerAssert(compareStrings("9A","10A") == Ordering.GT)
        @PowerAssert(compareStrings("A9A","A10A") == Ordering.GT)
        @PowerAssert(compareStrings("19","1A") == Ordering.LT)
    }
}
