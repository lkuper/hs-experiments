#lang racket

;; Experimenting with CPSing factorial.

(require racket/trace)

(define fact
  (lambda (n)
    (cond
      [(equal? 0 n) 1]
      [else (* n (fact (- n 1)))])))


(define fact-fake-cps
  (lambda (n k)
    (cond
      [(equal? 0 n) (k 1)]
      [(k (fact-fake-cps (- n 1) (lambda (v) (* n v))))])))

(define fact-cps
  (lambda (n k)
    (cond
      [(equal? 0 n) (k 1)]
      [(fact-cps (- n 1) (lambda (v) (k (* n v))))])))

(define fact-acc
  (lambda (n a)
    (cond
      [(equal? 0 n) a]
      [(fact-acc (- n 1) (* n a))])))

;;(trace fact fact-fake-cps fact-cps fact-acc)

