# Il Processo Software

Il processo software inizia quando si inizia ad esplorare il problema e finisce quando il prodotto viene ritirato dal mercato.

Si compone quindi in fasi:

1. **Analisi Requisiti**
2. **Specifica**
3. **Progettazione**
4. **Implementazione**
5. **Integrazione**
6. **Mantenimento**
7. **Ritiro**

Quindi equivale alla **sequenza** di **attività** necessarie allo **sviluppo** di un **software**. Sicuramente, tra le fasi elencate sopra, saranno sempre necessarie quelle di **specifica**, **progettazione** ed **implementazione**, **validazione** ed **evoluzione**.

Solitamente si parla quindi di **modello di software**, ossia una sua **rappresentazione astratta** del **processo**. A volte questi modelli vengono standardizzati (es. Standard ISO 12207).

## Modelli Ciclo di Vita del Software

1. **Build & Fix**: Sistema software sviluppato **senza specifica/progettazione** che viene **modificato più volte** fino a quando non soddisfa il committente.

### Modelli Prescrittivi - Sequenziali

1. **Modello a Cascata**: Segue delle fasi ben definite, ossia:

    - Raccolta Requisiti
    - Progettazione Software
    - Implementazione e Testing
    - Integrazione di Funzionalità e Testing
    - Operatività e Mantenimento

    In alcune sue versioni prevedeva anche dei feedback loop che permettessero di mantenere più versatilità tra le fasi.

    Quindi con questo modello per la **prima volta** si distinguono **fasi ben definite** dello sviluppo software. Allo stesso tempo si genera un **eccessiva rigidità** e produzione di documentazione. Seguendo poi in maniera ideale questo schema, il prodotto non viene mai valutato in una sua versione parziale dal cliente, di conseguenza l'**interazione tra prodotto e cliente** nello **sviluppo** risulta essere **nulla**.

    Viene quindi ricordato perchè è il primo modello a strutturare delle fasi ben definite per lo sviluppo software.

2. **Modello a V**: Viene preso il modello a cascata e "spezzato" in modo tale da suddividere le attività in **analisi** a **sx** e **sintesi** a **dx**.

    <img src="img/modelloSpirale.png" width="500">

    - **SX**: Attività di analisi che scompongono le esigenze degli utenti in piccole parti.
    - **DX**: Attività di sintesi che aggregano e testano tali parti per verificare che il sistema soddisfi le esigenze degli utenti.
    - **CENTRO**: Progettazione dei test da svolgere dunrante le fasi di sviluppo.

    Questo ci permette di definire questo modello come test driven, dato che potremmo definire i test anche subito dopo aver scritto i requisiti.    

### Modelli Prescrittivi - Iterativi

3. **Rapid Prototyping**: Si basa sulla **creazione** di un **primo prototipo** da presentare al cliente per capire se sono stati ben **acquisiti i requisiti**. In caso negativo si reitera modificando il prototipo e ripresentandolo al cliente.

4. **Modello Incrementale**: I requisiti vengono pesati in base alle priorità, questo permette di rilasciare mano mano nuove versioni con implementazioni e feature prima non presenti, integrando e testando con passaggi incrementali.

    - **Pro**:
        - Ottengo subito prime versioni di software
        - Ottengo un feedback rapido sullo sviluppo e sui requisiti
        - Riduce il costo causato dai cambiamenti richiesti
    - **Contro**:
        - Poco chiaro lo schema di sviluppo
        - Rischio di ricadere nel Build & Fix

5. **Modello a Spirale**: Si itera su quattro fasi fondamentali:
    - Definizione di obiettivi
    - Valutazione rischi e possibili alternative
    - Implementazione e sviluppo
    - Definizione di una nuova iterazione

    Questo tipo di schema è detto **risk-driven** dato che ad ogni iterazione si valutano tutte le possibili scelte e rischi.

### Unified Process

Schema basato sulla gestione delle fasi dello schema a cascata in base al periodo corrente del prodotto software.

<img src="img/unifiedProcess.png" width="500">

### Modelli Agili

Prima di definire questi modelli ricapitoliamo le fasi "ideali" di un processo software:

1. **Specifica**: Estrazione ed analisi requisiti, specifica requisiti e convalida requisiti.
2. **Progettazione**: Progettazione dell'architettura del SW, del DB, delle intefacce tra i componenti e nel dettaglio dei componenti stessi.
3. **Sviluppo**: Spesso in interleaving a quella di progettazione, l'obiettivo è quello di sviluppare le componenti descritte sopra. Sono comprese in questa fase le azioni di programmazione e debugging.
4. **Validazione**: Bisogna dimostrare che i componenti sviluppati rispettino i requisiti raccolti all'inizio, di conseguenza vanno costruiti dei test.
5. **Evoluzione**: I requisiti possono cambiare, le tecnologie alla base si possono evolvere, di conseguenza vanno anticipati questi cambiamenti preservando la change tollerance, ossia la proprietà per cui il processo software non soffra in modo pesante questi cambiamenti.

Il **manifesto Agile** affronta diversamente il problema grazie a dei **principi**:

- **Customer Involvement**: Costante feedback al cliente, soprattutto durante le fasi di sviluppo.
- **Incremental Delivery**: Le varie versioni sono rilasciate incrementalmente.
- **People not Process**: I team di sviluppo dovrebbero essere lasciati liberi di agire "a modo loro".
- Nozioni di codice funzionante vince su grandi documentazioni.
- Aggiornamenti frequenti che cercano di stare al passo a cambiamenti frequenti di requisiti.
- Accettare la possibilita di cambiamento dei requisiti.
- Mantenere semplice il progetto così saranno più semplici le modifiche.

#### Caratteristiche dell'Agile
- Solitamente progetti piccoli/medi possono permettersi di seguire in maniera precisa l'Agile.
- Il cliente deve essere disponibile a questo tipo d'interazione continua.
- Il **CI/CD** (Continuous Integration/Continuous Deployment) e la figura del DevOps diventa fondamentale in questo contesto.

#### Esempi di Agile (XP, Scrum)

1. **Extreme Programming (XP)**: Approccio estremamente agile ed iterativo basato su caratteristiche come:
    - Nuove versioni più volte al giorno.
    - Incrementale sulle versioni.
    - Basato sul buildare -> testare -> runnare.
    - Piccole release che forniscano funzionalità di base del sistema.
    - Release frequenti ed incrementali di nuove funzionalità.
    - **Design semplice**: comprensibile e che soddisfi i requisiti.
    - **Test-first**: Casi di test prima del codice, spesso generati con framework per unit test automatici.
    - **Pair Programming**: Gli sviluppatori scrivono in coppia, dove chi non scrive "giudica" chi sta scrivendo.
    - **Refactoring continuo**: dato che codice semplice sarebbe anche semplice da sostituire come implementazione nuova ma mantenendo la semantica vecchia.
    - **Collective Ownership**: Tutti hanno responsibilità e permessi di modificare codice.
    - **Sustainable Pace**: No al troppo lavoro straordinario, essendo causa di calo di qualità.
    - **On-Site Customer**: Un rappresentante del cliente deve essere parte del team.

2. **Scrum**: Lavoro compatto di team, nome che richiama la fase di mischia del rugby:

    - **Figure Coinvolte**:
        - **Development Team**: Gruppo autogestito di sviluppatori, non dovrebbe superare le 7 persone.
        - **Product Owner**: Individuo che si occupa della raccolta requisiti e valuta le caratteristiche del prodotto software, non ha quindi controllo diretto sul lavoro dei dev, ma può valutarne il lavoro.
        - **Scrum Master**: Figura responsabile del processo Scrum, garantisce condizioni ambientali favorevoli ai dev e non ha responsabilità dirette sul prodotto.


    - **Fasi dello Scrum**:
        1. **Pre-Game Phase**: pianificazione di massima.
            - **Planning SubPhase**: Definizione del sistema che deve eessere sviluppato in termini di product backlog.
            - **Architecture SubPhase**: Design di alto livello, anche ad esempio dell'architettura.
        2. **Gestione degli Sprint - GamePhase - Sviluppo**: Ciascuno sprint contiene le fasi classiche di sviluppo software.
        3. **Post-Game Phase**: Conclude il processo di sviluppo e il prodotto viene preparato per il rilascio.

    - **Pro dello Scrum**:
        - Prodotto partizionato in pezzi gestibili
        - I requisiti non ancora stabili non richiedono progressi
        - L'intero team può vedere tutto
        - Il cliente ha costante feedback

- **Kanban**: suddivisione del to-do, doing, done, questo permette di prendere un
attività e portarla a termine, "astraendo" dalla precisione del fatto, bisogna che si inizi che che si finisca:
    - Work in progress limit, permette di definire un limite alle attività inserite in doing
    - Questo permette di risparmiare i context switch che risultano essere costosi