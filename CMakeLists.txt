cmake_minimum_required( VERSION 3.12 )
project ( imgui )

option ( BUILD_SHARED_LIBS "The shared lib is " OFF )
set    ( BUILD_PLATFORM    "glfw" CACHE STRING "The platform lib is " )

include ( cmake/warnings.cmake )

add_library( imgui-cppwarnings INTERFACE )
add_library( imgui-cppfeatures INTERFACE )

set_project_warinigs( imgui-cppwarnings )
target_compile_features( imgui-cppfeatures INTERFACE cxx_std_17 )
target_include_directories( imgui-cppfeatures INTERFACE ${CMAKE_CURRENT_SOURCE_DIR} )

add_library( imgui 
# headers
./misc/single_file/imgui_single_file.h
./misc/freetype/imgui_freetype.h
./misc/cpp/imgui_stdlib.h
./imgui.h
./imstb_textedit.h
./imconfig.h
./imstb_truetype.h
./imgui_internal.h
./imstb_rectpack.h
# sources
./misc/freetype/imgui_freetype.cpp
./misc/cpp
./misc/cpp/imgui_stdlib.cpp
./misc/fonts/binary_to_compressed_c.cpp
./imgui_widgets.cpp
./imgui.cpp
./imgui_demo.cpp
./imgui_draw.cpp

)

include ( cmake/dependency.cmake )
set_dependency ( imgui PRIVATE )

target_link_libraries( imgui PRIVATE imgui-cppwarnings imgui-cppfeatures )
target_include_directories( imgui PUBLIC ${CMAKE_CURRENT_SOURCE_DIR} )
target_include_directories( imgui PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/examples )





if( BUILD_PLATFORM STREQUAL "glfw" )
  target_sources(imgui PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/examples/imgui_impl_glfw.h
    ${CMAKE_CURRENT_SOURCE_DIR}/examples/imgui_impl_glfw.cpp

    ${CMAKE_CURRENT_SOURCE_DIR}/examples/imgui_impl_opengl3.cpp
  )

  add_executable ( glfw_example 
    ${CMAKE_CURRENT_SOURCE_DIR}/examples/example_glfw_opengl3/main.cpp
  )

  target_compile_definitions( glfw_example PRIVATE IMGUI_IMPL_OPENGL_LOADER_GL3W=1)
  target_link_libraries( glfw_example PRIVATE imgui ${GLFW_DEPENDENCY}) 
endif()




















#if( BUILD_PLATFORM STREQUAL "osx" )
#  include ( cmake/ios.toolchain.cmake )
#
#  set ( BUILD_RENDERER "metal" CACHE STRING "The lib renderer is " )
#  
#  if ( BUILD_RENDERER STREQUAL "metal" )
#    target_sources(imgui PRIVATE
#      ${CMAKE_CURRENT_SOURCE_DIR}/examples/imgui_impl_osx.h
#      ${CMAKE_CURRENT_SOURCE_DIR}/examples/imgui_impl_metal.h
#
#      ${CMAKE_CURRENT_SOURCE_DIR}/examples/imgui_impl_osx.mm
#      ${CMAKE_CURRENT_SOURCE_DIR}/examples/imgui_impl_metal.mm
#    )
#  endif()
#
#
#endif()

#if ( BUILD_EXAMPLES )
#  include ( cmake/build_example.cmake )
#  build_example(sdl_vulkan)
#  build_example(glfw_opengl2)
#  build_example(null)
#  build_example(sdl_vulkan)
#  build_example(sdl_vulkan)
#  build_example(sdl_vulkan)
#  build_example(sdl_vulkan)
#  build_example(sdl_vulkan)
#  build_example(sdl_vulkan)
#endif()

#./examples/imgui_impl_allegro5.h
#./examples/imgui_impl_win32.h
#./examples/imgui_impl_dx12.h
#./examples/imgui_impl_sdl.h
#./examples/imgui_impl_osx.h
#./examples/imgui_impl_opengl3.h
#./examples/example_allegro5/imconfig_allegro5.h
#./examples/imgui_impl_dx11.h
#./examples/libs/usynergy/uSynergy.h
#./examples/libs/gl3w/GL/glcorearb.h
#./examples/libs/gl3w/GL/gl3w.h
#./examples/libs/glfw/include/GLFW/glfw3.h
#./examples/libs/glfw/include/GLFW/glfw3native.h
#./examples/imgui_impl_marmalade.h
#./examples/imgui_impl_glut.h
#./examples/imgui_impl_opengl2.h
#./examples/imgui_impl_dx10.h
#./examples/imgui_impl_glfw.h
#./examples/imgui_impl_metal.h
#./examples/imgui_impl_dx9.h
#./examples/example_apple_metal/Shared/AppDelegate.h
#./examples/example_apple_metal/Shared/Renderer.h
#./examples/example_apple_metal/Shared/ViewController.h
#./examples/imgui_impl_vulkan.h

#./examples/example_sdl_vulkan/main.cpp
#./examples/example_glfw_opengl2/main.cpp
#./examples/example_null/main.cpp
#./examples/example_marmalade/main.cpp
#./examples/example_glfw_opengl3/main.cpp
#./examples/example_glut_opengl2/main.cpp
#./examples/example_win32_directx9/main.cpp
#./examples/example_sdl_directx11/main.cpp
#./examples/imgui_impl_marmalade.cpp
#./examples/example_glfw_vulkan/main.cpp
#./examples/example_allegro5/main.cpp
#./examples/example_win32_directx10/main.cpp
#./examples/example_emscripten/main.cpp
#./examples/imgui_impl_win32.cpp
#./examples/example_win32_directx11/main.cpp
#./examples/imgui_impl_glut.cpp
#./examples/imgui_impl_allegro5.cpp
#./examples/imgui_impl_dx9.cpp
#./examples/imgui_impl_opengl2.cpp
#./examples/imgui_impl_opengl3.cpp
#./examples/imgui_impl_dx10.cpp
#./examples/imgui_impl_vulkan.cpp
#./examples/imgui_impl_dx11.cpp
#./examples/example_sdl_opengl3/main.cpp
#./examples/example_sdl_opengl2/main.cpp
#./examples/imgui_impl_dx12.cpp
#./examples/imgui_impl_glfw.cpp
#./examples/example_win32_directx12/main.cpp
#./examples/imgui_impl_sdl.cpp
