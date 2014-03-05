# parses simple json: only arrays, objects and double quoted strings as values and only double quoted strings as keys
# little to no error notification (be sure your json is valid)
function(json_deserialize result json)
	json_tokenize(tokens "${json}")
	# add a , before every end of array and end of object
	set(toks)
	foreach(token ${tokens})
		if(${token} STREQUAL ">")
			set(toks ${toks} ",")
		elseif(${token} STREQUAL "}")			
			set(toks ${toks} ",")
		endif()

		set(toks ${toks} ${token})
	endforeach()


	set(tokens ${toks})
	set(last_value)
	set(res)
	element()
	foreach(token ${tokens})

		#message("${token}")

		if(${token} STREQUAL ",")
			if(last_value)
				if(last_key)
					value(KEY ${last_key} ${last_value})
					set(last_key)
					set(last_value)
				else()
					value(${last_value})
					set(last_value)
				endif()
			endif()

		elseif(${token} STREQUAL ":")
			set(last_key ${last_value})
			set(last_value)
		elseif(${token} STREQUAL "{")
			# start new object
			if(last_key)
				element(${last_key})
				set(last_key)
			else()
				element()
			endif()
		elseif(${token} STREQUAL "}")
			# end object
			element(END)
		elseif(${token} STREQUAL "<")
			if(last_key)
				element(${last_key})
				set(last_key)
			else()
				element()
			endif()
		elseif(${token} STREQUAL ">")
			element(END)		
		else()
			set(last_value ${token})
			string(LENGTH ${last_value} len)
			math(EXPR len "${len} -2")
			string(SUBSTRING ${last_value} 1 ${len} last_value)				
		endif()
	endforeach()

	if(last_value)
		value(${last_value})
		set(last_value)
	endif()

	element(END root)
	ref_get(res ${root})

	return_value(${res})
endfunction()