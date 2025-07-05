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

@Test
private class ValidateTest {
    /**
     * 纯数字和点组成的字符串
     */
    @TestCase
    func testValidate(): Unit {
        // Test case 1: Valid input
        var input1 = "1.0.0";
        @PowerAssert(validate(input1))

        input1 = "0.1.0"
        @PowerAssert(validate(input1))

        input1 = "0.0.1"
        @PowerAssert(validate(input1))

        input1 = "0.0.0"
        @PowerAssert(validate(input1))

        input1 = "1.0.0.0"
        @PowerAssert(!validate(input1))

        input1 = "0..1"
        @PowerAssert(!validate(input1))

        input1 = "..01"
        @PowerAssert(!validate(input1))

        input1 = "01.."
        @PowerAssert(!validate(input1))

        input1 = "0.1"
        @PowerAssert(!validate(input1))

        input1 = ".01"
        @PowerAssert(!validate(input1))

        input1 = "01."
        @PowerAssert(!validate(input1))

        input1 = ".0.1"
        @PowerAssert(!validate(input1))

        input1 = "0.1."
        @PowerAssert(!validate(input1))

        input1 = ".0.1."
        @PowerAssert(!validate(input1))

        input1 = "0.1.01"
        @PowerAssert(!validate(input1))

        input1 = "0.01.1"
        @PowerAssert(!validate(input1))

        input1 = "01.1.1"
        @PowerAssert(!validate(input1))

        input1 = "1.10.1"
        @PowerAssert(validate(input1))
    }

    /**
     * 带字母、数字和点组成的字符串
     */
    @TestCase
    func testValidateWithAlphabet(): Unit {
        // Test case 1: Valid input
        var input1 = "1.0.a";
        @PowerAssert(!validate(input1))

        input1 = "1.a.0"
        @PowerAssert(!validate(input1))

        input1 = "a.0.1"
        @PowerAssert(!validate(input1))

        input1 = "a.b.c"
        @PowerAssert(!validate(input1))
    }
}

// Test case 4: Invalid input (non-numeric characters)
