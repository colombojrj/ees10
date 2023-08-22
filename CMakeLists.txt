cmake_minimum_required(VERSION 3.11)

# A tutorial about how to use ExternalProject (properly) is available at:
# https://crascit.com/2015/07/25/cmake-gtest/
include(ExternalProject)
include(FetchContent)

####################
# Project settings #
####################
project(ees10 C CXX)

###############################
# All binary will be put here #
###############################
set(LIBS_DIR ${CMAKE_CURRENT_BINARY_DIR}/libs)

#########################
# Add the boost library #
#########################
#set(BOOST_ROOT "C:/local/boost_1_82_0")
set(Boost_USE_STATIC_LIBS OFF)
set(Boost_USE_MULTITHREADED ON)
set(Boost_USE_STATIC_RUNTIME OFF)
find_package(Boost REQUIRED)
#find_package(Boost REQUIRED COMPONENTS system)
include_directories(${Boost_INCLUDE_DIRS})

################
# HDF5 library #
################
set(HDF5_USE_STATIC_LIBRARIES ON)
find_package(HDF5 REQUIRED COMPONENTS C HL)

################
# zlib library #
################
ExternalProject_Add (zlibProject
	PREFIX            zlib
	URL               https://github.com/madler/zlib/releases/download/v1.2.13/zlib1213.zip
	CMAKE_ARGS        -DCMAKE_INSTALL_PREFIX=${LIBS_DIR}
)
set(ZLIB_INCLUDE_DIR ${LIBS_DIR}/include)
set(ZLIB_LIBRARY     ${LIBS_DIR}/lib)

########################
# eigen matrix library #
########################
ExternalProject_Add(eigen
	PREFIX            eigen
	URL               https://gitlab.com/libeigen/eigen/-/archive/3.4.0/eigen-3.4.0.zip
	CMAKE_ARGS        -DCMAKE_INSTALL_PREFIX=${LIBS_DIR}
)
include_directories(${LIBS_DIR}/include/eigen3)

#################
# matio library #
#################
set(MATIO_SHARED OFF CACHE INTERNAL "")  # Força o uso da biblioteca estática
FetchContent_Declare(
    matioProject
    URL               https://github.com/tbeu/matio/archive/refs/tags/v1.5.23.zip
)
FetchContent_MakeAvailable(matioProject)
target_include_directories(matio PUBLIC ${LIBS_DIR}/include)
add_dependencies(matio zlibProject)
link_libraries(matio)

#######################
# eigen-matio library #
#######################
set(EIGEN_MATIO_URL  https://raw.githubusercontent.com/tesch1/eigen-matio/master/MATio)
set(EIGEN_MATIO_DIR ${LIBS_DIR}/include)
set(EIGEN_MATIO_DEST ${EIGEN_MATIO_DIR}/MATio)
if(NOT EXISTS EIGEN_MATIO_DEST)
	file(DOWNLOAD ${EIGEN_MATIO_URL} ${EIGEN_MATIO_DEST})
endif()
include_directories(${EIGEN_MATIO_DIR})

##################
# OpenDAC driver #
##################
ExternalProject_Add (opendac
	PREFIX            opendac
	GIT_REPOSITORY    https://gitlab.com/opendac/dac/dac-driver.git
	GIT_TAG           main
	CMAKE_ARGS        -DCMAKE_INSTALL_PREFIX=${LIBS_DIR}
    UPDATE_DISCONNECTED True
)
ExternalProject_Get_Property(opendac SOURCE_DIR BINARY_DIR)
add_library(libdac STATIC IMPORTED)
set_property(TARGET libdac PROPERTY IMPORTED_LOCATION "${LIBS_DIR}/lib/libopendac.lib")
link_libraries(libdac)

# The ntdll library is required at Microsoft Windows
if(WIN32)
    link_libraries(ntdll)
endif()

############################
# We add our projects here #
############################
add_executable(lab1 lab1/main.cpp)
add_dependencies(lab1 opendac matio eigen)

add_executable(lab2 lab2/main.cpp)
add_dependencies(lab2 opendac matio eigen)

add_executable(lab3 lab3/main.cpp)
add_dependencies(lab3 opendac matio eigen)

add_executable(lab4 lab4/main.cpp)
add_dependencies(lab4 opendac matio eigen)

add_executable(lab5 lab5/main.cpp)
add_dependencies(lab5 opendac matio eigen)

add_executable(lab6 lab6/main.cpp)
add_dependencies(lab6 opendac matio eigen)

add_executable(lab7 lab7/main.cpp)
add_dependencies(lab7 opendac matio eigen)

add_executable(lab8 lab8/main.cpp)
add_dependencies(lab8 opendac matio eigen)
