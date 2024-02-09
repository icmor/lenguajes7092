#lang plai
#|
Practica 1.
|#

;; Equipo
;; Iñaki Cornejo de la Mora
;; Dahlia Yali Osorio Rangel

;; Ejercicio 1
;; Función para calcular el área total de un cono circular recto
;; usando 355/113 como aproximación de pi
(define (area-total diametro generatriz)
  (let ((pi (/ 355 113)))
    (+ (* pi generatriz (/ diametro 2))
       (* pi (expt (/ diametro 2) 2)))))

;; Ejercicio 2
(define (decremental? a b c d)
  (error "Sin implementar"))

;; Ejercicio 3
;; Función para calcular el área de un triángulo a partir de sus lados
;; usando la fórmula de Herón
(define (area-heron a b c)
  (let ((S (/ (+ a b c) 2)))
    (sqrt (* S (- S a) (- S b) (- S c)))))

;; Ejercicio 4
(define (primera-letra s)
  (error "Sin implementar"))

;; Ejercicio 5
;; Predicado que regresa #t si un número es par y #f si es impar
(define (par? n)
  (eq? (modulo n 2) 0))

;; Ejercicio 6
(define (impar? n)
  (error "Sin implementar"))

;; Ejercicio 7
;; Función que recibe tres números y devuelve #t si el primer
;; número es mayor o igual al segundo y menor o igual que el tercero, además,
;; devolverá #t si el primer número es menor que el segundo
;; menos 10 o si es mayor que el segundo más 10.
(define (en-rango-o-fuera? x a b)
  (or
   (and (>= x a) (<= b))
   (or (< x (- a 10)) (> x (+ a 10)))))

;; Ejercicio 8
(define (calculadora operacion n m)
  (error "Sin implementar"))
