# Lezione 1 - Prodotto e Design dell'Interazione Uomo Macchina - 18/09/2025

- Obiettivo del corso: Fornire gli strumenti necessari a **comprendere** e gestire il **processo di sviluppo delle interfacce** e dei prodotti interattivi.
- L'**interazione** infatti tra **utente e prodotto** va progettata in modo tale da far sentire l'**utente a suo agio**.
- **Design**: Processo di progettazione e pianificazione, ma in italiano allo stesso tempo indica anche l'output stesso di questo processo.
## Pensiero Computazionale vs Design

- **Pensiero Computazionale**: Suddivisione di un **problema** in tanti **sottoproblemi** ed **approccio algoritmico** per la soluzione di ciascuno dei sottoproblemi identificati.
- **Design**: Non si pone l'obiettivo di risolvere il **problema** ma di **comprenderlo** nel suo insieme. Questo vuol dire che se esiste un problema di cui l'utente non è a conoscenza, allora per il design non è presente alcun problema.

Questo non implica che questi due elementi siano in mutua esclusione, anzi devono spesso coesistere.

## Interaction Design

L'obiettivo della **progettazione d'interazione** è quello di rendere macchine e **sistemi il più usabili dagli utenti**. Bisogna che al **centro** dello sviluppo siano messi i **bisogni degli utenti**. Nel nostro caso parleremo quindi di **Human Machine Interaction** (HMI) nello specifico.

Quindi l'Interaction Design si compone di **tre discipline**:

- **Product Design**: Progettazione di beni e servizi il cui obiettivo è quello di essere utilizzati da più utenti possibili.
- **User Experience Design**
- **User Interface Design**

# Lezione 2 - UX/UI e Human Centered Design - 19/09/2025

## UX - User Experience Design

- Lo scopo dell'UX Design è quello di **soddisfare il cliente**
e di renderlo più fedele al prodotto migliorandone l'**usabilità**. Questi aspetti possono ad esempio essere analizzati con una heatmap che mantiene traccia della navigabilità dell'app da parte dell'utente.
- E' anche ruolo del marketing quella di integrare tutti gli **aspetti di business, marketing e sviluppo del prodotto**.
- **Non puoi progettare** l'UX, ma puoi **progettare per** l'UX: Questo vuol dire che se un tecnico ha definito un interfaccia, **non potrà** mai prevedere il **comportamento di un utente**. Puoi invece progettare per l'UX, cercando di **immedesimarsi in un User**.
- **L'output "atteso"** alla fine di questa fase **non è un interfaccia**, ma una lista di **requisiti delle necessità degli utenti**.
- L'**obiettivo ideale** di questa fase è quella di **mettere a suo agio l'utente** nel momento in cui dovrà utilizzare il prodotto.

### UI - User Interaction Design

- L'UI Design è parte della UX Design, dopo un prodotto della UX viene fatta la UI Design.
- Quindi questa fase è la **creazione** di un **interfaccia**, **dopo** aver eseguito un **analisi della UX**.

## Human Centered Design

- La **capacità umana** di **adattamento allo sviluppo tecnico è bassa**, lo sviluppo tecnico è molto rapido.
- Il fondamento quindi è sviluppare software che sia amabile, in modo tale da stabilire un interazione tra l'uomo e la macchina. Da immaginare come una relazione tra uomo ed un altra specie, in **completa opposizione** all'**approccio tecno-centrico**, dato che rallenta la diffusione di un software.
- **Design antropocentrico**: si inverte il paradigma di progettazione mettendo l'utente al centro del processo. Questo approccio è normato dalla ISO. Non bisogna progettare per delle persone ideali che si comportano come vorremmo, ma progettare per come realmente sono.
- Molto spesso **l'utente non sa nemmeno cosa vuole** (simile al discorso della raccolta requisiti), di conseguenza risulta **necessario osservare l'utente** e non solo chiedere cosa vuole.
- L'obiettivo è creare empatia tra il SW e l'utente.
- Il **costo di transizione** è il costo principale per un utente per il cambiamento di prodotto (es. Edge vs Chrome a lezione delle tab. verticali).
- E' necessario pensare in maniera creativa ed iterativa seguendo le **fasi** di:
    1. **Proposta**
    2. **Test**
    3. **Analisi**
- **Flusso del processo** di **HCD (Human Centered Design)**:
    - Specificare il contesto d'uso
    - Specificare i requirements
    - Progettare la soluzione
    - Testare e valutare
- Le **metriche di utilizzo** sono pilastro dello **sviluppo HCD**, perchè ci permettono di **orientarci** studiando l'esperienza utente.


# Lezione 3 - Principi d'Interazione - 25/09/2025

## Progettazione dell'Interazione

1. **Discoverability**: Capacità di un sistema di comunicare i propri possibili usi all'utente. Il prodotto si autointroduce?
Questa proprietà dipende dall'utente a cui stiamo dando il prodotto.
Questo principio (**discoverability**) si basa su altri 6 principi psicologici:
    - **Affordances**: Un oggetto ha delle **proprietà** e un utente ha delle **capacità**. Il **rapporto** proprietà/capacità è detto affordance, quindi questa **NON è una proprietà dell'oggetto** ma un rapporto oggetto/utente. Ne è un esempio la vite del tappo della candeggina, che consente l'apertura ad un adulto ma non ad un bambino, chiaro esempio di **affordances**. Esiste anche un anti-affordance, ossia prevenzione d'interazione tra oggetto e utente. Le affordances non sono da subito chiare ma utilizzando il prodotto.
    - **Signifiers**: Elemento del design detto **significante** perchè da appunto **semantica** ad una **affordance**. Quindi le affordance non possono essere posizionate nel prodotto, solo i **signifiers possono essere posizionati**, e diranno **dove**, **cosa** e **perchè**. Questi però vanno usati con parsimonia, seguendo il paradigma Less is More. 
        - **Signifiers Intenzionale**: Segnali come "spingi" sulle porte.
        - **Signifiers Accidentale**: Azione compiuta da tanti potrebbe diventare involontariamente un signifier.
    - **Constraints**: Vincoli (vedi lez. successiva).
    - **Mapping**: Solitamente il **map** tra **affordances** e **signifiers** viene fatto per **convenzione**, però **dipende** fortemente **dal background dell'utente**. Questo mapping quindi può risultare ambiguo per utenti e non ambiguo per altri (esempio dell'indicatore del galleggiante di mezzi europei oppure giapponesi).
    - **Feedback**: L'utente si aspetta sempre un risultato da un azione che ha effettuato. L'utente associa la reazione dell'interlocutore come associata all'azione appena compiuta se il feedback arriva entro al massimo di $100 ms$. Lo stesso avviene con i SW, motivo per cui si preme più volte sui bottoni proposti, dato che l'utente ha il dubbio di non aver fatto nulla. 
    Il feedback deve essere informativo, solitamente viene anche fatto **prima** di una potenziale chiamata ad un API. Un feedback può essere anche **poor**, come ad esempio una lavastoviglie che ci informa di aver finito il suo ciclo alle tre di notte. I **poor feedback** sono **peggio di feedback mancati**, **perchè rendono inutili anche i feedback progettati bene**.

2. **Understanding**: Capacità di un sistema di comunicare il proprio corretto utilizzo.

# Lezione 4 - Conceptual Models - 26/09/2025

Un modello concettuale è una maniera semplice e schematica per spiegare come funziona qualcosa.

La **gestione logica dei file** in **file systems** non esisteva prima, ma qualcuno ha creato un **modello concettuale** basandosi sul **esempio reale di libreria**.

La **semplificazione** di un sistema mette in discussione le sue funzionalità. Ne è un esempio i file disponibili o meno in cloud, perchè la semplificazione sull'accesso ai file era si una bella astrazione ma la tecnologia del tempo di DropBox non era al passo con l'astrazione del modello concettuale stesso.

## Mental Model vs Conceptual Model

Un **Mental Model** è l'**interpretazione dell'utente** del **Conceptual Model** a cui si sta interfacciando. L'**obiettivo** del designer è quello di permettere il **fitting** tra **Mental Model** (dell'utente) e **Conceptual Model** (del designer).

Questo si applica molto bene alle lettere sui tastierini numerici dei vecchi telefoni. Quello è un conceptual model basato sul fatto che negli USA era possibile comprare e chiamare stringhe alfanumeriche. Il nostro Mental Model però non fitta perchè nella nostra cultura questo non era mai stato utilizzato.

## System Image

Sono istruzioni e guide per l'utente per interfacciarsi al Modello Concettuale.

Quindi:

1. Designer **progetta** un Design/**Conceptual Model**
2. Il designer deve comunicare qualcosa per rendere più probabile che **il Mental Model del utente fitti** il **Conceptual Model**, questa comunicazione avviene proprio tramite la **System Image**. Va "raccontato" all'utente il funzionamento di un prodotto e di come ci siamo immaginati che si utilizzi quel prodotto.

## Changing Conventions

All'utente solitamente risulta pesante ogni cambiamento effettuato al prodotto. Se le convenzioni vengono violate allora è necessario nuovo apprendimento da parte dell'utente. Di conseguenza nella progettazione risulta necessario mantenere consistenza, in modo tale da rendere il meno possibile frustrante la nuova esperienza d'apprendimento.

## Constraints

Noi capiamo come agire spesso in risposta a vincoli. Sviluppo quindi un modello concettuale in base a questi vincoli, che sono di 4 tipi:

1. Fisico
2. Culturale
3. Semantico: I cartelli semafori sono il più semplice esempio di vincolo semantico. Viene assegnato arbitrariamente un significato a dei segni.
4. Logico: Si evince un vincolo logico "intuendo".

**Esempio del Lego**: il fitting tra Conceptual Model e nostro Mental Model è completamente composto dai vincoli, che ci permettono di montare il lego senza istruzioni.

### Forcing Functions

1. **Interlock**: A volte i vincoli diventano **forcing functions**, ossia viene forzato il funzionamento completamente da un vincolo, ad esempio un tappo di un frullatore, se non inserito il prodotto non si avvia. Ma anche un 2fa è un **interlock** perchè senza 2fa non vogliamo che un utente possa utilizzare la nostra app. Quindi un **interlock** forza **operazioni** ad essere **eseguite** in una **sequenza prestabilita**.
2. **Lock-in**: Il lock-in mantiene un operazione attiva, **evitando** che **l'utente possa terminarla prematuramente**. Un classico esempio è il pop up che si apre in chiusura di un editor di file, previene la chiusura involontaria.
3. **Lock-out**: Il lock-out previene che un operazione in ingresso venga effettuata involontariamente, è necessario che l'utente riconfermi la propria operazione. Un classico esempio è il pop up che chiede di essere maggiorenni per poter accedere.

