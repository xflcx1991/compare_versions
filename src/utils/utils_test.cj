protected package compare_versions.utils

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
}
