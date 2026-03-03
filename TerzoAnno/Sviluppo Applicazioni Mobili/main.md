# Lezione 01 - Introduzione al Corso e Storia di Android - 04/02/2026

- Android e Frammentazione: La gestione della frammentazione di tutte le versioni di Android è effetturata tramite degli API Level:
    - **API Level Minimo, Target e Massimo**, il massimo in realtà non è più utilizzato.

# Lezione 02 - Programmazione Android I, Architerrua OS ed App - 06/02/2026

## Architettura

- Basata su architettura a livelli
    - Non propriamente basata su servizi chiamati tra i livelli, ma il paradigma è inverso, è l'OS a chiamare le applicazioni.

- **Dalvik e ART**:
    - **Dalvik**: Macchina virtuale come una JVM, specifica di Android con a massimo ottimizzazioni di JIT, quindi l'ottimizzazione maggiore era compilare eventuali segmenti di bytecode per evitare che venissero inutilmente interpretati dalla VM.
    - **ART**: Ad install-time, motivo per cui si usano degli apk, viene compilato il bytecode Dalvik verso compilato della macchina.

<div style="text-align: center;">
    <img src="img/chain_dalvik_vs_ART.png" width="350">
</div>

- **Diritti e user ID**
    - Gli user ID non identificano gli utenti ma le applicazioni, per ciascuna applicazione si crea "un sotto fs" ed un ambiente specifico per l'esecuzione di quell'applicazione. Raramente più applicazioni condividono lo stesso ambiente.
    - A causa della nascita della necessità di gestire però anche gli utenti si è quindi preferito il prodotto tra gli utenti e l'user id secondo una sintassi `utente0_a100`

## Struttura dell'Applicazione Android

Segue tre fasi:

- **Build**: $sorgente \to apk$
- **Deploy**: $apk \: \text{(su store)} \to apk \: \text{(su device)}$
    - Un `.apk` è un `.jar` specializzato, che a sua volta è uno `.zip` specializzato.
- **Run**: $apk \: \to \text{processo}$

# Lezione 03 - Gestione delle Risorse - 06/02/2026

## Resources vs Assets

Di due macro categorie:
- **Resources**: Risorse di cui l'OS è a conoscenza. Mai gestiti a mano, ma gestiti dal resource manager dell'OS. Quindi sono poste solitamente per convenzione nella sottodir `./res`.  Quindi queste risorse vengono compattate in binario. Nello specifico il tool aapt segue diverse fasi:
    - **Conversione XML** in **binario**
    - Generazione **tabella di corrispondenza** fra **ID** e **offset** per accesso $O(1)$.
    - Si genera una **classe java** `gen/R.java` che **mantiene corrispondenza** tra nome simbolico della risorsa e id nella tabella, quindi fa da indice per tutte le risorse.
    - Questa **classe viene compilata** e **messa a disposizione** come tutte le altre.
- **Assets**: Risorse di cui l'OS non è a conoscenza, solitamente compattati in un `.zip`. Questi non vengono identificati da un id di risorsa, vengono quindi trattati tramite un oggetto `AssetManager`

Questa gestione delle risorse ha il vantaggio di poter effettuare un binding dinamico in base al tipo di risorsa che vogliamo richiedere, (ad esempio in base alla nazionalità o a giorno/notte...)

- **Tipi di Risorse**: Sono ad esempio
    - **Animation**
    - **Color State List**
    - **Drawable**
    - **Layout**
    - **Menu**
    - **String**

Possiamo anche riferire risorse all'interno di altre risorse, ad esempio `"@string/hello"`. In Kotlin non viene generato il sorgente di `R` ma direttamente le classi di `R`.

L'accesso alle risorse avviente tramite `@NOMEPACKAGE/tipo/nome`

`Context` e `Environment` classi standard ci permettono rispettivamente di ottenere informazioni sul contesto e sul dispositivo. Le `Activity` sono **sottoclassi** di `Context`.

## Gestione di Risorse Alternative

Le risorse possono essere specializzate tramite tipo di qualificatori, ad esempio tramite una forma della directory del tipo `res/tipo-QUALIFICATORI/file`.

Questo ci permette di qualificare anche sulla versione di Android con la flag `-v[VERSIONE]`.

A runtime il Resource Manager cerca tra le tante alternative secondo una specifica procedura:

<div style="text-align: center;">
    <img src="img/resourceManager.png" width="220">
</div>

Quindi vengono riavviate tutte le applicazioni per fare in modo che siano ricaricate le risorse.

Nell'android manifest è possibile dichiarare esplicitamente cosa sia richiesto per installare l'applicazione.

# Lezione 04 - Componenti di un Applicazione Android - 20/02/2026

## Tipi di Component

`Component` è ua classe astratta, che non viene mai istanziata, ma ha **quattro grandi tipologie**:
- `Activity`: Una cosa che l'utente fa, un azione atomico. Quindi un codice con corrispondente interfaccia utente **UI**.
    - Può essere composta da vari `Fragment`.
- `Service`: Codice senza un interfaccia utente, quindi logica che espone un **API**, non interagendo direttamente con l'utente, ma con le applicazioni, solitamente eseguiti **in background** quindi non visibile.
- `Content Provider`: Funge da base di dati, quindi un componente che pubblica contenuti. Anche questa offre un interfaccia programmatica, ma offrendo contenuti, non funzionalità.
- `Broadcast Provider`: Componente che ascolta messaggi globali, si registra come listener per acquisire eventi globali.

## Intent

Tutti questi componenti dialogano tra loro attraverso un **sistema di messaggistica** di `Intent`.
- Messaggi che definiscono l'intenzione di fare qualcosa, nata dall'Intent di un utente a monte.
- Possono essere aggiunti dati non fissati tramite payload.
- Può essere definito un destinatario, oppure inviare questi messaggi in broadcast.
- Ciascun componente può registrarsi ad `Intent` a cui è interessato.
- Il filtro non è propriamente un filtro, ma più una registrazione del tipo publisher/subscriber.

### Lancio di App tramite Intent

- Il **launcher** (un tipo di Activity) **avvia** la **prima Activity** dell'App, inviandole un **Intent** che indica l'**intenzione di lanciarla**.
- L'**Activity** in questione lancia la **propria UI**.
- Il sistema **chiama** certi **metodi** dell'**Activity** (**callback**) in risposta alle azioni dell'utente.
- Ciascuna di **queste callback** potrà ad esempio **lanciare altre Activity**, **inviare Intent** ad altre Activity, **interagire** con **Services**, **recuperare dati** dai **Content Provider** o **terminare l'Activity**.

### Tipi di Intent

- **Explicit Intent**: Definisce esplicitamente il destinatario. In questo caso non viene utilizzato l'Intent Filter.
- **Implicit Intent**: Non si definisce chi sia il destinatario, ma sarà il sistema tramite il filtro degli intenti a capire quale Activity invocare. Se ci fosse più di una possibilità allora si lascia la scelta all'utente.

L'idea e l'astrazione che si vuole fornire è quella che tutti i componenti, anche se non caricati in memoria ma presenti su disco, sono disponibili all'acquisizione di un Intent se registrato tra gli interessati.

### Contenuti di un Intent

Un intent contiene 7 campi:
- **Action**: Che azione si vuole ottenere, definito tramite una stringa.
- **Data**: Su quali dati operare, definito tramite URI.
- **Category**: Categoria dell'azione, definito tramite stringa.
- **Type**: tipo MIME di Data, definito tramite stringa.
- **Component**: Componente a cui è indirizzato il messaggio.
- **Extras**: un Bundle, ossia mappa chiave valore, di campi ulteriori.
- **Flag**: 32 bit aggiuntivi, riservato a future espansioni.

### Intent Filter

- L'Intent Filter non è propriamente un filtro, ma più una registrazione del tipo publisher/subscriber.
- Si definiscono le registrazioni solitamente in maniera statica nel `AndroidManifest.xml`, solitamente in base ad Action, Category e Data.
- Gli interessi possono essere registrati anche a tempo d'esecuzione, ma è più raro.

## Android Manifest XML

Si tratta del manifesto dell'Applicazione che include:
- Configurazione dell'app (nome, icona, package)
- Informazioni sui permessi
    - Fino ad Android 6 era statica la gestione dei permessi, poi sono stati chiesti a runtime. Da Android 11 i permessi più critici vengono chiesti uno per volta, secondo la one-time permission.
- Elenco dei componenti dell'applicazione
    - Configurazione di ciascun componente, inclusa classe Java
    - Dettagli sugli Intent dei vari componenti
- Altri metadati, come librerie, strumenti di profiling.

# Lezione 05 - Activity I - 25/02/2026

`Basato sul PDF Lezione 05`

Le **activity** sono **componenti** di un **applicazione**.
- La **dimensione** di un activity **non è prefissata**, la si determina a tempo di sviluppo.
- I **task utente** si compongono di varie **Activity**.
    - Lanciando un **Intent** si collegano le varie **Activity** del **Task** che sta eseguendo l'utente. Questo si basa su uno Stack, quindi ogni avvio di Activity provoca un push sullo Stack.
    - L'Interazione Utente quindi avviene solo sul Top della pila.
- In realtà in modalità Overview, quando vediamo tutte le applicazioni, non vedo un solo Stack ma molteplici Stack, quindi molteplici Stack di Activities di un Task, dove uno di questi è quello in Foreground. Quindi per ogni Task uno Stack.
- Tutto quello che vediamo nella Overview sono screenshot del runtime dei Task, ma in realtà non è assolutamente necessario che tali Applicazioni siano caricate in memoria.
- Da Android Nougat e Oreo sono state rispettivamente aggiunte Split Screen e Picture-in-Picture che permettono di avere più Top sullo Stack contemporaneamente.

## Comportamento a tempo di Avvio di Activity

### Comportamento e Gestione di Flag

Se si avvia un Activity:
- Se non esisteva un task contenente l'Activity allora viene creato un nuovo task con Stack contenente solo un istanza del Activity richiesta.
- Se viene riavviata un'activity che era top del suo stack, si torna a quella particolare istanza.
- Se viene riavviata un activity che non era top del suo stack allora viene lanciata una nuova istanza e messa in cima allo stack

La **gestione** di queste Activities **può essere** anche **personalizzata** tramite l'utilizzo di flags:
- **Standard**: Crea sempre una nuova istanza dell'Activity nel task di destinazione.
- **SingleTop**: Se l'Activity è top, riavvia l'istanza esistente, altrimenti crea una nuova istanza.
- **SingleTask**: Può esistere una sola istanza dell'Activity. Se ce n'è già una in qualche Task viene riavviata quella, altrimenti si crea un nuovo Task, che ha l'Activity come unico elemento.
- **SingleInstance**: Come la precedente, ma se si crea un nuovo task non consente di creare ulteriori Activity al suo interno.

Anche lato Intent possono essere lanciate con opzioni specifiche tramite la flag `FLAG_ACTIVITY_*`, ad esempio:
- `FLAG_ACTIVITY_NEW_TASK`: L'Activity viene lanciata in un nuovo stack di cui è unico membro
- `FLAG_ACTIVITY_CLEAR_TOP`: Se l'Activity esiste nello stack corrente tutte quelle sopra di essa vengono chiuse, e l'Activity diventa top.
- `FLAG_ACTIVITY_SINGLE_TOP`: Se l'Activity è già quella top nello stack corrente allora non viene lanciata.

### Lancio di un Activity

Il lancio di un App su Android è **disaccoppiato** da un punto di vista **logico** e **fisico**. Quindi un Applicazione può essere in Overview ma non necessariamente caricato in memoria.

Si segue, per il lancio di Intent espliciti un pattern di programmazione asincrona, dato che la UX è fondamentale.

Tutti i metodi di `onCreate()`, `onActivityResult()` sono appartenenti alle Activity e verrano invocate dal sistema per eseguire quell'azione.

### Disaccoppiamento Memoria Logica/Fisica Android

Un **Activity a runtime** è anch'essa **disaccoppiata**, **terminare un Activity** e riavviarla **non necessariamente implica** l'allocazione su Heap, per la stessa questione di prima di disaccoppiamento fisico/logico.
- Il disaccoppiamento può anche portare alla deallocazione fisica di un oggetto Activity in memoria anche se da un punto di vista logico è ancora attivo.
- Questo è un approccio completamente opposto all'utilizzo dell Swap ad esempio in Unix, in quel caso l'OS non sa minimamente cosa si stia spostando su disco.
- Allo stesso tempo Android non usa lo Swap anche perchè impossibile che si utilizzino dei dischi, che non risentono di ripetute scritture.

Si seguono quindi delle **politiche di priorità** per la **gestione della deallocazione**:
- **Priorità Critica**: Activity top dello Stack corrente, non viene mai deallocata.
- **Priorità Alta**: Activity visibili tramite le trasparenze di quella top.
- **Priorità Bassa**: Activity visibili e non utilizzate.

Quindi ogni **Activity** dovrebbe **gestire** le **informazioni di salvataggio** di stato d'istanza, per far conoscere al sistema le informazioni fondamentali se dovesse riprendere in memoria fisica un istanza dell'Activity.

### Fasi di un Ciclo di Vita di un Activity

- `onCreate()`: Creazione dell'attività.
- `onStart()`: Prepara la UI.
- `onResume()`: Da un punto di vista logico stai per interagire con l'utente.
- `onPause()`: Si passa in background da un punto di vista logico, quindi la sua priorità si abbassa da Critica ad Alta. Si dice esplicitamente che non si riceverà input dall'utente, ma potrebbe essere ancora parzialmente visibile tramite ad esempio trasparenza.
- `onStop()`: L'applicazione oltre ad essere in background non è nemmeno visibile.
- `onDestroy()`: Da un punto di vista logico l'Activity è terminata.

#### Salvataggio Stato Istanza Activity

Ciascuna Activity dovrebbe fornire al sistema una `onSaveInstanceState()` quando è necessario salvare parte dello stato dell'activity per il ripristino a breve.
- Se termina il ciclo di vita logico allora questo metodo non verrà mai invocato dal sistema dato che abbiamo la garanzia che fisicamente non avremo mai bisogno di quei dati.
- Se, al contrario, il ciclo logico non è finito allora `onSaveInstanceState()` è importante se dovesse essere necessario rialzare il processo fisico.
- Lo stato viene salvato in un oggetto di tipo Bundle, che è una mappa con specifici metodi `putString()`, `putInt()`, `putBundle()`. 
    - Questo viene anche salvato su disco se il dispositivo viene spento.

## Ripresa Bundle della Lezione Precedente

- Riprendendo dal concetto di Bundle, questo mantiene le informazioni e lo stato dell'astrazione logica del Activity.
- Con la `onSaveInstanceState()` probabilmente salveremo parte della UI tramite le View.
    - L'implementazione di default visita l'albero del XML della UI e salva lo stato per ogni nodo dell'intera interfaccia utente, in base a quanto quest'ultimo crede di voler essere salvato.

## Due Stili di User Interface UI

Gestione con due stili
- **Tradizionale basato su `View`**: nativo di Android ma molto consistente.
    - Definisce tutta la UI come un albero di oggetti Java.
- **Moderno basato su `Composable`**: basato sull'utilizzo di lambda, utilizzabile solo in Kotlin.
    - Utilizza una libreria moderna detta Kotlin, basata su design pattern.

## UI basata su Layout e View

Due classi principali `ViewGroup` e `View`, dove la prima è sottoclasse della seconda e corrisponde ai nodi intermedi, fornendo metodi per la gestione dei figli.

L'interazione è basata su Eventi e relative Handler registrati per la gestione di quell'Evento.
- Gli handler vengono registrati come inner interfaces all'interno della classe View.
- Ogni interfaccia definisce un metodo `on ... Listener()`

# Lezione 06 - Esempio di App BMI Calc - 27/02/2026

** aggiunta di snippet dalla BMI APP **