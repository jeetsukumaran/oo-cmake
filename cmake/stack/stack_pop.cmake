
  function(stack_pop stack)
    ref_get(${stack} lst)

    #message("whole stack ${lst}")
    list_pop_back( decoded lst)
   # message("new stack ${lst}")
    ref_set(${stack} "${lst}")
    string_decode_list("${decoded}")
    ans(decoded)
    #message("popped ${res}")
    return_ref(decoded)
  endfunction()
