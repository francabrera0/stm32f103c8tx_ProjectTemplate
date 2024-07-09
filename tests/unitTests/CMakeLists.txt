add_executable(AppTests "./AppUnitTest.c")

target_link_libraries(AppTests MYLIB Unity)

add_test(AppUTs AppTests)