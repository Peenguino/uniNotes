# Indice Argomenti Seconda Parte fino ad ora

1. Kubernetes
2. Cloud Native Applications e Docker Swarm
3. Data Centers
4. Business Models

# Edge Cloud Computing

- **Internet of Things**: Molti oggetti hanno una scheda di rete propria, come nei campi di Smart Cities, Embedded AI, domotica. Quindi sistemi intelligenti che utilizzano le "cose", quindi ogni oggetto attorno a noi.

## Fasi delle Applicazioni IoT

Pipeline che si basa su tre fasi:

1. **Sense**.
2. **Process**.
3. **Actuate**.

### Dove Processare i Dati?

E' leggittimo chiedersi dove effettuare la fase di process. Perchè le fasi sense ed actuate saranno piccoli attori locali, come sensori ed attuatori appunto. Esistono vari modi per elaborare i dati:

1. **IoT + Edge**: Locali server che forniscono la parte di calcolo che comunica con attuatori e sensori. Latenze basse ma forza di calcolo e storage limitati.
2. **IoT + Cloud**: Servizi cloud d'appoggio utilizzati come parte di processamento. In questo modo abbiamo una quantità "illimitata" di storage e processing. Presenta anche dei contro, ossia tutti i trasferimenti di dati che causa, alte latenze e richiede una continua connessione ad internet.

## Cloud Edge Continuum

Strutturazione a livelli della rete, per fare in modo che si possano ottenere sia i pro di un architettura (Cloud) sia i pro dell'altra (Edge), questo è detto Cloud-Edge o Fog Computing. In questo modo si "avvicina" la potenza di calcolo ai sensori ed attuatori, utilizzando architetture a microservizi.

### Place di un App in Cloud Edge Continuum

Come possiamo piazzare meglio i nostri microservizi su una rete di k nodi? Questo corrisponde ad un problema di selezione di sottografo in grafo dato (problema NP hard). La scelta del deploy di microservizio su nodo viene fatta in base a criteri come:
- Hardware
- Software
- Quality of Service (Response Time, Reliability, InterService Latency)

Quindi in realtà bisogna coprire a anche questi criteri.

Un altro fattore importante è anche il **data gravity** ossia il fatto che il peso dei dati potrebbe richiedere l'avvicinamento tra i due attori in questione.

C'è anche bisogno di sicurezza sui vari nodi del grafo dell'infrastruttura.

Livelli di **trust** e **sustainability** sono importanti.

Anchè l'infrastruttura è topic di studio dato che sarà necessario capire come si evolverà e come sarà distribuita sui nodi disponibili.

### Approcci di Place App Cloud Edge Continuum

1. **Machine Learning**: Soffre il dinamismo dell'infrastruttura.
2. **MILP**: Formulabile con programmazione lineare ed applicando il simplesso. Questo trova l'ottimo ma è complesso da formulare e risulta lento.
3. **Declarative Programming**: Utilizzando logica del prim'ordine si dichiara cosa sia necessario fare, definisci cosa è una soluzione, non come arrivarci. E' facile da formulare.

In ogni caso il dinamismo della rete è molto alto, tutto cambia nel tempo, dunque è necessario fare del **management**.

**Monitoring**: Permette di osservare lo stato dei microservizi di un applicazione, utilizzando del continuous reasoning, ossia gestione incrementale dei microservizi.
