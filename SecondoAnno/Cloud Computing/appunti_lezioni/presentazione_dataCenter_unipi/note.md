# Presentazione Data Center

- A differenza degli hyperscaler (Google, Microsoft) che basano la costruzione dei loro data center sull'impostazione "macro" di prefabbricati e server già pensati per essere configurati, tutto è automatizzato.
- I rack (armadi) sono divisi in unità, quelli std sono di 42 unità, tutto è iniziato dal rack musicale, successivamente tutto si è evoluto per aumentare il numero di transistor (CPU) in un unità di rack (pizzabox).

## Composizione del data center

- Gruppo elettrogeno e serbatoio da un 1000l 
- Stanza di potenza, contengono UPS, se l'UPS si accorge che manca linea principale allora manda segnale ad un gruppo elettrogeno che parte per sostituire la linea principale e l'UPS switcha al nuovo tipo di alimentazione. Ha quindi il ruolo di switchare e regolare la tensione durante queste fasi. Ad ogni armadio deve arrivare alimentazione da due linee differenti in uscita dalla stanza di potenza, per fare in modo che tutto sia "modificabile" anche durante l'esecuzione.
- Chiller, dispositivi posizionati all'esterno
- Tutti i sottosistemi sono coordinati dato che ognuno ha a disposizione un controller linux che comunica con gli altri
- Quadro elettrico che effettua la ripartizione dell'alimentazione fornita dall'UPS

## PUE - Power Usage Effectiveness
 
Indice che permette di stabilire di quanto hai bisogno davvero per calcolare. L'ideale sarebbe 1, ossia 1 watt va tutto in calcolo.
Il green datacenter dell'unipi è ad 1.15, dunque su ogni 100 watt di calcolo 15 vanno spesi per raffreddare.

### Composizione Pizzabox

In ordine osservando l'r650 open della Dell:

- Frontpart, si possono intercambiare
- Fila di ventole
- Banchi RAM e processori
- Alimementatori (swappable) per fare in modo che se cade 1 è presente l'altro
- In fondo i PCIe
- Tutti i server sono programmabili da remoto dato che montano 2 sistemi operativi, o meglio ognuno ha un interfaccia esterna con tanto di sistema operativa che permette di essere del tutto programmabile dall'esterno.
