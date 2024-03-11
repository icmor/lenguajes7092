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

;; Ejercicio 6
;; Tipo de dato para un árbol binario de busqueda
(define-type ArbolDeBusqueda
  [vacio]
  [nodo (elem number?) (izq ArbolDeBusqueda?) (der ArbolDeBusqueda?)])

;; Ejercicio 6a
;; Función que elimina un nodo del árbol ar en base a su elemento.
(define (elimina ar el)
  (type-case ArbolDeBusqueda ar
             (vacio () ar)
             (nodo (elem izq der)
                   (if (not (eq? elem el))
                       (nodo elem (elimina izq el) (elimina der el))
                       (if (vacio? izq) der
                           (nodo (nodo-elem izq)
                                 (elimina (nodo elem (nodo-izq izq)
                                                (nodo-der izq)) el)
                                 (elimina der el)))))))

;; Ejercicio 6b
;; Predicado que regresa #t si el árbol ar contiene un nodo con el elemento el.
;; De lo contrario regresa #f.
(define (contiene? ar el)
  (type-case ArbolDeBusqueda ar
             (vacio () #f)
             (nodo (elem izq der) (or (eq? elem el)
                                      (contiene? izq el)
                                      (contiene? der el)))))

;; Ejercicio 6c
;; Función que recibe un árbol ar y un predicado pred. Regresa un nuevo árbol
;; donde todos los nodos tienen un elemento que cumple pred.
(define (filtrar-arbol ar pred)
  (type-case ArbolDeBusqueda ar
             (vacio () (vacio))
             (nodo (elem izq der)
                   (if (pred elem)
                       (nodo elem (filtrar-arbol izq pred)
                             (filtrar-arbol der pred))
                       (filtrar-arbol
                        (elimina (nodo elem der izq) elem) pred)))))

;; Punto extra

;; El código de Racket termina su ejecución mucho más rápido
;; (orden de magnitud x10).

;; El código de Racket termina antes por que maneja llamadas recursivas de una
;; forma mucho más eficiente que Python, esta diferencia sería aun más marcada
;; si tuvieramos llamadas de cola ya que Racket implementa TCO y Python no.
