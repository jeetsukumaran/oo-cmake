
  function(ast_json_eval_array )#ast scope
    map_get(${ast} values children)
    set(res)
    foreach(value ${values})
      ast_eval(${value} ${scope})
      ans(evaluated_value)
      list(APPEND res "${evaluated_value}")
    endforeach()
    return_ref(res)
  endfunction()