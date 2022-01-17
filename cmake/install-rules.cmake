if(PROJECT_IS_TOP_LEVEL)
  set(CMAKE_INSTALL_INCLUDEDIR include/aho-corasick2 CACHE PATH "")
endif()

include(CMakePackageConfigHelpers)
include(GNUInstallDirs)

# find_package(<package>) call for consumers to find this project
set(package aho-corasick2)

install(
    TARGETS aho-corasick2_exe
    EXPORT aho-corasick2Targets
    RUNTIME COMPONENT aho-corasick2_Runtime
)

write_basic_package_version_file(
    "${package}ConfigVersion.cmake"
    COMPATIBILITY SameMajorVersion
)

# Allow package maintainers to freely override the path for the configs
set(
    aho-corasick2_INSTALL_CMAKEDIR "${CMAKE_INSTALL_DATADIR}/${package}"
    CACHE PATH "CMake package config location relative to the install prefix"
)
mark_as_advanced(aho-corasick2_INSTALL_CMAKEDIR)

install(
    FILES cmake/install-config.cmake
    DESTINATION "${aho-corasick2_INSTALL_CMAKEDIR}"
    RENAME "${package}Config.cmake"
    COMPONENT aho-corasick2_Development
)

install(
    FILES "${PROJECT_BINARY_DIR}/${package}ConfigVersion.cmake"
    DESTINATION "${aho-corasick2_INSTALL_CMAKEDIR}"
    COMPONENT aho-corasick2_Development
)

install(
    EXPORT aho-corasick2Targets
    NAMESPACE aho-corasick2::
    DESTINATION "${aho-corasick2_INSTALL_CMAKEDIR}"
    COMPONENT aho-corasick2_Development
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
