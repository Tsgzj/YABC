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

(define (increase-data-pointer ptr)
  (if (< ptr 30000)
      (+ 1 ptr)
      (error "Segment Fault")))

(define (decrease-data-pointer ptr)
  (if (> ptr 1)
      (- 1 ptr)
      (error "Segment Fault")))

(define (increase-data-value ptr)
  (vector-set! tape
               ptr
               (+ 1 (vector-ref tape ptr))))

(define (decrease-data-value ptr)
  (vector-set! tape
               ptr
               (- 1 (vector-ref tape ptr))))

(define (read-charactor ptr)
  (vector-set! tape
               ptr
               (read)))

(define (print-charactor ptr)
  (write (integer->char
          (vector-ref tape ptr))))

;; stack for matching paratheses
(define bf-stack '())

(define (push x stack)
  (cons x stack))

(define (pop stack)
  (if (empty? stack)
      (error "Empty stack")
      (car stack)))

(define (push! x)
  (set! bf-stack (push x bf-stack)))

(define (pop!)
  (values (pop bf-stack)
          (set! bf-stack (cdr bf-stack))))

(define (set-jump-point ptr)
  (if (> (vector-ref tape ptr) 0)
      (push! ptr)
      (set! ptr (next-paratheses ptr bf))))

(define (next-paratheses ptr bf)
  '())

(define (jump-back ptr)
  (set! ptr (pop!)))
