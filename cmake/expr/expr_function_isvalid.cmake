
  function(expr_function_isvalid str)
    if(COMMAND "${str}")
        return(true)
    endif()
    is_function(is_function "${str}")
    if(is_function)
      return(true)
    endif()
    lambda_isvalid("${str}")
    ans(is_lambda)
    if(is_lambda)
      return(true)
    endif()  
    return(false)
  endfunction()