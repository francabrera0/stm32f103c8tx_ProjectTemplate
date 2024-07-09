add_executable(MyLib2TestSuite "./myLib2TestSuite.c")

target_link_libraries(MyLib2TestSuite MYLIB2 Unity)

add_test(MyLib2TestSuite MyLib2TestSuite)