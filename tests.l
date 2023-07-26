(load "monocypher.l")
(load "libargon2.l")
(seed (in "/dev/urandom" (rd 8)))
(de randL (A)
   (make (do A (link (rand 0 255)))) )
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
(let (P (range 200 208)  S (range 1 8))
   (println
      P
      (pack (mapcar char P))
      (libargon2 8 8 1 P S 8)
      (crypto_argon2id 8 8 8 1 (pack (mapcar char P)) (pack (mapcar char S))) ) )
(msg 'ok)
(bye)
