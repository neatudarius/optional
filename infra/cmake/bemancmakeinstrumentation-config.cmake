include_guard(GLOBAL)

cmake_minimum_required (VERSION 4.2)

set(BEMAN_CMAKE_INSTRUMENTATION_DIR ${CMAKE_CURRENT_LIST_DIR})

function(configure_beman_cmake_instrumentation)
  if(NOT BEMAN_CMAKE_INSTRUMENTATION_CONFIGURATION)
      message(WARNING "Configuring Beman CMake Instrumentation")

    # Enable experimental feature!!
    set(CMAKE_EXPERIMENTAL_INSTRUMENTATION ec7aa2dc-b87f-45a3-8022-fe01c5f59984)

    # Instrumentation query
    cmake_instrumentation(
      API_VERSION 1
      DATA_VERSION 1

      OPTIONS staticSystemInformation dynamicSystemInformation trace
      HOOKS postGenerate preBuild postBuild preCMakeBuild postCMakeBuild postCMakeInstall postCTest
      CALLBACK ${BEMAN_CMAKE_INSTRUMENTATION_DIR}/instrumentation.sh
    )
    message(WARNING "using callback script ${BB_CMAKE_INSTRUMENTATION_DIR}/instrumentation.sh")

    # Mark task as done in cache
    set(BEMAN_CMAKE_INSTRUMENTATION_CONFIGURATION TRUE CACHE INTERNAL "Flag to ensure CMake Instrumentation configured only once")
  endif()

endfunction(configure_beman_cmake_instrumentation)
