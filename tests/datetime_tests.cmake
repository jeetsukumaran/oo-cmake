function(test)

  datetime()
  ans(res)


  assert(res)
  # yeah i know.... bad test. fails in 2100 or if time is not correct on system
  assert(DEREF {res.yyyy} MATCHES "20[0-9][0-9]")
endfunction()