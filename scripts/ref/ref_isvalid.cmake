function(ref_isvalid result ref)
	string(REGEX MATCH "^ref:" res "${ref}" )
	if(res)
		return_value(true)
	endif()
	return_value(false)
endfunction()