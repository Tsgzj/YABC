#lang typed/racket

#|
The grammer:
  <Brainf*ck> ::= <INST> ...

  <INST>      ::= <LOOP> | <SINGLE>

  <SINGLE>    ::= > | < | + | - | . | ,

  <LOOP>      ::= [ <INST> ... ]

The evaluation rules:
  (eval +)    add point by one
|#

;; define the AST
(define-type PROGRAM
   )

(: parse-program : )
