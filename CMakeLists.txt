
# 
# CMake options
# 

# CMake version
cmake_minimum_required(VERSION 3.0 FATAL_ERROR)

# Declare project
project (SampleProject C CXX)

set(META_PROJECT_NAME        "UNAJMA")
set(META_PROJECT_DESCRIPTION "Brief Introduction of Moderbn OpenGL")
set(META_AUTHOR_ORGANIZATION "Dr Felipe de Carvalho")


# 
# Project modules
# 

add_subdirectory(libs/Tucano)
add_subdirectory(src)
