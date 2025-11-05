(* --- Funzioni Higher Order 
  Funzioni che permettono l'acquisizione di funzioni come parametri che eseguirebbero operazioni molto simili
  in questo modo quindi si crea una funzione higher orden che acquisisce la proprietà/predicato
  - Casi popolari forall/foreach, filter, reduce *)

  let rec filter p lis =
    match lis with
    | [] -> []
    | x::lis' -> if p x then x::filter p lis'
                 else filter p lis' ;;

  let rec map f lis =
      match lis with
      | [] -> []
      | x::lis' -> f x::map f lis' ;;
      
(* --- FOLD RIGHT *) (* Vedi esempio su (+) x1 (..(..(..))) *)
(* - Invocazione fold_right funzione lista accumulatore *)

  let rec fold_right f lis a =
    match lis with
    | [] -> a
    | x::lis' -> f x (fold_right f lis' a) ;;

(* Dunque, con la fold_right posso utilizzare minimo oppure somma , fold_right è from right to left *)

fold_right (x y -> x+y) [1;2;3] 0;;

(* --- FOLD LEFT *) (* Vedi esempio su (+) (..(..(..))) x1 - ESEMPIO UTILE *)
(* - Invocazione fold_left funzione accumulatore lista *)

(* La fold left è in tail recursion, from left to right, apre una porta all'ottimizzazione della tail recursion, vale la pena solo se il 
  linguaggio in questione è ottimizzato per la tail recursion *)

  let rec fold_left f a lis =
    match lis with
    | [] -> a
    | x::lis' -> fold_left f (f a x) lis' ;;

(* Prova a confrontare funzioni higher order scritte da te con quelle della documentazione *)

(* --- Esempio di composizione di funzioni higher order - NELLE SLIDE*)

(* --- Tipi Custom *)

(* - Tuple e record sono Tipi Algebrici, essendo definiti come PRODOTTO CARTESIANO *)

(* --- TUPLE: *)

type date = int*int*int ;; (* conta la posizione, non avendo nomi gli elementi, effettuo accesso per posizione *)

let controlla_data (d:date) =
  match d with
  | gg,mm,aaaa -> gg>0 && gg<=31
               && mm>0 && mm<=12
               && aaaa>1900 && aaaa<=2030 ;;

(* --- RECORD: *)

type punto_2d = {x: float; y:float} ;; (* non conta la posizione, avendo nomi gli elementi, dunque oltre i 4/5 elementi
vale la pena utilizzare un record perchè effettuo accesso per nome *)

let p = { x = 3.; y = -4. } ;;

(* Dato un punto voglio trovare il quadrante, posso quindi accedere ai campi con record.campo *)

let quadrante punto =
  match punto.x >= 0. && punto.y >= 0. with
| true,true -> 1
| false,true -> 2
| false,false -> 3
| true,false -> 4 ;;

(* Sono differenti dagli oggetti dei soliti linguaggi perchè 
1: i RECORD sono IMMUTABILI
2: non sono presenti metodi dei record *)

(* - Functional Update di record *)

type persona = {nome:string;cognome:string;via:string;citta:string} ;;

let padre = {nome:"Mario" ; cognome:"Rossi" ; via:"Via Bianchi" ; citta:"Roma"} ;;

let figlia = { padre with nome = "Bianca" } ;;

(* --- Tipo Variant *)

type numero_testo =
    | Txt of string (* Txt etichetta, detta costruttore *)
    | Num of int ;; (* Num etichetta, detta costruttore *)

let x = Txt "34" ;;
let y = Num 26 ;;

(* Bisogna distinguere le operazioni da effettuare in una funzione per ogni tipo *)

(* In questo modo sono definibili le ENUM in OCaml, inserendo solo i costruttori *)

type giorno = Lun | Mar | Mer | Gio | Ven | Sab | Dom ;;