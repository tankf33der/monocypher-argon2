(load "monocypher.l")
(load "libargon2.l")
# (de libargon2       (Iters Blocks Lanes Pass  Salt HashLen)
# (de crypto_argon2id (Out   Blocks Iters Lanes Password Salt Key Ad)
(test
   (libargon2
      8
      8
      1
      (mapcar char (chop "mikemike"))
      (mapcar char (chop "mikemike"))
      8 )
   (crypto_argon2id
      8
      8
      8
      1
      (pack (mapcar char (mapcar char (chop "mikemike"))))
      (pack (mapcar char (mapcar char (chop "mikemike")))) ) )

(msg 'ok)
(bye)
