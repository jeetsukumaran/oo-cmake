# returns the specified path component for the passed path
# posibble components are
# NAME_WE
# PATH
# @todo: create own components 
# e.g. parts dirs extension etc. consider creating an uri type
function(path_component path path_component)
  if("${path_component}" STREQUAL "--parent-dir")
    set(path_component PATH)
  endif()
  get_filename_component(res "${path}" "${path_component}")
  return_ref(res)
endfunction()