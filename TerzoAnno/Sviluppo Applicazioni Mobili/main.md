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