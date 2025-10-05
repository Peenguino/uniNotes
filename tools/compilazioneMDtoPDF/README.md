# Descrizione Tool: Compilazione Markdown to PDF

Dato che vari file di questa repo sono in formato markdown, potrebbe risultare utile avere un modo per esportarli in PDF, in modo tale
da renderli fruibili da ogni piattaforma.

Questo script in bash utilizza `pandoc` per effettuare questa conversione $file.md \rightarrow file.pdf$

Nello specifico, prima di compilare in pdf, aggiunge un comando che permette l'autostesura dell'indice secondo la struttura definita dai capitoli/sottocapitoli in markdown.

# Dipendenze e Istruzioni per la compilazione

- Per prima cosa va installato il pacchetto `pandoc`, si assume di essere in ambiente Debian based:

    ```bash
    sudo apt install pandoc
    ```
- Successivamente vanno dati i permessi di esecuzione allo script:
    ```bash
    sudo chmod +x compileMarkdown.sh
    ```
- Dopo aver fatto questo possiamo utilizzare lo script passando come primo argomento la **sorgente** (il file `.md` da compilare) e come secondo argomento la **destinazione** (ossia dove vogliamo il file `.pdf` compilato).
    ```bash
    ./compileMarkdown sorgente
    ```
    Il `.pdf` verrà creato nella corrente directory.