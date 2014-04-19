function(expr_eval_expression)
#  message("evaluating expression")
  map_get(${ast} children children)
  
    map_create(new_context)
  map_set(${new_context} parent_context ${context})
  map_tryget(${context} scope scope)
  map_set(${new_context} scope ${scope})

  foreach(rvalue_ast ${children})
    ast_eval(${rvalue_ast} ${new_context})
    ans(rvalue)
    map_set(${new_context} left ${rvalue})
    map_set(${new_context} left_ast ${rvalue_ast})
  endforeach()


  map_tryget(${new_context} left left)
  return_ref(left)
endfunction()