#include <unity.h>
#include <mylib2.h>

void setUp(void) {} /* Is run before every test, put unit init calls here. */

void tearDown(void) {} /* Is run after every test, put unit clean-up calls here. */

void test_sum(void) 
{
    TEST_ASSERT_EQUAL(0, sub(10, 10));
    TEST_ASSERT_EQUAL(40, sub(50, 10));
}

void test_sum2(void)
{
    TEST_ASSERT_EQUAL(1, sub(16, 15));
}

int main()
{
    UNITY_BEGIN();

    RUN_TEST(test_sum);
    RUN_TEST(test_sum2);

    return UNITY_END();
}