# Introduzione ai Sistemi Operativi

Software fondamentale per calcolatore.

## Effetti che deve fornire

- **Illusionist**: Gestione della memoria contigua logica, quando fisicamente questa cosa non sarebbe possibile
- ***Referee***: Gestione equa della distribuzione di risorse tra processi e users
- ***Glue***: Mettere a disposizione librerie e utilities alla base di tutto

### Elementi Caratteristici nello Specifico

- **Affidabilità**
- **Sicurezza**
- **Portabilità**
- **Performance** (Latenza, Throughput, Overhead, Fairness, Predictability)

## Kernel Monolitico VS Micro Kernel

- **Monolitico**: Tutto quello che offre l'OS è contenuto nel kernel, di conseguenza tutte le sue funzionalità sono considerate kernel
- **Micro Kernel**: Solo le funzionalità core sono nel kernel, tutte le altre vengono eseguite a livello utente

## Batch, Spool, Time Sharing

Assumiamo di avere una lista di jobs da dover far eseguire ad un calcolatore

- **Batch**: Ogni job viene elaborato qualora viene terminato quello prima. Consiste in una esecuzione **sequenziale**.
- **Spooling**: Qualora un job k+1 dovesse eseguire delle operazioni di I/O allora verrebbe fatto eseguire alla CPU un po' del job k.
- **Time Sharing**: Tutti i job vengono eseguiti in interleaving. Si considerano **esclusi** dall'**interleaving** in caso di operazioni di **I/O**.

# Kernel

Per questioni di sicurezza vogliamo che l'OS riesca a splittare il suo funzionamento in almeno due modalità **SYS/USER**.

## Dual Mode

- **User**: Può effettuare delle **invocazioni** al kernel che causano uno switch di modalità (syscalls).
    - Privilegi limitati
    - Privilegi stabiliti dal kernel.
- **System**: Può **eseguire** le **routine** corrispondenti alle syscalls lanciate dagli utenti.
    - Pieni privilegi sull'**Hardware**.
    - **Accesso a tutto** (memoria, device I/O, lettura/scrittura su disco, leggere/inviare pacchetti).

### Supporto Hardware alla Dual Mode

- Devono esistere **istruzioni privilegiate**:
    - Disabilitazione delle INT
    - Scrittura manuale su CPSR
    - Scrittura manuale sul timer
- **Limitazione sulla Memoria**: Si limita la memoria con schemi come in **Base & Bound**. Bisogna dunque mappare l'indirizzo virtuale sul fisico in qualche modo.
- **Timer**: Gestione di un **interruzione** semiautomatica in caso di **overtime** di **processo**.
    - In realtà si utilizza un meccanismo di **indirizzi virtuali**, dove l'MMU si occupa della traduzione a livello hardware.
    - Ritorna periodicamente il controllo al **kernel timer interrupt handler**, di un periodo stabilito dal **kernel**.
- **Safe Ways per Switch Mode**: Devono esistere delle modalità sicure come una SVC in ARM

## Descrizione Meccanismi per Interruzioni

- **Interrupt Vector**: Codice numerico che mappa nell'interrupt vector la relativa routine da eseguire.
- **Kernel Interrupt Stack**: Push sullo stack kernel dello stato architetturale.
- **Interrupt Masking**: Mask delle interruzioni (bit delle INT)
- **Gestione Atomica dello Switch**.

### Up/Down - Switch

#### Da USER a KERNEL

- **Interruzioni**: causate da timer o I/O.
- **Eccezioni**: Trigger causato da comportamenti anomali.
- **System Calls**: Dette anche software interrupts, è una richiesta da parte del programma di fare delle operazioni lato kernel.

#### Da KERNEL a USER

- **Ritorno da SYSCALL, INT, EXCEPT**.
- Start di un nuovo **processo/thread**.
- Switch di contesto tra **processo/thread**.
- **Upcall**: Notifica asincrona al programma dell'utente.

## Handling di Interruzioni

Operazioni necessarie all'handling:

- Salvare stato a tempo d'interruzione.
- Trattare evento dell'interruzione.
- Schedulazione per dare priorità all'evento di handling.

## Processo

Sequenza di attività attivate da un programma eseguito con diritti limitati.

- **PCB**: Struttura dati che mantiene le informazioni di descrizione di un processo. Si compone in questo modo:
    - **PID**, ossia indice nella tabella dei processi.
    - **Stato del Processo**: Ready, Running, New ...
    - **Registri CPU e Info di Schedulazione**.
    - **Puntatori ai Thread**.
    - **Memoria Assegnata**.
    - **Altre Risorse** (File aperti, devices, stato dell'I/O).
- **Tabella dei Processi**: Contiene tutti i PCB.
- Elementi contenuti in un **Processo**:
    - **Threads**: tanti contenuti per processo, sono visti dall'OS come processi leggeri
    - **Spazio d'Indirizzamento**: Spazio su cui il processo ha i diritti per operare, come ad esempio:
        - Memoria a cui può accedere il processo
        - Altri permessi (file a cui può accedere, quali procedure può chiamare...)

### Programma VS Processo

- Un programma è un file **statico** mentre un processo è un oggetto **dinamico**, una sequenza di attività
- I processi possono eseguire lo stesso programma, magari su **dati diversi** e **diverse volte**.

