# Quantum Computing

Dispositivo che utilizza proprietà per effettuare calcolo:
1. Superposition
2. Entaglement: Lo stato di un qbit è direttamente correlato dallo stato di un altro, conoscendo quindi lo stato "globale"

Un nuovo modo di rappresentare le informazioni da bits a qbits

## Qbits 

*vedi slide*

### Topologie di Qbits

Tra loro questi formano dei raggruppamenti, delle topologie formate da un computer quantistico

### Cloud e Quantum

Dato che l'infrastruttura fisica è isolata, il modo comune per utilizzarli è attraverso il cloud

### Quantum Circuits

Viene eseguito un circuito che analizza le probabilità e si produce alla fine un istogramma in output, di conseguenza non si eseguono singole iterazioni
ma più iterazioni per produrre una **distribuzione di probabilità**. Ciascuna di queste iterazioni è detta **shot**.

## NISQ Era

I computer sono soggetti ad errori (**noise**), ed ancora non è possibile scalare (**scale**).

## Ingegneria del Quantum Computing

Ancora esistono problemi di reliability, scalability, costi, e si è tornati da capo tornando ai circuiti di gates

Un altra componente fondamentale è capire come sia possibile distribuire gli shot tra qpu diverse per cercare di annullare i profili di rumore. Questo metodo è detto di **split-wise**, dunque prima si **splittano** i vari shot e magari ogni distribuzione compenserà il profilo di rumore degli altri durante la fase successiva di **merge**. In realtà le cause dello split-wise sono varie:

1. Costi
2. Topologie
3. Tempo
4. Rumore
