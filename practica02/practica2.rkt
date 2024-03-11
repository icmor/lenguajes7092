#lang plai
#|
Practica 2.
|#

;; Equipo
;; Iñaki Cornejo de la Mora
;; Dahlia Yali Osorio Rangel
;; Ejercicio 2
(define err-index-too-big "El índice es mayor o igual que el tamaño de la lista")
(define err-index-too-small "El índice no puede ser menor que 0")

;; Función para obtener el elemento de una lista a partir de su índice
(define (get-by-index index ls)
  (define (get-elem idx ls)
    (if (zero? idx) (car ls)
        (get-elem (sub1 idx) (cdr ls))))
  (cond ((< index 0) error 'get-by-index err-index-too-small)
        ((>= index (length ls)) error 'get-by-index err-index-too-big)
        (else (get-elem index ls))))

;; Ejercicio 3
;; Tipo de dato para circulos y cuadrados
(define-type Figura
  (cuadrado (lado number?))
  (circulo (diametro number?)))

;; Ejercicio 4
(define err-tipo-area "El parámetro recibido no es del tipo: Figura")

;; Función para obtener el área de un dato tipo Figura
(define (area figura)
  (if (not (Figura? figura)) (error 'area err-tipo-area)
      (type-case Figura figura
                 (cuadrado (lado) (* lado lado))
                 (circulo (diametro) (let ((radio (/ diametro 2)))
                                       (* radio radio pi))))))

