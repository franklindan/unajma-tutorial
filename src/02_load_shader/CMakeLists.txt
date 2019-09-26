# Target name
set(target 02_load_shaders)

find_package(glfw3 REQUIRED)
find_package(GLEW REQUIRED)
find_package(Eigen3 REQUIRED)

## Begin stratmod library

# Enable automoc

set ( OUTPUT  "${CMAKE_BINARY_DIR}/build/${target}")

# 
# Sources
#

set(sources 
    main.cpp 
)
# Build executable
add_executable(${target}
    ${sources}    
)

# Create namespaced alias
add_executable(${META_PROJECT_NAME}::${target} ALIAS ${target})

# 
# Project options
# 

set_target_properties(${target}
    PROPERTIES
    ${DEFAULT_PROJECT_OPTIONS}
    FOLDER "unajma/01_create_context"
    CXX_STANDARD 11
    
    ARCHIVE_OUTPUT_DIRECTORY "${OUTPUT}/data"
    LIBRARY_OUTPUT_DIRECTORY "${OUTPUT}/lib"
    RUNTIME_OUTPUT_DIRECTORY "${OUTPUT}/bin"
)

# 
# Include directories
# 

target_include_directories(${target}
    PRIVATE
    ${DEFAULT_INCLUDE_DIRECTORIES}
    SYSTEM
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${glfw3_INCLUDE_DIR}    
    ${GLEW_INCLUDE_DIR}    
    ${EIGEN3_INCLUDE_DIR}
    ${CMAKE_SOURCE_DIR}/libs
)

# 
# Libraries
# 

target_link_libraries(${target}
    PRIVATE
    ${DEFAULT_LIBRARIES}
    glfw
    # https://stackoverflow.com/questions/33747874/glfw3-error-dso-missing-from-command-line
    dl
    ${GLEW_LIBRARIES}
    Tucano
)


# 
# Compile definitions
# 

target_compile_definitions(${target}
    PRIVATE
    ${DEFAULT_COMPILE_DEFINITIONS}   
)


# 
# Compile options
# 
target_compile_options(${target}
    PRIVATE
    ${DEFAULT_COMPILE_OPTIONS}
)


# 
# Linker options
# 

target_link_libraries(${target}
    PRIVATE
    ${DEFAULT_LINKER_OPTIONS}
)


SET (SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/asserts")
             
SET (DESTINATION "${OUTPUT}/bin/asserts")

ADD_CUSTOM_TARGET (${target}_Asserts ALL
                   DEPENDS ${SOURCE}
                   COMMENT "Copying Asserts: ${SOURCE} ${DESTINATION}" )
                 
ADD_CUSTOM_COMMAND (
                TARGET ${target}_Asserts
                COMMAND ${CMAKE_COMMAND} -E copy_directory ${SOURCE} ${DESTINATION} )   
         