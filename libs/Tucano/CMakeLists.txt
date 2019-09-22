project(Tucano)

find_package(Eigen3 REQUIRED)
find_package(OpenGL REQUIRED)
find_package(GLEW REQUIRED)

include_directories(
        #Eigen3
        ${EIGEN3_INCLUDE_DIR}
        #OpenGL and GLEW
        ${GLEW_INCLUDE_DIR}
        ${OPENGL_INCLUDE_DIR}
        )
 
set( sources
    Camera.hpp   
    Camera.cpp          
    Trackball.hpp
    Trackball.cpp
    FlyCamera.hpp
    FlyCamera.cpp
    GLTexture.hpp
    GLTexture.cpp
    TextureManager.hpp
    TextureManager.cpp
    Shader.hpp
    Shader.cpp   
    Misc.hpp       
    )

    
add_library( Tucano STATIC  ${sources}  )

set_target_properties( Tucano
    PROPERTIES
    CXX_STANDARD 11
)
     
target_link_libraries(Tucano  ${OPENGL_LIBRARIES} ${GLEW_LIBRARY} )
        
