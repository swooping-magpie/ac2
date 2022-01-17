cmake_minimum_required(VERSION 3.14)

include(cmake/prelude.cmake)

project(
    aho-corasick2
    VERSION 0.1.0
    DESCRIPTION "Short description"
    HOMEPAGE_URL "https://example.com/"
    LANGUAGES CXX
)

docs_early_return()

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# ---- Declare library ----

add_library(
    aho-corasick2_lib OBJECT
    source/lib.cpp
)

target_include_directories(
    aho-corasick2_lib ${warning_guard}
    PUBLIC
    "$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/source>"
)

target_compile_features(aho-corasick2_lib PUBLIC cxx_std_17)

# ---- Declare executable ----

add_executable(aho-corasick2_exe source/main.cpp)
add_executable(aho-corasick2::exe ALIAS aho-corasick2_exe)

set_target_properties(
    aho-corasick2_exe PROPERTIES
    OUTPUT_NAME aho-corasick2
    EXPORT_NAME exe
)

target_compile_features(aho-corasick2_exe PRIVATE cxx_std_17)

target_link_libraries(aho-corasick2_exe PRIVATE aho-corasick2_lib)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Developer mode ----

if(NOT aho-corasick2_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of aho-corasick2"
  )
endif()

include(cmake/dev-mode.cmake)
