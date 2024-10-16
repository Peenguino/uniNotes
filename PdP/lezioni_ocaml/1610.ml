
(* --- Pattern Matching e Destrutturazione Liste
  - Esempi
    (x,y) -> (2,3) (3,4) ma non va in (1,2,3) oppure (4,5,6)
    3 -> nulla
    _ -> wildcard
*)
  let x = 5;;

  let negazione b =
    match b with
    | true -> false
    | false -> true;;

  let rec fib n = 
    match n with
    | 0 -> 0
    | 1 -> 1
    | _ -> fib(n-1) + fib(n-2);;

(* Decidiamo quindi in base alla struttura del dato che stiamo trattando, questo quindi spesso porta a valutare tutte le casistiche*)

  let first_true t =
    match t with
    | (true,_,_) -> 1
    | (false,true,_) -> 2
    | (false,false,true) -> 3
    | (false,false,false) -> -1;;

  (* Esempio con lista vuota *)

  let is_empty lis =
    match lis with
    | [] -> true
    | _ -> false;;
  
  print_endline (string_of_bool (is_empty [])) ;;

  (* - Esaustività dei pattern 
    E' consigliato essere esaustivi, quindi controllare ogni possibile caso
    in caso non sia possibile, a tempo di esecuzione, viene sollevata un eccezione dopo un warning a tempo di compilazione.
    Altrimenti è necessario definire un caso default con la wildcard _ *)

  (* - Function e Pattern Matching 
    Posso usare la parola chiave function*)

  (* - Smontare strutture dati
    Permette di destrutturare in base alla struttura descritta dal pattern e non in base ad un valore "semantico". *)

    let rec length lis =
      match lis with
      | [] -> 0
      | x::lis' -> 1 + length lis' ;;

    let rec contains x lis =
      match lis with
      | [] -> false
      | y::lis' -> if y=x then true
                    else contains x lis';;

(* --- Tail recursion *)

let fact_tr n =
  let rec fact_aux n acc =
    if n<=0 then acc else fact_aux (n-1) (n*acc)
  in fact-aux n 1;;

(* -- Passi per la tail recursion *)
(*  1. Trasformo la funzione ricorsiva in maniera nativa a funzione ausiliaria interna aggiungendo l'accumulatore (da foo a foo_aux)
    2. La funzione ausiliaria interna mantiene casi base e casi ricorsivi, con aiuto di un parametro aggiuntivo, l'accumulatore
    3. La funzione esterna chiama quella interna 
    4. La funzione interna è realmente ricorsiva e si autopassa due parametri, chiamata ricorsiva e accumulatore aggiornato
*)

let rev lis = 
  let rec rev_int list1 list2 =
    match list1 with
    | [] -> list2
    | a::list1' -> rev_int list1' a::list2
  in
    rev_accum list1 [] ;;

  (*let rec rim*) (* Rimuovere un numero dato di elementi *)
