(* Ripresa lezione precedente *)

(* --- Differenze RECORD e TUPLE 
  RECORD: Accesso per nome, non conta l'ordine
  TUPLE: Accesso per valore, conta l'ordine
  Quindi effettuano le stesse operazioni, ma anche sotto un punto di vista di cardinalità
  si preferisce il record grazie al potenziale accesso grazie alla notazione punto (record.campo) *)

  type punto_2d = { x: float; y: float; } ;;

(* Functional Update, non aggiorniamo davvero, ma facendo riferimento ad un record esistente varia qualcosa e ne crea uno nuovo,
  attenzione però, non viene aggiornata il record da cui parto *)

(* Differenze con oggetti:
  1. Non esiste il this, quindi non posso utilizzare propri metodi, a massimo assegno una funzione ad un campo
  1. Il record è immutabile*)

(* --- Tipo Variant:
  Letteralmente unione di tipo, ma è necessario passare da delle etichette, perchè il compilatore ha la necessità di distinguere
  tra i vari insiemi che stiamo unendo.
  *)

  type numero_testo =
    | Txt of string
    | Num of int ;;

  let x = Txt "34" ;; (* Necessario identificare su quale parte sono nell'insieme unito finale *)
  let y = Num 26 ;;

  (* Questo può aiutarci con il pattern matching, facendo quindi pattern matching sul tipo *)

  let int_of_nt x = (* Esempio sul cast dato un nt (x che può essere int o str) *)
    match x with
    | Txt s -> int_of_string s (* Ho una stringa, allora casto a numero *)
    | Num n -> n ;; (* Già ho un numero quindi non devo castare nulla, torno semplicemente x*)
    
  let string_of_nt x =
      match x with
      | Txt s -> s
      | Num n -> string_of_int n ;;
      
  int_of_nt (Txt "4") ;;

  (* --- Enum ... *)

(* --- Tipi Polimorfi *)

  (* Esempio di massimo in lista vuota con utilizzo di None *)

  let rec massimo lis =
    match lis with
    | [] -> None   (*Se è vuota torna None*)
    | x::lis' ->  (* altrimenti *)
      match massimo lis' with (* Matcha max e resto lista (lis') *)
        | None -> Some x (*Se resto lista è vuoto allora il max è x testa*)
        | Some max -> if x>max then Some x (*Caso ricorsivo*)
                      else Some max ;;     

  (* In questo caso sto coprendo anche la lista vuota *)
  
  type 'a option =
    | Some of 'a (* Ho qualcosa del tipo passato *)
    | None ;; (* Non ho nulla *)

  (* --- Definizione di strutture ricorsive *)

  (* - Definizione di lista come tupla (val, lista)*)

  type lista_di_int =
    | Nil
    | Elem of int * lista_di_int ;;
    
  let lst = Elem (3 ,Elem (4, Elem (6,Nil))) ;;

  (* - Aggiunta nodo in testa *)

  let cons x lis =
    Elem (x,lis) ;;

  cons 5 lst;;

  (* Somma della lista in ricorsione, ponendo Nil come caso base*)

  let rec somma_lista lis = 
    match lis with
    | Nil -> 0
    | Elem (x,lis') -> x + somma_lista lis' ;;
    
  somma_lista ( Elem (3 ,Elem (4, Elem (6,Nil))));;

  (* Dunque la lista pre builted dell'ocaml è un caso particolare di variant ricorsiva polimorfa *)

  type 'a my_list =
   | Empty                       (* corrisponde a [] *)
   | Cons of 'a * 'a my_list ;;  (* corrisponde a _::_ *)

(* - Definizione dell'Albero come tipo Ricorsivo *)

  type albero_bin =
      | Nodo of int*albero_bin*albero_bin
      | Foglia of int ;;

  let rec visita_ant a =
    match a with
    | Foglia v -> [v]
    | Nodo (v,sx,dx) -> v::((visita_ant sx)@(visita_ant dx)) ;;
    
  visita_ant n5 ;;

(* --- BNF e Albero di Sintassi Astratta*)

  type op = Add | Sub | Mul | Div | Mod ;;
  type exp =
      | Val of int
      | Op of op*exp*exp
      | UMin of exp ;;

(* - Esempio su eval di exp *)

  let rec eval e =
    match e with
    | Val n -> n
    | Op (o,e1,e2) -> 
        (match o with
        | Add -> (eval e1) + (eval e2)
        | Sub -> (eval e1) - (eval e2)
        | Mul -> (eval e1) * (eval e2)
        | Div -> (eval e1) / (eval e2)
        | Mod -> (eval e1) mod (eval e2)
        )
    | UMin e' -> - (eval e') ;;

(* --- Ripresa funzione higher order *)