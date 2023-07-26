(de libargon2 (Iters Blocks Lanes Pass Salt HashLen)
   (let
      (PL (length Pass)
         SL (length Salt)
         R NIL )
      (native
         "libargon2.so"
         "argon2id_hash_raw"
         'I
         Iters
         Blocks
         Lanes
         (cons NIL (cons PL) Pass)
         PL
         (cons NIL (cons SL) Salt)
         SL
         (list 'R (cons HashLen 'B HashLen))
         HashLen )
      R ) )

(println
   (libargon2
      4
      8
      1
      (mapcar char (chop "mike"))
      (mapcar char (chop "mikemike"))
      4 ) )

(msg 'ok)
(bye)
