include ( cmake/CPM.cmake )

CPMAddPackage(
  NAME freetype
  GITHUB_REPOSITORY aseprite/freetype2
  GIT_TAG fbbcf50367403a6316a013b51690071198962920
)

if( BUILD_PLATFORM STREQUAL "glfw" )
  CPMAddPackage(
    NAME glfw
    GITHUB_REPOSITORY glfw/glfw
    GIT_TAG 0a49ef0a00baa3ab520ddc452f0e3b1e099c5589
    OPTIONS 
    "GLFW_BUILD_DOCS OFF"
    "GLFW_INSTALL OFF"
    "GLFW_BUILD_EXAMPLES OFF"
    "GLFW_BUILD_TESTS OFF"
  )

  CPMAddPackage(
    NAME glad
    GITHUB_REPOSITORY Dav1dde/glad
    GIT_TAG de6c39e3040c987323b8ed078c36442f4fb681b3 # 0.1.33
  )
  set( GLFW_DEPENDENCY glfw glad )
endif()

function ( set_dependency target_name target_type )
  message( STATUS "${GLFW_DEPENDENCY}" ) 
  target_link_libraries( ${target_name} ${target_type} 
    ${GLFW_DEPENDENCY} 
    freetype
  )

endfunction()
