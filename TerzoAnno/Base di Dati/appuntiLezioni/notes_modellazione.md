# Teoria della Normalizzazione 1 - Lezione 05/11/2025

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

## Esempio su Cerca Chiavi con Dipendenze Funzionali