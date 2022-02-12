
set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -Wall -fexceptions -frtti ")
set(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} -Wall -Werror -Wno-unused-variable ")
if(CMAKE_BUILD_TYPE MATCHES "Release")
    set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -O3 -fvisibility=hidden -Werror ")
else()
    set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -O0 -g -fstack-protector")
    if(USE_ASAN)
        set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -fsanitize=address -fno-omit-frame-pointer")
        set(CMAKE_LINK_FLAGS  "${CMAKE_CXX_FLAGS} -fsanitize=address")
    endif()
endif()

LIST(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake_modules)

find_package(Eigen3 REQUIRED)

set(OpenCV_DIR "${OPENCV_DIR}/native")
add_library(OpenCV_LIBS SHARED IMPORTED)
set_target_properties(OpenCV_LIBS PROPERTIES IMPORTED_LOCATION
        "${OpenCV_DIR}/libs/${ANDROID_ABI}/libopencv_java4.so"
        )
set(OpenCV_INCLUDE_DIRS "${OpenCV_DIR}/jni/include")
include_directories(${OpenCV_INCLUDE_DIRS})

set(BOOST_INCLUDE_DIR "${BOOST_DIR}/${ANDROID_ABI}/include/boost-1_76")
include_directories(${BOOST_INCLUDE_DIR})
add_library(boost_serialization STATIC IMPORTED)
set_target_properties(boost_serialization PROPERTIES IMPORTED_LOCATION
        "${BOOST_DIR}/${ANDROID_ABI}/lib/libboost_serialization-clang-mt-a64-1_76.a")