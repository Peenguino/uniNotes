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

