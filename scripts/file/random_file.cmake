function(random_file out_filename in_pattern)
  
  while(true)
  
	
   make_guid(id)
	
   string(REPLACE "{{id}}" ${id} in_pattern ${in_pattern})
   set(current_name "${in_pattern}")
   if(NOT EXISTS ${current_name})
    set(${out_filename} ${current_name} PARENT_SCOPE)
    return()
   endif()
  endwhile()
  

endfunction()