protected package compare_versions.utils

@Test
private class ConstantTest {
    /**
     * 纯数字和点组成的字符串
     */
    @TestCase
    func testConstant(): Unit {
        let a = ##"^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)$"##
        @PowerAssert(VALIDREGEXSTR == a)
    }
}
