add_executable(MyLibTestSuite "./myLibTestSuite.c")

target_link_libraries(MyLibTestSuite MYLIB Unity)

add_test(MyLibTestSuite MyLibTestSuite)