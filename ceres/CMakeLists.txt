# For more information about using CMake with Android Studio, read the
# documentation: https://d.android.com/studio/projects/add-native-code.html

# Sets the minimum version of CMake required to build the native library.

cmake_minimum_required(VERSION 3.4.1)

# Creates and names a library, sets it as either STATIC
# or SHARED, and provides the relative paths to its source code.
# You can define multiple libraries, and CMake builds them for you.
# Gradle automatically packages shared libraries with your APK.

#set(EIGEN3_INCLUDE_DIR ${CMAKE_SOURCE_DIR}/eigen-3.3.9)
##add_subdirectory(eigen-3.3.9)
set(MINIGLOG ON)
set(EIGEN3_VERSION_STRING "3.3.9")
set(BUILD_SHARED_LIBS ON)
include_directories(${EIGEN3_INCLUDE_DIR})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/libs/${CMAKE_BUILD_TYPE}/${ANDROID_ABI})
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/libs/${CMAKE_BUILD_TYPE}/${ANDROID_ABI})
add_subdirectory(ceres-solver-2.0.0)