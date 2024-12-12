(* --- Accenno di programmazione imperativa nell'OCaml *)

(* - Array mutabile *)

let arr = [|3,4,5|];;

(* - Variabili e Riferimenti REF *)

let x = ref 12;; (* Dichiarazione variabile mutabile *)
x := 100;; (* Assegnamento variabile mutabile *)

(* Bisogna essere attenti durante l'utilizzo della programmazione imperativa, deve essere incapsulata per non portare side effect indesiderati*)

(* Il try with non è propriamente try catch, ma è una sorta di approccio di pattern matching alle eccezioni e cosa sollevare
per ogni tipologia *)

(* - Assert solleva un eccezione se l'exp passata è false *)
