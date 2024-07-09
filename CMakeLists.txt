cmake_minimum_required(VERSION 3.22)

# Setup compiler settings
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS ON)

# Define the build type
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Debug")
endif()

# Set the project name
set(CMAKE_PROJECT_NAME app)

# Enable CMake support for ASM and C languages
enable_language(C ASM)

# Core project settings
project(${CMAKE_PROJECT_NAME})

# Include toolchain file for ARM
if(CMAKE_C_COMPILER MATCHES "arm-none-eabi-gcc")

    message("Build type: " ${CMAKE_BUILD_TYPE})
    
    # Create an executable object type
    add_executable(${CMAKE_PROJECT_NAME})
    
    # Add STM32CubeMX generated sources
    add_subdirectory(cmake/stm32cubemx)
    
    # Add lib generated sources
    add_subdirectory(lib)
    
    # Add linked libraries
    target_link_libraries(${CMAKE_PROJECT_NAME}
        stm32cubemx
        MYLIB
        # Add user defined libraries
    )
endif()


# Add subdirectory for tests (only if not using ARM toolchain)
if(NOT CMAKE_C_COMPILER MATCHES "arm-none-eabi-gcc")
    set(CMAKE_C_FLAGS_PROFILE --coverage)
    include(CTest)
    add_subdirectory(external)
    add_subdirectory(lib)
    add_subdirectory(tests)
endif()