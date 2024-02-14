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
;; Función que recibe cuatro números a, b, c, d y determina si estos se encuenctran
;; en orden descendente es decir a > b > c > d
(define (decremental? a b c d)
  (and (> a b) (> b c) (> c d)))

;; Ejercicio 3
;; Función para calcular el área de un triángulo a partir de sus lados
;; usando la fórmula de Herón
(define (area-heron a b c)
  (let ((S (/ (+ a b c) 2)))
    (sqrt (* S (- S a) (- S b) (- S c)))))

;; Ejercicio 4
;; Función que recibe una cadena y retorna "Vocal" si la cadena empieza con
;; una vocal y "Consonante" si empieza con una consonante.
(define (primera-letra s)
  (match (substring s 0 1)
    ["a" "Vocal"]
    ["e" "Vocal"]
    ["i" "Vocal"]
    ["o" "Vocal"]
    ["u" "Vocal"]
    [_ "Consonante"]))

;; Ejercicio 5
;; Predicado que regresa #t si un número es par y #f si es impar
(define (par? n)
  (= (modulo n 2) 0))

;; Ejercicio 6
;; Predicado que regresa #t si un número es impar y #f si es par
(define (impar? n)
  (not (par? n)))

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
;; Función que recibe una cadena indicando una operación y dos argumentos
;; numéricos sobre los cuales operar. Las posibles operaciones son:
;; first: retorna el primer operando
;; second: retorna el segundo operando
;; sum: retorna la suma de los operandos
;; mul: retorna el producto de los operandos
;; div-exacto: retorna el cociente de dividr el primer operando entre el segundo
;; div: retorna el cociente entero de dividir el primer operando entre el
;; segundo
(define (calculadora operacion n m)
  (match operacion
    ["first" n]
    ["second" m]
    ["sum" (+ n m)]
    ["mul" (* n m)]
    ["div-exact" (quotient n m)]
    ["div" (/ n m)]))
