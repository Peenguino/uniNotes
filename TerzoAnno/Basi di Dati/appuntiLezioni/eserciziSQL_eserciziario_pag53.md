# Esercizio 6.5

## Quesito 1

Trovare il nome e l’anno di nascita dei figli dell’impiegato con codice 350.

### Soluzione in Blind

```SQL
SELECT f.Nome, f.AnnoNascita
FROM Impiegati i
    JOIN Familiari f ON i.Codice = f.CapoFamiglia
WHERE i.Codice = 350
```

### Soluzione Corretta

- Nella tua proposta non stai considerando che il valore del codice è già presente all'interno della tabella familiari, e oltre a questo, non stai controllando se la parentela sia o meno di figlio

```SQL
SELECT Nome, AnnoNascita
FROM Familiari
WHERE CapoFamiglia = 350 AND RelazioneParentela = ’figlio’;
```

## Quesito 2

Trovare il nome e codice degli impiegati e il nome del dipartimento dove
lavorano.

### Soluzione in Blind

```SQL
SELECT i.Codice, i.CognomeNome, d.Nome
FROM Impiegati i
    JOIN Dipartimenti d on i.Afferisce = d.Numero
```

Soluzione aderente a quella corretta.

## Quesito 3

Trovare il nome degli impiegati, il nome e l’anno di nascita dei figli maschi a
carico.

```SQL
SELECT i.Nome, f.Nome, f.AnnoNascita
FROM Impiegati i
    JOIN Familiari f ON i.Codice = f.CapoFamiglia
WHERE f.RelazioneParentela = 'Figlio' AND f.Sesso = 'Maschio'
```

Soluzione aderente a quella corretta.

## Quesito 4

Trovare, per ogni progetto in corso a Pisa, il numero e il nome del progetto, il nome del dipartimento dove si svolge, il cognome del direttore del dipartimento.

### Soluzione in Blind

```SQL
SELECT p.NumeroP, p.NomeP, d.Nome, dir.CognomeNome
FROM Progetti p
    JOIN Dipartimenti d ON p.GestitoDa = d.Numero
    JOIN Impiegati i ON d.Numero = i.Afferisce
    JOIN Direttori dir USING Codice
WHERE d.Città = 'Pisa'
GROUP BY p.NumeroP
```

### Soluzione Corretta

- Non è richiesta una group by dato che non si vuole alcuna funzione di raggruppamento, è come se già si dividesse tutto in per ogni progetto.
- Hai dimenticato di utilizzare la relazione `Dirige`tra direttori e dipartimenti.
- Nella soluzione si assume che la tabella Direttori, essendo sottotipo della tabella Impiegati, avrà i campi richiesti come NomeCognome, senza effettuare `join` tra le due.

```SQL
SELECT p.NumeroP, p.NomeP, d.Nome, dd.CognomeNome
FROM Progetti p
    JOIN Dipartimenti d ON p.GestitoDa = d.Numero
    JOIN DatiDirettori dd ON dd.Dirige = d.Numero
WHERE d.Citta = ’Pisa’;
```

## Quesito 5

Trovare il nome dei dipartimenti con almeno un impiegato con persone a
carico.

```SQL
SELECT d.Nome
FROM Dipartimenti d
WHERE EXISTS (
    SELECT *
    FROM Impiegati i
        JOIN Familiari f ON i.Codice = f.Capofamiglia
    WHERE i.Afferisce = d.Numero
)
```

Soluzione a metà tra le due corrette del libro, dovrebbe essere corretta anche questa.

## Quesito 6

Trovare il numero degli impiegati del dipartimento di Informatica.

```SQL
SELECT COUNT(*)
FROM Dipartimenti d
    JOIN Impiegati i ON d.Numero = i.Afferisce
WHERE d.Nome = 'Informatica'
GROUP BY d.Numero
```

- Questa soluzione in qualche modo è corretta ma il `GROUP BY` risulta essere ridondante, questo perchè:
    - Se hai la necessità di contare per raggruppamento allora hai la necessità di utilizzare una `GROUP BY`
    - In questo caso ti è esplicitamente richiesto un gruppo, ossia quello del dipartimento di informatica, quindi non serve, e puoi usare le funzioni di raggruppamento come il `COUNT(*)` anche senza GROUP BY, questo semplicemente conterà per tutte le righe e non per raggruppamenti di righe.

## Quesito 7

Trovare, per ogni progetto al quale lavorano piu di due impiegati, il nome, il numero e il numero degli impiegati che vi lavorano.

```SQL
SELECT pp1.NomeP, pp1.Numerop, COUNT(*) AS QuantitaImpiegati
FROM Impiegati i1
    JOIN Partecipazioni p1 ON i1.Codice = p1.Impiegato
    JOIN Progetti pp1 ON p1.Progetto = pp1.NumeroP
GROUP BY pp1.NumeroP 
HAVING QuantitaImpiegati > 2
```

- Molto simile alla soluzione del libro, l'unica differenza sostanziale è quella di aver messo l'HAVING sulla funzione di raggruppamento denominata, il che non credo sia qualcosa di fattibile sintatticamente parlando.
- Stavi anche selezionando su campi degli impiegati, ma non era errore di logica, era errore di lettura traccia.

## Quesito 8

Trovare per ogni dipartimento il nome, il numero degli impiegati e la media del
loro anno di nascita.

```SQL
SELECT d.Nome, COUNT(*), AVG(i.AnnoNascita)
FROM Dipartimenti d
    JOIN Impiegati i ON d.Numero = i.Afferisce
GROUP BY d.Numero, d.Nome
```

- Aderente alla soluzione

## Quesito 9

Trovare i nomi dei supervisori e dei loro dipendenti.

```SQL
SELECT r.CognomeNome, d.CognomeNome
FROM Responsabili r
    JOIN Dipendenti d ON r.Codice = d.CoordinatoDa
```

- Aderente alla soluzione

## Quesito 10

Trovare il nome degli impiegati e il nome del dipartimento in cui lavorano.

```SQL
SELECT i.CognomeNome, d.Nome
FROM Impiegati i
    JOIN Dipartimenti d ON i.Afferisce = d.Numero
```

## Quesito 11

Trovare il nome degli impiegati senza familiari a carico

### Soluzione in Blind

```SQL
SELECT i.CognomeNome
FROM Impiegati i
    JOIN Familiari f ON i.Codice <> f.CapoFamiglia
```

### Soluzione Corretta 1 - LEFT JOIN

La query come è stata formulata significa “accoppia ogni impiegato con ogni familiare che non è il suo”, che non ha senso. Volendo mantenere la join dovremmo usare una LEFT JOIN:

```SQL
SELECT i.CognomeNome
FROM Impiegati i
    LEFT JOIN Familiari f ON i.Codice = f.CapoFamiglia
WHERE f.CapoFamiglia IS NULL
```

### Soluzione Corretta 2 - Subquery e Correlazione

```SQL
SELECT i.CognomeNome
FROM Impiegati i
WHERE NOT EXISTS (
    SELECT *
    FROM Familiari f
    WHERE f.CapoFamiglia = i.Codice
)
```

## Quesito 12

Trovare i progetti cui partecipa il sig. Rossi come impiegato o come direttore
del dipartimento che gestisce il progetto.

```SQL
SELECT prog.NomeP
FROM Progetti prog
    JOIN Partecipazioni p ON prog.NumeroP = p.Progetto
    JOIN Impiegati i ON p.Impiegato = i.Codice
    JOIN Dipartimenti d ON prog.GestitoDa = d.Numero
    JOIN Direttori dir ON d.Numero = dir.Dirige
WHERE i.CognomeNome = 'Rossi' OR dir.CognomeNome = 'Rossi'
```

## Quesito 13

Trovare il nome degli impiegati che hanno i familiari a carico dello stesso sesso.

### Soluzione in Blind

```SQL
SELECT i.CognomeNome
FROM Impiegati i
WHERE NOT EXISTS (
    SELECT *
    FROM Familiari f1
    WHERE i.Codice = f1.Capofamiglia
        AND NOT EXISTS (
            SELECT *
            FROM Familiari f2
            WHERE f1.Sesso <> f2.Sesso
        )
)
```

### Soluzione Corretta

- La proposta non era impostata male, ma nelle soluzioni si assume che il campo f.Sesso sia 'm' oppure 'f' e questi non vengono mai confrontati direttamente. Di conseguenza si presenta la soluzione con raggruppamenti e filtri sulle funzioni di raggruppamento

```SQL
SELECT i.CognomeNome
FROM Impiegati i
    JOIN Familiari f ON i.Codice = f.CapoFamiglia
GROUP BY i.Codice, i.CognomeNome
HAVING COUNT(DISTINCT f.Sesso) = 1
```

## Quesito 14

Trovare il nome degli impiegati che hanno tutti i familiari a carico dello stesso sesso dell’impiegato.

### Soluzione Proposta (ASSUMENDO CHE ESISTA IL FORALL)

```SQL
SELECT i.CognomeNome
FROM Impiegati i
WHERE FORALL (
    SELECT *
    FROM Familiari f
    WHERE i.Codice = f.CapoFamiglia
        AND i.Sesso = f.Sesso
)
```

### Soluzione Proposta (IN SQL REALE, CON NOT EXISTS)

```SQL
SELECT i.CognomeNome
FROM Impiegati i
WHERE NOT EXISTS (
    SELECT *
    FROM Familiari f
    WHERE i.Codice = f.CapoFamiglia
        AND i.Sesso <> f.Sesso
)
```

### Soluzione Corretta

- Di base la logica c'è nella proposta, ma la quantificazione universale è vacuamente vera se un impiegato non ha familiari, quindi la seconda condizione verifica che l'impiegato abbia realmente familiari.

```SQL
SELECT i.CognomeNome
FROM Impiegati i
WHERE NOT EXISTS (
    SELECT *
    FROM Familiari f
    WHERE f.CapoFamiglia = i.Codice
      AND f.Sesso <> i.Sesso
)
AND EXISTS (
    SELECT *
    FROM Familiari f
    WHERE f.CapoFamiglia = i.Codice
);
```

## Quesito 15

Trovare il nome degli impiegati che lavorano almeno a tutti i progetti dell’impiegato con codice 300.

```SQL
SELECT i1.Nome
FROM Impiegati i1
    JOIN Partecipazioni part1 ON i1.Codice = part1.Impiegato
    JOIN Progetti prog1 ON part1.Progetto = prog1.NumeroP
WHERE NOT EXISTS (
    SELECT *
    FROM Impiegati i2
        JOIN Partecipazioni part2 ON i2.Codice = part2.Impiegato
        JOIN Progetti prog2 ON part2.Progetto = prog2.NumeroP
    WHERE i2.Codice = 300
        AND prog1.NumeroP = prog2.NumeroP
)
```

## Quesito 16

Trovare il nome del dipartimento e il numero di impiegati nati dopo il 1950,
per i dipartimenti con piu di due impiegati.

```SQL
SELECT dip1.Nome, COUNT(*)
FROM Dipartimenti dip1
    JOIN Impiegati i1 ON dip1.Numero = i1.Afferisce
WHERE NOT EXISTS (
        SELECT *
        FROM Dipartimenti dip2
            JOIN Impiegati i2 ON dip2.Numero = i2.Afferisce
        WHERE dip1.Numero = dip2.Numero
        GROUP BY dip2.Numero
        HAVING COUNT(*) <= 2
    )
    AND i1.AnnoNascita > 1950
```
