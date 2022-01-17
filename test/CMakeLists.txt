# Parent project does not export its library target, so this CML implicitly
# depends on being added from it, i.e. the testing is done only from the build
# tree and is not feasible from an install location

project(aho-corasick2Tests LANGUAGES CXX)

add_executable(aho-corasick2_test source/aho-corasick2_test.cpp)
target_link_libraries(aho-corasick2_test PRIVATE aho-corasick2_lib)
target_compile_features(aho-corasick2_test PRIVATE cxx_std_17)

add_test(NAME aho-corasick2_test COMMAND aho-corasick2_test)

add_folders(Test)
