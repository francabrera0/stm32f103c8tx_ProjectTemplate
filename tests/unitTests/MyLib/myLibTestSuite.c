#include <unity.h>
#include <mylib.h>

void setUp(void) {} /* Is run before every test, put unit init calls here. */

void tearDown(void) {} /* Is run after every test, put unit clean-up calls here. */

void test_sum(void) 
{
    TEST_ASSERT_EQUAL(21, add(10, 10));
    TEST_ASSERT_EQUAL(60, add(50, 10));
}

void test_sum2(void)
{
    TEST_ASSERT_EQUAL(30, add(15, 15));
}

int main()
{
    UNITY_BEGIN();

    RUN_TEST(test_sum);
    RUN_TEST(test_sum2);

    return UNITY_END();
}