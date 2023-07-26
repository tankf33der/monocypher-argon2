(load "libargon2.l")
(load "monocypher.l")
(seed (in "/dev/urandom" (rd 8)))
(de randL (A)
   (make (do A (link (rand 1 255)))) )
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
(let (P (range 1 10)  S (range 1 10))
   (test
      (libargon2 1 800 100 P S 8)
      (crypto_argon2id 8 800 1 100 (pack (mapcar char P)) (pack (mapcar char S))) ) )
(msg 'ok)
(bye)
