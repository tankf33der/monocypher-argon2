(load "monocypher.l")
(load "libargon2.l")
# (de libargon2       (Iters Blocks Lanes Pass  Salt HashLen)
# (de crypto_argon2d  (Out   Blocks Iters Lanes Password Salt Key Ad)
(seed (in "/dev/urandom" (rd 8)))
(de randL (A)
   (make (do A (link (rand 1 127)))) )
(for HashLen (range 7 16)
   (for Iters (range 1 3)
      (for Blocks (range 511 515)
         (for Lanes (range 1 10)
            (for Pass (range 0 4)
               (for Salt (range 8 10)
                  (let (P (randL Pass)  S (randL Salt))
                     (test
                        (libargon2 Iters Blocks Lanes P S HashLen)
                        (crypto_argon2d
                           HashLen
                           Blocks
                           Iters
                           Lanes
                           (pack (mapcar char P))
                           (pack (mapcar char S)) ) ) ) ) ) ) ) ) )
(msg 'ok)
(bye)
