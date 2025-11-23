## Lezione I - Gestione a Pagine e Gestione Strutture di Memorizzazione

DBMS è un sistema software che gestisce grandi quantità di dati che devono essere persistenti e condivisi

Verranno trattate gestione dei dati, delle interrogazioni, della concorrenza e dell'affidabilità. Si va in verticale su questi argomenti per ciascuna lezione.

La gestione fisica e logica non è uguale, solitamente fisicamente è gestita per correlazione in pagine. L'accesso deve essere gestito in maniera efficiente, tramite strutture dati, buffer in memoria e gestione efficiente di query.


Le memorie a disco sono caratterizzate da tempi influenzati dal posizionamento delle testine sui settori del disco.

### Gestione a Pagine

- **Pagina (o Blocco)**: Sequenza contigua di settori su una traccia e costituisce un unità per l'I/O per il trasferimento di dati.
    - **Tempo di Trasferimento di Pagina**: Ogni dispositivo quindi è caratterizzato da un tempo di trasferimento di pagina. Il dimensionamento delle pagine e il modo in cui i dati sono posizionati in memoria influenzano i tempi di recupero di quelle informazioni.

- Gestione Memoria Permanente e Gestore del Buffer
    - **Gestore Memoria Permanente**: Astrazione per cui insiemi di file sono composti di pagine fisiche, astraendo dal tipo specifico di disco.
    - **Gestore del Buffer**: Gestione trasferimento da memoria permanente a temporanea.
        - **Area delle Pagine**: Si mantengono dei campi per metainformazioni sulla pagina nel buffer, come `nome` oppure flags `pinCount`, `dirty`.
        - **Gestione Rimpiazzamento nel Buffer**: Solitamente a tempo di riempimento di buffer, si applicano delle politiche (solitamente LRU), ma in alcuni casi nella join LRU sarebbe poco efficiente, quindi i DBMS preferiscono la **MRU** (Most Recently Used).
        - **Struttura di Pagina**: La struttura logica di una pagina è un area che contiene le stringhe che rappresentano i record. Per dereferenziare un record quindi utilizzeremo una **coppia** definita come (PID pagina, posizione nella pagina).
        - **Slot di Pagine**: Posso dereferenziare record passando prima per lo slot (come se facessi `*slot`) e successivamente `*offsetPagina`.
    
### Gestione di Strutture di Memorizzazione

- **Organizzazione Seriale vs Sequenziale**:
    - **Organizzazione Seriale**: Basato su Heap, **non rispetto alcun ordine**, dipende dal ordine di inserimento. È inefficiente sulle operazioni di query successive, perchè non si possono fare assunzioni sulla posizione dei dati.
    - **Organizzazione Sequenziale**: Basato su una **struttura ordinata**, quindi più costoso in aggiornamento ma meno costoso a tempo di query.

    Quindi la scelta di seriale/sequenziale viene fatto in base a se si modifica o si legge più spesso.

- **Organizzazione per Chiave**: Noto il valore della chiave, trovo il valore della chiave a tempo 1. Questo può essere definito in maniera procedurale (hash) o tabellare (indicizzazione).
    - **Metodo Procedurale Statico (Hash)**: Utilizzo una funzione $h(k)$ con $k$ valore della chiave per indirizzare la pagina. Questo causa delle collisioni, che in questo contesto assumiamo che vengano risolte in chaining. Questo non è efficiente per ricerche basate su intervalli, perchè una sequenza $XXX1, XXX2, XXX3$ verrebbe splittata in 3 pagine diverse. Ho quindi dei tradeoff.
    - **Metodo Tabellare**: Si usa un indice, ossia un **insieme ordinato** di coppie $k, r(k)$ dove $k$ è chiave e $r(k)$ è riferimento al record con chiave $k$. Questo solitamente è gestito con un B+ albero.