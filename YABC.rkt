#lang typed/racket

#|
The grammer:
  <Brainf*ck> ::= <INST> ...

  <INST>      ::= <LOOP> | <SINGLE>

  <SINGLE>    ::= > | < | + | - | . | ,

  <LOOP>      ::= [ <INST> ... ]

The evaluation rules:
|#

;; define the AST
(define-type PROGRAM
   )

(: parse-program : )
