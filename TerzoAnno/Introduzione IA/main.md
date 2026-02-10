# Lezione 1 - Introduzione al Corso - 05/02/2025

Cenni storici ed introduzione. Vedi slide.

# Lezione 2 - Agenti - 05/02/2025

## Agenti ed Ambiente

- **Agente**: Un agente razionale **percepisce** il suo **ambiente** tramite **sensori** ed agisce sull'**ambiente** tramite **attuatori**.

    Questi possono avere intenzioni e credenze specifiche, questi possono essere sia fisici che virtuali.
- **Percezione e Sequenza Percettiva**: La percezione singola è l'acquisizione di informazioni sull'ambiente da parte dell'agente.
- **Scelta dell'Azione**: Dipende da cosa l'agente ha percepito fino ad ora e cosa ha come conoscenza iniziale.
- **Funzione/Programma Agente**: La funzione agente è una funzione matematica astratta, mentre il programma agente è l'implementazione concreta. Il nostro obiettivo è quello di **implementare** il **programma agente**.

### Razionalità degli Agenti

L'obiettivo è che l'agente interagisca in maniera corretta nell'ambiente secondo **parametri di valutazione oggettiva**.
- **Misura prestazione esterna**: Come vogliamo che il mondo evolva.

**Definizione** di **razionalità** basata su 4 fattori:
- **Misura di Prestazione**: Definisce criterio di successo.
- **Conoscenza Pregressa**: dell'ambiente da parte dell'ambiente.
- **Azioni**: che l'agente può eseguire.
- **Sequenza Percettiva**: dell'agente fino all'istante corrente.

**Definizione di Agente Razionale**: per ogni sequenza di percezioni compie l’azione che massimizza il valore atteso della misura di prestazione considerando le sue percezioni passate e la sua conoscenza pregressa.

Questo **non implica l'onniscenza o l'onnipotenza** dell'agente, ma deve essere in grado di imparare man mano che acquisisce più **percezioni** ed **esperienza**.

### Natura degli Ambienti

Gli **ambienti** sono in realtà **definiti come problemi**, cercando di descrivere le caratteristiche del problema, detto anche ambiente operativo, in cui l'**agente deve operare**.

- **Descrizione PEAS**: Descrizione dell'ambiente operativo:
    - **Performance**: Misura di prestazione.
    - **Environment**: Ambiente.
    - **Actuators**: Attuatori.
    - **Sensors**: Sensori.

- **Proprietà degli Ambienti**:
    - **Osservabilità**: 
        - **Ambiente Completamente Osservabile**: I sensori dell'agente permettono di capire lo stato completo dell'ambiente in ogni momento. Se riesce a percepire tutto in maniera completa, non bisogna che l'agente memorizzi tutti gli aspetti acquisiti sull'ambiente.
        - **Ambiente Parzialmente Osservabile**: L'agente non può acquisire in ogni istante tutto, quindi bisogna memorizzare le informazioni acquisite.
    - **Molteplicità di Agenti**: 
        - Bisogna distinguere cosa sia e cosa non sia un agente nell'ambiente.
        - **Sistemi Multiagente Competitivo**: Ambienti multiagente competitivi potrebbero scontrarsi tra loro per massimizzare la propria misura di prestazione.
        - **Sistemi Multiagente Cooperativo**: Gli agenti collaborano per massimizzare la misura di prestazione.
    - **Predicibiltà**:
        - **Deterministico**: Stato successivo completamente determincato dallo stato corrente e dall'azione.
        - **Stocastico**: Esistono degli elementi di incertezza con probabilità associata.
        - **Non Deterministico**: Esistono vari esiti possibili di una stessa azione, ma non in base ad una probabilità definita.
    - **Episodico/Sequenziale**:
        - **Episodico**: Esperienza agentica suddivisa in eventi atomici.
        - **Sequenziale**: Ogni azione influisce la successiva azione.
    - **Ambiente Statico/Dinamico**:
        - **Statico**: L'ambiente non cambia mentre l'agente pensa l'azione.
        - **Dinamico**: L'ambiente cambia mentre l'agente pensa l'azione.
        - **Semidinamico**: L'ambiente non cambia ma la valutazione della prestazione si, ad esempio il tempo che scorre in un gioco influisce sulla valutazione della prestazione finale.
    - **Stati Discreti/Continui**: Se gli stati definiti sono discreti, o stati continui, come il tempo.
    - **Ambiente Noto/Ignoto**: ** vedi slide **

Gli ambienti possono essere simulati per testare l'agente.

### Struttura di Agenti

L'**agente** quindi è definito come $Agente = Archiettettura + Programma$, dove il programma è la funzione $Programma: Percezione \to  Azione$

- **Agente su Tabella**: Si basa sull'accesso all'azione definita in pseudocodice come

    ```
    azione = tabella.get(percezione)
    ```

    Ma questo andrebbe in contro ad un esplosione combinatoria, il gioco degli scacchi dovrebbe ad esempio portarsi dietro tutte le possibili combinazioni (sono tante).

- **Agente Reattivo Semplice**: Si **ignora** la **memoria pregressa**, ma si sceglie l'azione in base all'attuale acquisizione e all'insieme di regole. Questo ci permette di scalare, dato che dovranno essere memorizzate solo le regole, non tutte le possibili sequenze.

<div style="text-align: center;">
    <img src="img/agenteReattivoSemplice.png" width="350">
</div>

- **Agente Basato su Modello**: L’agente mantiene uno stato interno che serve per tenere traccia della parte del mondo che non può vedere all’istante corrente. Lo stato dipende dalla storia delle percezioni.

<div style="text-align: center;">
    <img src="img/agenteBasatoSuModello.png" width="350">
</div>

- **Agente Con Obiettivo**: Oltre allo stato, l'agente ha anche un goal, quindi gli obiettivi e la componente di come cambia il mondo eseguendo un azione.

<div style="text-align: center;">
    <img src="img/agenteConObiettivo.png" width="350">
</div>

- **Agente con Funzione di Utilità**: Per dare un peso in termini di utilità agli obiettivi, che potrebbero essere molteplici, si utilizza una **funzione di utilità** con codominio sui reali, per settare ipotetiche priorità tra i vari obiettivi.

<div style="text-align: center;">
    <img src="img/agentiConUtilità.png" width="350">
</div>

- **Agenti che Apprendono**: Qualsiasi tipo di agente visto finora può essere
costruito come agente in grado di apprendere. Un agente capace di apprendere può essere diviso in quattro componenti astratti.

<div style="text-align: center;">
    <img src="img/agenteApprende.png" width="350">
</div>

### Tipi di Rappresentazioni di Ambienti

Esistono varie rappresentazioni di ambiente dell'agente:
- **Atomica**: Ogni stato del mondo è indivisibile.
- **Fattorizzata**: Si suddivide in insiemi di variabili o attributi, ed ognuno di questi può avere un valore.
- **Strutturata**: Suddivide ogni stato in un insieme fissato di variabili o attributi, ognuno dei quali può avere un valore e delle relazioni con altre variabili. 

## Risolvere Problemi con la Ricerca

**Ricerca**: Processo computazionale condotto da un agente risolutore di problemi.

Si **assumono** degli **ambienti semplici**: episodici, a singolo agente, completamente osservabili, deterministici, statici, discreti e noti.

**Algoritmi Informati/Non Informati**: Se l'agente è in grado rispettivamente di identificare o non identificare la distanza dall'obiettivo.

- **Processo di Risoluzione**
    - **Formulazione obiettivo**: Obiettivo da raggiungere.
    - **Formulazione problema**: Elaborazione di un modello astratto descrivendo il mondo reale.
    - **Ricerca**: Simulazione in sequenze di azioni, fino a che non trova una sequenza che conduce all'obiettivo.
    - **Esecuzione**: Eseguire le azioni specificate nella soluzione.

### Definizione Problemi di Ricerca e Soluzioni

Possiamo definire un problema di ricerca tramite 6 elementi:

- **Spazio degli stati**: Insieme di possibili stati in cui si può trovare l'ambiente.
- **Stato iniziale**: Lo stato in cui si trova l'agente inizialmente.
- **Stato obiettivo**: Può essere uno solo o più di uno, quindi qualcosa del genere $goalTest(state) \in \{ True, False \}$
- **Azioni**: Insieme finito di azioni che possono essere eseguite in uno stato. Ad esempio $Azioni(Stato) = \{ Azione_1, \cdots, Azione_n \}$
- **Modello di transizione**: Descrizione dell'azione, del tipo $Risultato(Stato, Azione) = Stato^{I}$
- **Funzione Costo**: Definisce il costo di eseguire una specifica azione partendo da uno specifico stato: $CostoAzione(Stato, Azione, Stato^{I})$

Quindi un **cammino** rappresenta una **sequenza di azioni**, una **soluzione** è un **cammino** che parte dallo **stato iniziale** ed arriva ad uno **stato obiettivo**. Tra tutte le soluzioni ne esiste una **ottimale**, ossia di **costo minimo**.

# Lezione 3 - Algoritmi di Ricerca e Strategie Ricerca non Informata - 10/02/2025

Ripartendo dalle definizioni della lezione successiva, ricordiamo che $\text{spazio stati} \neq \text{albero di ricerca}$

## Algoritmo di Ricerca

- **Espansione di un Nodo**: Considerando le azioni disponibili nello stato corrispondente, si genera un nuovo nodo figlio nell'albero di ricerca in corrispondenza di ciascuna delle azioni possibili dato lo stato corrente.
    - **Frontiera**: insieme dei nodi generati ma non ancora espansi. Frontiera perchè rappresenta un confine tra **regione interna** espansa e **regione esterna** di stati non ancora raggiunti.
    - **Stati Raggiunti**: stati del grafo per cui esiste un corrispondente generato nell'albero di ricerca.

    <div style="text-align: center;">
    <img src="img/nodiFrontiera.png" width="400">
    </div>

    Quindi una ricerca va avanti espandendo ogni volta un nodo della frontiera. L'**algoritmo di ricerca** specifico quindi si occuperà di **scegliere quale** tra i **nodi di frontiera bisogna sviluppare**.

### Strategia Best-First

Si sceglie il nodo sulla frontiera in cui $f(n)$ ha valore minimo:
- **Nuovo nodo non raggiunto**: sicuramente viene aggiunto in frontiera.
- **Nuovo nodo già raggiunto**: viene aggiunto in frontiera solo se migliora il costo di valutazione.

Questo algoritmo iterativo conclude o con fallimento oppure con un cammino che porta ad un obiettivo.

Questa è più una strategia, non un algoritmo reale, perchè non abbiamo definito cosa sia la specifica $f(n)$, e si sta seguendo un approccio greedy.

<div style="text-align: center;">
    <img src="img/strategiaBestFirst.png" width="500">
</div>

### Strutture Dati per la Ricerca

- **Nodo**: Immaginando una struttura ad oggetto:
    - `n.stato`: Lo stato a cui corrisponde il nodo.
    - `n.padre`: Il nodo dell'albero di ricerca che ha generato il nodo corrente.
    - `n.azione`: L'azione applicata allo stato del padre per generare il nodo corrente.
    - `n.costoCammino`: Costo totale del cammino dallo stato iniziale a questo nodo.

- **Frontiera (Coda)**:
    - `frontiera.checkVuota`: ritorna true/false in base a se sia o meno vuota.
    - `frontiera.pop`: rimuove elemento in cima.
    - `frontiera.top`: riferisce l'elemento in cima.
    - `frontiera.add`: inserisce nodo secondo l'implementazione della coda.

    Esistono quindi implementazioni diverse di coda in base a che logica forniamo a questi metodiquindi ad esempio **coda con priorità** (su cui si basa la best-first), **coda FIFO** (su cui si basa la ricerca in ampiezza) o **coda LIFO** (su cui si basa la ricerca in profondità).

- **Stati Raggiunti (Tabella Lookup)**: Ogni stato è una chiave, ogni valore è il nodo per tale stato.

### Concetti di Stato Ripetuto, Ciclo, Cammini Ridondanti

- **Stato Ripetuto**: Stato che corrisponde a più nodi nello stesso cammino.

<div style="text-align: center;">
    <img src="img/statoRipetuto.png" width="300">
</div>

- **Cammino Ciclico**: Anche dato uno spazio degli stati finito, l'albero di ricerca generato è infinito a causa dei cicli.

<div style="text-align: center;">
    <img src="img/percorsoCiclico.png" width="350">
</div>

- **Cammino Ridondante**: Una via peggiore per raggiungere qualcosa di già raggiunto.
    - **Ricerca su Grafo**: Viene controllata la presenza di cammini ridondanti.
    - **Ricerca ad Albero**: Non viene controllata la presenza di cammini ridondanti.

    Esistono specifici **approcci** per controllare **cammini ridondanti**:
    - **Ricordare** tutti gli stati **precedentemente raggiunti**.
    - **Non preoccuparsi** dei **cammini ridondanti**.
    - Controllare presenza di **cammini ciclici** (sottocaso dei cammini ridondanti), ma non quindi il superinsieme di quelli ridondanti. Quindi questo è un po' una via intermedia tra i due approcci sopra.
        - Si potrebbe ad esempio controllare tramite la catena di puntatori mantenuta da tutti i nodi.

## Misure di Prestazione: Valutazione di Bontà Algoritmo

Quattro parametri per la valutazione di algoritmi:
- **Completezza**: Garantisce di riportare una soluzione, se esiste, e di riportare correttamente il fallimento, se esiste. Deve quindi procedere in maniera sistematica.
- **Ottimalità rispetto al costo**: (vedi slide)
- **Complessità temporale**: (vedi slide)
- **Complessità spaziale**: (vedi slide)

### Misurazione della Complessità

Se il grafo viene espresso in maniera esplicita allora la complessità è formulata in termini di $|V| + |E|$, ma in pratica si misura in termini di:
- **Profondità dell'albero generato (d)**: quindi dimensione in numero di azioni di una soluzione ottima.
- **Massima profondità (m)**: Numero massimo di azioni in un qualsiasi cammino $(d \leq m)$.
- **Branching Factor (b)**: Numero di successori di un nodo.

## Algoritmo Ricerca in Ampiezza

Appropriata quando tutte le azioni hanno lo stesso costo.

- **Implementazione 1**: Tramite istanziazione della BestFirst, settando $f(n) = depth(n)$.
- **Implementazione 2**: Tramite utilizzo di una coda FIFO per la frontiera, dove i nodi inseriti nella frontiera verranno espansi in ordine di inserimento.
    - Questi nodi raggiunti quindi non verranno mantenuti in una lookup table, ma tramite la coda stessa.
    <div style="text-align: center;">
    <img src="img/implAmpiezza2.png" width="400">
    </div>

### Analisi Misure Prestazione Ricerca in Ampiezza

- **Completa**: ricerca sistematica
- **Ottima rispetto al costo**: Se ogni azione costa 1, allora lo è, altrimenti non è ottima.
- **Costo Temporale e Spaziale**: Scala esponenzialmente, data la $b$ branching factor allora $\sum_{i=0}^d b^i = O(b^d) $. Quindi il **costo in memoria è esponenziale**. Quindi può essere utilizzato solo su istanze piccole.

## Algoritmo di Dijkstra (a Costo Uniforme)

Va bene se le azioni hanno tra loro costi diversi.

Si può **implementare tramite bestFirst** con $f(a)$ settata come costo del cammino dalla radice fino al nodo corrente.

<div style="text-align: center;">
    <img src="img/dijkstraImpl.png" width="500">
</div>

### Analisi Misure Prestazione Ricerca a Costo Uniforme

- **Completa**: è sistematica, e non entra mai in ciclo infinito sull'assunzione che ogni costo sia sempre positivo.
- **Ottima rispetto al costo**: La prima soluzione che trova ha un costo basso almeno come quello di ogni altro nodo sulla frontiera.
- Complessità:
    - $C^*$: costo della soluzione ottima.
    - $\epsilon$: limite inferiore imposto al costo di ogni azione
    - $floor(\frac{C^*}{\epsilon})$: numero maggiore possibile di azioni che servono per raggiungere il costo della soluzione ottima. Ci permette di supporre una profondità massima.
    - **Costo in tempo e spazio**: $O^{1+floor(\frac{C^*}{\epsilon})}$, scala quindi esponenzialmente.

## Algoritmo Ricerca in Profondità

Si sviluppa il nodo più in profondità.

- **Implementazione 1**: Tramite istanziazione della BestFirst, settando $f(n) = -depth(n)$.
- **Implementazione 2**: Tramite utilizzo di una coda LIFO, quindi tramite ricerca ad albero senza tabella dei raggiunti.

### Analisi Misure Prestazione Ricerca in Profondità

- **Completa**:
    - Per spazi degli stati finiti e che sono alberi, è completa ed efficiente.
    - Per spazi degli stati aciclici resta sistematica
    - Per spazi con cicli può bloccarsi in cicli infiniti
    - Per spazi **stati infiniti non è sistematica**, quindi **incompleta**.
- **Costo in Tempo e Spazio**: Devo tenere in memoria solo la frontiera, quindi **memoria** $O(bm)$, mentre **tempo** O(b^m)
    - In caso di **backtracking**, espandendo un nodo viene generato solo un successore e si ricorda quale deve essere generato in seguito, passando in **memoria** a $O(m)$.

## Algoritmo Ricerca in Profondità Limitata

Si basa su un limite settato $l$ di profondità, per evitare che quest'ultimo si perda in un cammino infinito. Il valore $l$ può essere scelto in base a:
- In base alla conoscenza del problema
- Diametro dello spazio degli stati

<div style="text-align: center;">
    <img src="img/algoritmoProfonditaLimitata.png" width="450">
</div>

### Analisi Misure Prestazione Ricerca in Profondità Limitata

- **Completezza**: Dipende dalla scelta di $l$.
- **Non Ottimale**.
- **Complessità Temporale**: $O(b^l)$
- **Complessità Spaziale**: $O(bl)$

## Algoritmo Ricerca ad Approfondimento Iterativo

Si cerca iterativamente il valore di $l$ invocando l'algoritmo definito prima, quindi a ricerca limitata.

<div style="text-align: center;">
    <img src="img/algoritmoProfonditaLimitata.png" width="450">
</div>

Questo potrebbe sembrare uno spreco di iterazioni, ma aumentando profondità sappiamo che l'algoritmo in profondità scala esponenzialmente, quindi in relazione a questo le iterazioni in più non sono significative.

### Analisi Misure Prestazione Ricerca ad Approfondimento Iterativo

- **Completezza**: Completa su spazi di stati aciclici finiti, o su qualsiasi spazio degli stati finito se controlliamo la presenza di cicli risalendo l'intero cammino.
- **Ottima per problemi** in cui tutte le **azioni** hanno lo **stesso costo**.
- **Complessita Temporale**: $O(b^d)$ se esiste una soluzione, $O(b^m)$ se esiste una soluzione.
- **Complessita Spaziale**: $O(bd)$ se esiste una soluzione, $O(bm)$ se non esiste.

## Direzione della Ricerca

Esiste ricerca in avanti $ statoIniziale \to obiettivo $ o all'indietro $ obiettivo \to statoIniziale $.
- **All'indietro** si può applicare solo se l'obiettivo è ben definito.
- **In avanti** quando ci sono più obiettivi

### Ricerca Bidirezionale

Stesso algoritmo ma due problemi di ricerca, dove nel **forward** si **setta normalmente stato iniziale e obiettivo**, mentre nel **backward si invertono** questi due.

Si procede quindi in entrambe le direzioni fino ad incontrarsi.

Bisogna quindi tenere traccia di **due frontiere** e **due tabelle di raggiunti**.

Non si procede però espandendo due nodi contemporaneamente, si sceglie infatti un solo nodo in una delle due frontiere.

### Analisi Misure Prestazione Ricerca Bidirezionale

- **Complessità Tempo**: $O(b^\frac{d}{2})$.
- **Complessità Spazio**: $O(b^\frac{d}{2})$.

## Confronto Complessivo Misure Prestazione degli Algoritmi

<div style="text-align: center;">
    <img src="img/confrontoAlgoritmi.png" width="500">
</div>

Quindi tutti questi sono detti di ricerca non informata perchè si basano solo sulla definizione del problema.