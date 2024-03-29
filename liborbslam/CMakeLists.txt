# For more information about using CMake with Android Studio, read the
# documentation: https://d.android.com/studio/projects/add-native-code.html

# Sets the minimum version of CMake required to build the native library.

cmake_minimum_required(VERSION 3.4.1)

# Creates and names a library, sets it as either STATIC
# or SHARED, and provides the relative paths to its source code.
# You can define multiple libraries, and CMake builds them for you.
# Gradle automatically packages shared libraries with your APK.
include(${CMAKE_SOURCE_DIR}/../flags.cmake)
#set(EIGEN3_INCLUDE_DIR ${CMAKE_SOURCE_DIR}/eigen-3.3.9)
##add_subdirectory(eigen-3.3.9)
set(MINIGLOG ON)
set(EIGEN3_VERSION_STRING "3.3.9")
set(BUILD_SHARED_LIBS ON)
include_directories(${EIGEN3_INCLUDE_DIR})
#set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/libs/${CMAKE_BUILD_TYPE}/${ANDROID_ABI})
set (LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/libs/${CMAKE_BUILD_TYPE}/${ANDROID_ABI})
add_subdirectory(DBoW2)
add_subdirectory(g2o)
add_subdirectory(Sophus)
#build examples
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY  ${CMAKE_CURRENT_SOURCE_DIR}/bin)
add_executable(cvtest
        ${CMAKE_CURRENT_SOURCE_DIR}/g2oCurveFitting.cpp
        )

target_include_directories(cvtest
        PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/g2o
        )

target_link_libraries(cvtest PRIVATE g2o
        -fopenmp
        -static-openmp)