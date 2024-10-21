(* 
--- Recap Pattern Matching
    - Function, serve per utilizzare il pattern matching
*)

(*
--- Definizione Induttiva della Lista e operazioni ricorsive
*)

(* - Reduce di una lista RIVEDI *)

(*
let reduceList list =
    let reduceListInterna list acc =
        match list with
        | [] -> acc
        | a::list1 -> reduceListInterna list1 acc+1;
    reduceListInterna list 0;
*)

(* --- Funzioni Higher Order *)

(* - Esiste almeno uno *)
let rec exists pred list =
    match list with
    | [] -> false
    | x::list' -> if pred x then true else exists pred list';;

(* - Per ogni, foreach *)
let rec foreach pred list =
    match list with
    | [] -> true
    | x::list1 -> if pred x then foreach pred list1 else false;;

(* - Filter - RIVEDI, provata con accumulatore in coda*)

let filter pred list =
    let rec recFilter pred list accList =
        match list with
        | [] -> accList
        | a::list1 -> if (pred a) 
            then recFilter pred list1 (a::accList) 
            else recFilter pred list1 accList
    in
    recFilter (fun x -> x mod 2=0) list [];;

(* - Map, molto parallelizzabile *)

let rec map f lis =
    match lis with
    | [] -> []
    | x::lis' -> f x::map f lis' ;;

(* - Fold Right 
    (f x1(f x2 (f x3(f caso_chisura))))
*)

let rec fold_right f list acc =
    match list with
    | [] -> acc
    | x::list1 -> f x (fold_right f list1 acc) ;; (* Come se stessimo srotolando la lista, nota l'assonanza con il commento sopra*)

