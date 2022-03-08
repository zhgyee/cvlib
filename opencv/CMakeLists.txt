# For more information about using CMake with Android Studio, read the
# documentation: https://d.android.com/studio/projects/add-native-code.html

# Sets the minimum version of CMake required to build the native library.

cmake_minimum_required(VERSION 3.4.1)

# Creates and names a library, sets it as either STATIC
# or SHARED, and provides the relative paths to its source code.
# You can define multiple libraries, and CMake builds them for you.
# Gradle automatically packages shared libraries with your APK.
include(${CMAKE_SOURCE_DIR}/../flags.cmake)
set(EIGEN3_INCLUDE_DIR ${CMAKE_SOURCE_DIR}/eigen-3.3.9)
##add_subdirectory(eigen-3.3.9)
include_directories(${EIGEN3_INCLUDE_DIR})
add_subdirectory(opencv-4.5.5)