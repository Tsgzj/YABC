#lang racket

#|
How it works

    <  :  Increment the data pointer (go to the next cell).
    >  :  Decrement the data pointer (go to the previous cell).
    +  :  Increment the value in current cell.
    –  :  Decrement the value in current cell.
    ,  : Read a character from stdin, and write it to the current cell.
    .  : Print the character in the current cell.
    [  : If the value in the current cell is greater than 0, go read the next instruction else jump to the closing “]”.
    ]  : Jump to the opening “[“.

The grammer:
  <Brainf*ck> ::= <INST> ...

  <INST>      ::= <LOOP> | <SINGLE>

  <SINGLE>    ::= > | < | + | - | . | ,

  <LOOP>      ::= [ <INST> ... ]


First create a tape with 30000 slots
|#

(define tape (make-vector 30000))

(define increase-data-pointer
  (lambda (ptr)
    (if (< ptr 30000)
        (+ 1 ptr)
        (error "Segment Fault"))))

(define decrease-data-pointer
  (lambda (ptr)
    (if (> ptr 1)
        (- 1 ptr)
        (error "Segment Fault"))))

(define increase-data-value
  (lambda (ptr)
    (vector-set! tape
                 ptr
                 (+ 1 (vector-ref tape ptr)))))

(define decrease-data-value
  (lambda (ptr)
    (vector-set! tape
                 ptr
                 (- 1 (vector-ref tape ptr)))))

(define read-charactor
  (lambda (ptr)
    (vector-set! tape
                 ptr
                 (read))))

(define print-charactor
  (lambda (ptr)
    (write (integer->char
            (vector-ref tape ptr)))))

(define (compile-bf bf)
  (define (compile-bf-at-point bf ptr)
    '())
  (compile-bf-at-point bf 0))
