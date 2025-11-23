# Teoria della Normalizzazione 1 (Dipendenza Funzionale) - Lezione 05/11/2025

Come facciamo a dire se due schemi relazionali sono **equivalenti** o hanno determinate **caratteristiche di qualità**?

Con la normalizzazione si definiscono criteri formali per capire **equivalenze** ed **anomalie**.

La teoria della normalizzazione è particolarmente utile se si vuole mettere mani al progetto di una base dati già esistente.

## Linee Guida per una Corretta Progettazione

- **Ridondanza**: Non vogliamo che gli stessi dati si ripetano.
- **Semantica degli Attrbuti**: Capire bene a chi appartengano gli attributi.
- **Valori Nulli**: Evitare attributi che spesso usano valori nulli.
- **Tuple Spurie**: Vogliamo avere la possibilità di effettuare giunzioni senza generare tuple spurie, quindi deve esistere corrispondenza dopo una giunzione, voglio che si generi una n-upla che abbia senso.

Quindi bisogna evitare le tipologie di anomalie.

- **Obiettivo**: Strumenti formali per progettare basi di dati senza anomalie da un punto di vista teorico, astraendo dalla complessità del costo delle operazioni. Si seguono **3 principi**:
    - Equivalenza di schemi
    - Qualità degli schemi
    - Trasformazione degli schemi

**Schema di Relazione Universale**: Ha come attributi tutti gli attributi delle tabelle della base di dati.

Un po' di notazione è presente nelle slide.

## Dipendenza Funzionale

Per formalizzare la descrizione formale di uno schema, ossia come sono dipendenti i dati rispetto agli attributi.

Dato uno schema $R(T)$ e $X,Y \subseteq T $, una **dipendenza funzionale**  è un vincolo su R del tipo $X \rightarrow Y$ $$ \boxed{\forall t_{1}, t_{2} \in r \:\: . \:\: \text{se} \:\: t_{1}[X] = t_{2}[X] \Rightarrow t_{1}[Y] = t_{2}[Y]} $$

### Dipendenza Funzionale Atomica

Ogni dipendenza del tipo $X \rightarrow A_{1}A_{2} \cdots A_{n}$ allora può essere scomposta in dipendenze atomiche $X \rightarrow A_{1}, X \rightarrow A_{2}, \cdots, X \rightarrow A_{n}$

### Dipendenza Funzionale Banale

Se si imposta una dipendenza del tipo $X \rightarrow X$ allora questa è detta banale, quindi cosa c'è a destra non deve apparire a sinistra dell'operatore $\rightarrow$. 


Una **dipendenza funzionale** si può costruire **solo in uno schema relazionale**.

## Chiavi, Superchiavi, Chiavi Primarie

Vedi definizione formale nelle slide.

## Indici d'Anomalie date le Dipendenze Funzionali

- Se $r \: | = X \rightarrow Y$, non posso dire nulla su $X$ O $Y$, ma se $X$ non è superchiave per $R$ allora ho un anomalia su $R$, ossia ridondanza.

- Se $X$ è superchiave per $R$ allora $\forall \: r$ istanza valida di $R$ $r |= X \rightarrow T$

vedi le slide per approfondire la seconda e manca la terza di questi indici di anomalie.

Quindi definiamo $R(T,F)$ con $F$ insieme di dipendenze funzionali.

## Dipendenze Funzionali (vedi slide)

## Assiomatizzazione delle Dipendenze Funzionali con Corretto/Completo (vedi slide)

## Insieme di Regole di Inferenza (Assiomi di Armstrong) (vedi slide)

Sono **corrette** e **complete**.

- Riflessività
- Arricchimento
- Transitività

## Derivazione di Dipendenze Funzionali

Definizione di step di dipendenze basandosi sugli Assiomi di Armstrong, quindi nuove regole derivate:

- Unione
- Decomposizione
- Indebolimento
- Identità

## Teorema di Correttezza e Completezza Assiomi di Armstrong (vedi slide)

## Chiusura di un Insieme

- Chiusura di F

    Dato un insieme F di DF, la chiusura di F, denotata con $F^+$ è $F^+ = \{ A_i \in T \:\: | \:\: F |- X \rightarrow A_i \}$

- Chiusura di X rispetto ad F

$X_{F}^+ = \{ A_i \in T \:\: | \:\: F |- X \rightarrow A_i \}$

Il problema di chiusura di un insieme è di tipo esponenziale rispetto al numero di campi.

Questo non viene però calcolato algoritmicamente, esiste infatti un teorema

(vedi slide)

## Algoritmo della Chiusura Lenta (vedi slide)

Dati gli attributi A e D, applicando l'algoritmo della chiusura lenta, a quali posso arrivare utilizzando le dipendenze funzionali.

Nelle slide c'è un ottimo esempio di passi di derivazione dell'algoritmo della chiusura lenta.

## Definizioni di Chiave, Superchiave, Attributo Primo tramite Dipendenze e Chiusura (vedi slide, 3 definizioni)

**Definizione**: Dato lo schema R(T,F), un insieme di attributi $W \subseteq T$ è una superchiave di $R$ se $R \rightarrow T \in F^{+}$

- Trovare se un ... è chiave è NP-Completo

# Teoria della Normalizzazione 2 (Copertura Canonica e Composizione) - Lezione 17/11/2025

**Equivalenza**: Dati due insiemi di DF, questi si dicono equivalenti se $F^+ = G^+$.

## Copertura Canonica: 3 Proprietà Caratterstiche

### Attributo Estraneo

Data una DF del tipo $XA \to B$ se rimuovessi $A$ ma chiudendo $X$ ossia definendo $X^+$, se riuscissi ad arrivare comunque a $B$ allora $A$ è detto estraneo.

### Dipendenza Ridondante

$X \to Y$ è detta **dipendenza ridondante** se $(F - (X \to Y))^+ = F^+$. 

Quindi informalmente se tolgo una dipendenze funzionale dall'insieme delle DF, questa viene comunque coperta nella chiusura.

### Definizione Formale Copertura Canonica

F è detta una copertura canonica se

- Tutte le DF sono atomiche.
- Non esistono attributi estranei
- Nessuna dipendenza in F è ridondante

## Teorema di Esistenza della Copertura Canonica

Per ogni insime di dipendenze F esiste una copertura canonica.

Esiste algoritmo che esegue 3 fasi che mappano sulle 3 proprietà richieste. 

## Decomposizione di Schemi

Tramite la copertura canonica possiamo trovare ridondanze concettuali e logiche.

L'idea quindi è scomporre uno schema in schemi più piccoli che siano equivalenti a quello originale. 

Se faccio le decomposizione secondo solo le dipendenze funzionali allora decomponendo e poi applicando una join andrei a generare tuple spurie.

### Definizione Formale di Decomposizione di Schema

$ \rho = \{ R_1(T_1), \cdots, R_k(T_k) \} $ è una decomposizione di R se e solo se $T_1 \cup \cdots \cup T_k = T$

Ma vorremmo due proprietà sulle decomposizioni, ossia:

- **Conservazione dei dati semantica** (vedi slide con $\subseteq$ oppure $=$): Bisogna valutare se genero tuple spurie, definito come perdita di informazioni (anche se si direbbe il contrario, perchè sto generando più entry, ma semanticamente sto perdendo informazioni).

    Quindi la chiave è l'unico modo per avere una decomposizione senza perdita di informazione.

    Vedi slide su decomposizione senza perdite con teorema non formale e defiizione.

    - **Definizione Formale di Decomposizione Binaria**: Sia $R(T,F)$ uno schema di relazione, la decomposizione $\rho = \{ R_1(T_1), R_2(T_2)  \}$ preserva i dati se e solo se $T_1 \cap T_2 \to T_1 \in F^+$ oppure $T_1 \cap T_2 \to T_2 \in F^+$.

- **Conservazione delle dipendenze**: Tutte le DF dello schema originale hanno dominio di attributi che non viene splittato tra le decomposizioni, ma solo in una dei sottoschemi.

    Vedi slide pag 107-108 di quelle anno 2024/25 per definizioni formali.

Quindi una decomposizione dovrebbe sempre soddisfare **decomposizione senza perdite**, che garantisca la ricostruzione senza tuple spurie, e **conservazione delle dipendenze**, che garantisce vincoli di integrità di dipendenza funzionale originari.

# Teoria della Normalizzazione 3 (Forma Normale di Boyce Codd e Algoritmo di Analisi) - Lezione 17/11/2025

## Forma Normale di Boyce Codd

- Vedi definizione di Boyce Codd nelle slide

## Algoritmo di Analisi

Input: uno schema $R(T,F)$ con F in copertura canonica
Output: una decomposizione $\rho$ in BCNF (Boyce Codd Normal Form) che rispetta la conservazione dei dati.

Aggiungi definizione di partizionamento che non genera perdita di dati, teorema non formale nelle slide.

- Nella prima partizione ci metto la chiusura della parte dx della DF
- Nella parte sx mette tutto, meno la parte a dx e riaggiungendo l'elemento iniziale su cui ho calcolato la chiusura prima.

## Algoritmi per la Normalizzazione

Se esistono DF che coinvolgono tutti gli attributi ma non in BCNF, nessuna decomposizione può essere preservata, appunto perchè saremo costretti a splittarla.

Quindi si genera una terza forma di normalizzazione (3NF). È più permissiva, quindi non è necessariamente migliore della BCNF.

## 3NF - Terza Forma Normale

Definizione: $R(T,F)$ è in $3FN$ se per ogni $X \to A \in F^+$, con $A \notin X$, X è una superchiave **oppure** (in realtà è uno XOR, e questo rilassa il vincolo su cui si basava la BCNF) $A$ è primo.

Quindi la differenza la notiamo sulla proprietà necessaria per BCNF qui viene rilassata in XOR con un altra condizione.

Quindi questa forma normale tollera le ridondanze sui dati, cosa che non era vera per la BCNF.

## Decomposizione in 3NF - ALgoritmo di Sintesi

** Vedi slide **

## Dipendenze Multivalore (Argomento Supplementare)

La teoria delle normalizzazione fino alla 3NF può ancora generare della ridondanza nei dati in cui si cerca di mantenere informazioni su dipendenze multivalore, quindi a livello teorico esiste una 4NF che handla questa caratteristica in maniera formale, ma non è esplicitamente parte del programma del corso.



