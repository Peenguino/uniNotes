# Lezione 1 - Introduzione al Corso - 02/02/2026

Cenni storici allo sviluppo web, eventualmente vedi `PDF 01` del corso.

# Lezione 2 e 3a - HTML e CSS - 04/02/2026

`Basato sul PDF 03`

## HTML come Linguaggio di Markup

Descrizione di una **pagina web** tramite un **albero di Elements**. 

Un oggetto **Document** rappresenta un **documento HTML**.

La descrizione è semantica perchè un titolo, con token title indica sia come token che come significato che è un titolo.

### Struttura base Head e Body

Definito da `head` e `body`

### Elementi ed Attributi

- **Elementi**:

    Si basano sull'utilizzo dei tag di apertura/chiusura, non tutti hanno bisogno di essere chiusi.

    ```HTML
    <tag attr1 attr2 … attrn>content</tag>
    <tag attr1 attr2 … attrn>
    ```

- **Attributi**:

    Una particolarità è che possiamo utilizzare un prefisso come `&` oppure `#` per riferire al simbolo relativo nella unicode, questo procedimento è detto **character reference**.

## Content e Tipologie

Esistono vari tipi di contenuto, ad esempio:
- **Metadata Content**: No rendering, informazioni meta non renderizzate.
- **Flow Content**: Contenuto effettivo renderizzato.
- **Sectioning Content**: Definiscono gli elementi di header e footer.
- **Embedded Content**: Contenuto multimediale della pagina.
- **Interactive Content**: Definito per l'interazione dell'utente (audio, buttons...)

**Dialog vs Modale**: Rispettivamente il primo non blocca l'interazione con il resto della pagina mentre il secondo si, sono entrambe finestre che appaiono nella pagina.

**img vs svg**: Il primo è un immagine definita come "matrice di pixel", la seconda è vettoriale, quindi il tutto è definito da funzioni matematiche, quindi allo zoom non si perde risoluzione.

**Forms**: Permette l'interazione con un server tramite anche attributo `action` e `method`, in questo modo si possono passare informazioni.

**Gestione Input**: Options, Radio/Checkbox, File, Range ...

**Tag Script**: Permette l'inserimento di JS.

## CSS - Cascade Style Sheets

Permette la definizione di stile in base al tipo di media, grazie ad esso si può ruotare ad esempio un elemento HTML.

- **Selettori/Dichiarazioni**: Insieme di regole ciascuna definita come lista di **selettori** e da un insieme di **dichiarazioni**:

    ```CSS
    h1 { /* Selettore */
        color: blue; /* Dichiarazione */
    }
    ```

- **Cascading**:

    Definite come regole cascading perchè segue a cascata l'ordine in cui vengono definite, quindi l'ultima definita sarà quella utilizzata.

    Esiste un costrutto `!important` che si svincola da questo ordine predefinito.

    ```CSS
    p {
        color: blue;
    }

    p {
        color: red; /* quella che ha importanza di default */
    }
    ```

- **Gerarchie e Classi di Selettori**: Possiamo definire gerarchie tra selettori di regole, e questi possono essere identificati in maniera univoca tramite `id` oppure tramite `pseudoclassi`. Queste possono essere utilizzate tramite operatore `:`, quindi `selettore:pseudoclasse` istanziando potrebbe essere `selettore:first-child`

- Il **CSS** può essere utilizzato **inline**, **internamente** al file tramite tag `<style>` oppure **esternamente** linkandolo.

- **CSS**: unità di misura, può essere assoluta
    - **Assoluta**: cm, inch, mm
    - **Relativa**: em (in base al font), rem (relativo alla dimensione del font), vw, wh (relativo alla dimensione whidth ed height) della viewport.

- **Box Model**: Ogni elemento HTML è avvolto in un box di layer:
    - **Content**: Contenuto del box.
    - **Padding**: Spazio attorno al contenuto, tra content e border.
    - **Border**: Bordo attorno a padding e contenuto.
    - **Margin**: Lo spazio all'esterno del bordo.

- **Box Model Positioning**: Specifica il posizionamento da usare per un elemento, ne esistono di 5 tipi:
    - `static`: Posizionamento statico di default
    - `relative`: Grazie a top, botto, left, right possiamo spostare l'elemento rispetto al suo posizionameto originale.
    - `absolute`: Posiziona l'elemento in base al più vicino antenato.

- **Flex Layout**: Dopo le prime versioni di CSS, viene portato il layout flex che permette di distribuire elementi a colonne, oppure righe. Si definisce quindi tutto in relazione ad un asse principale, che può essere x oppure y.

- **Grid Layout**: Permette la definizione bidimensionale di layout di elementi, definita da questi elementi principali:
    - **Line**: Linee orizzontali e verticali che dividono la griglia.
    - **Cell**: Unità più piccola della rappresentazione a griglia.
    - **Area**: Area rettangolare composta da una o più grid cell.
    - **Track**: Spazio tra due griglie adiacenti.
    - **Gutter**: Spazio tra le cell.

### Frameworks CSS

- **Bootstrap**: Classico framework che fornisce classi predefinite e forniva supporto al responsive design.
- **TailwindCSS**: Framework basato su mattoncini atomici, basato quindi sulla costruzione di componenti un po' più complessi, quindi più modulare e moderno.
- **SASS**: Linguaggio compilabile in CSS, che permette la definizione di annidamento o utilizzo di variabili, che nativamente non era supportato dal CSS.

# Lezione 3b - JavaScript - 09/02/2026

`Basato sul PDF 04`

- **nodejs**: Ha portato lato server l'interprete javascript ed oltre a questo ha permesso cose che prima non erano permesse per questioni di sicurezza, come l'accesso ai file.

- Come tutti i **global object** che abbiamo già visto, come **Math e JSON**, esiste anche la **window** in **contesto web**.

- **Chiusura di tipo statico**, quindi variabili libere vengono risolte a tempo di dichiarazione e non a tempo di chiamata di funzione, portandosi dietro la dichiarazione delle variabili a tempo di dichiarazione delle funzioni.

# Lezione 4 - JavaScript - 16/02/2026

## JSON

Formato standard per interscambio di dati, prima di `JSON` si utilizzava `XML`, ma è stato quasi del tutto sostituito.

### Differenze tra Object JS e JSON

- **Object Literal**: 
    - È un oggetto
    - Il nome delle proprietà può essere un numero o una sequenza di caratteri
    - Il nome delle proprietà può essere una regexp
    - Il nome delle proprietà può essere undefined
    - Il nome delle proprietà può essere una funzione
- **JSON**:
    - Statico, quindi può essere un numero o una sequenza di caratteri ma non tutti gli altri.

### Classi e Prototipi

L'ereditarietà si basa sulla catena dei prototipi, l'utilizzo dei costrutti come `Class` è zucchero sintattico per effettuare lo stesso tipo di operazione.

### Higher Order Functions

In JS sono presenti `map`, `forEach`, `reduce`...

## Promises

Permette la gestione di computazioni asincrone, ha **tre stati**:
- **pending**: stato iniziale
- **fulfilled**: successo
- **rejected**: fallimento

Le promises hanno hanno dei **fate**, ossia `resolved` oppure `unresolved`.

Utilizzeremo in serie `.catch()`, `.then()`, ma se vogliamo farlo sia in caso di fallimento che di successo allora utilizziamo `.finally()`, che viene eseguita in caso di `settled`.

### Async/Await

Sintassi alternativa per la computazione asincrona.

- `async function`: Dichiarazione di una funzione che restituisce una `Promise`. Oltre a questo ci permette di utilizzare await all'interno della funzione.
- `await`: attende che la promise sia risolta prima di continuare. Perdiamo quindi la possibilità formalmente di gestire in parallelo più promises, in realtà no però perchè potrei far seguire ad un await una `.all()`, ad esempio.

## Event Loop

Tutto il runtime di JS si basa su quattro oggetti principali:
- **Stack**: Implementa la pila dei frame d'attivazione delle funzioni. A tempo di `return` tutte le variabili locali ad una funzione vengono rimosse, a meno di chiusure.
- **Heap**: Zona di memoria di allocazione della memoria, allocata e deallocata automaticamente dal garbage collector.
- **Queue**: Lista messaggi da processare, modo in cui quindi vengono gestite le `setTimeout()` o altri eventi. Quando viene selezionato quel messaggio nella coda viene handlato dalla funzione passata.
- **Event Loop**: L'event loop non è nient'altro che un while che si occupa di effettuare delle pop dalla queue.
    - Tutti gli eventi standard, come l'utilizzo del click del mouse hanno degli handler associati.
    - Gli eventi senza handler associati vengono ignorati.
    - Gli iframe e di web worker sono delle eccezioni, perchè hanno i loro stack, heap e queue.

### Gestione con Observer Pattern

Sistema ad eventi si basa su due attori principali, `Observer` e `Subject`, dove il `Subject` quando varia il proprio stato deve notificare gli `Observer`.

<div style="text-align: center;">
    <img src="img/observerPattern.png" width="400">
</div>

## Gestione a Moduli di JS

In origine non esisteva alcuna gestione a moduli, ma permette più riusabilità la gestione a moduli.

Esistono vari approcci a pattern:

- **Module Pattern**: Esponiamo le funzionalità attribuendole ad un oggetto globale tramite dichiarazione come primo comando eseguito.
- **CommonJS**: Primo approccio a moduli effettivi, ma sincrono.
- **AMD**: Asynchronous Module Definition, che si basa sull'utilizzo della `define()`, che ha bisogno di specifici argomenti per definire un modulo. Oltre a questo si basa RequireJS, come file che si occupa di questa operazione.

In sintesi dei pro di ciascuno di questi pattern è nato **Browserify**, che permette di gestire tutto l'albero delle dipendenze in un `bundle.js` a cui riferità la pagina web.

- **UMD - Universal Module Definition**: Si occupa della gestione della coesistenza di gestione moduli, che a runtime si occupa di capire come sia stato importato un modulo, da utilizzare nel caso in cui si usassero più metodologie di import.

# Lezione 5 - DOM (Document Object Model) - 18/02/2026

Il **DOM** è una **rappresentazione gerarchica** della **struttura del contenuto** di un **documento Web**.

Quindi anche la **rappresentazione in memoria** di un **documento HTML**, e una **API** per la **manipolazione** di **documenti Web**.

La **gerarchia** segue uno **schema ad albero**, mantenendo tra le **risorse delle relazioni**.

Ogni DOM ha un nodo radice, esiste un rapporto tra DOM e JS, perchè è un astrazione (**global object window**) tramite la quale possiamo accedere agli elementi.

