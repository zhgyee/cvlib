
set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -Wall -fexceptions -frtti ")
if(CMAKE_BUILD_TYPE MATCHES "Release")
    set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -O3 -fvisibility=hidden -Werror ")
else()
    set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -O0 -g -fstack-protector")
    if(USE_ASAN)
        set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -fsanitize=address -fno-omit-frame-pointer")
        set(CMAKE_LINK_FLAGS  "${CMAKE_CXX_FLAGS} -fsanitize=address")
    endif()
endif()

