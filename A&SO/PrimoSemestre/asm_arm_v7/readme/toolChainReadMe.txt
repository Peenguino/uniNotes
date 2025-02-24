Installazione Cross Compiler - 09/11/2024


1. arm-linux-gnueabihf non è installabile direttamente con apt:

    1a. Va infatti installato gcc-arm-linux-gnueabihf con "sudo apt install gcc-arm-linux-gnueabihf"


2. qemu non è più installabile direttamente, è necessaria una partizione del vecchio qemu

    2a. Va installato qemu-system con "sudo apt install qemu-system"


3. Il resto dei pacchetti invocati nell'installazione dal file PDF* allegato ad oggi funzionano


4. Bisogna rendere eseguibili le macro e bisogna spostarle nella cartella 
    che permette l'esecuzione con la semplice invocazione di nome

    4a. Ho spostato i due file in "/usr/local/bin" con una "mv"
    4b. Ho reso eseguibili i due file binari con un "chmod +x $nome_fileBinario"