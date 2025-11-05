# Docker Swarm e Microservizi

1. docker swarm init ci permette di avviare uno swarm (un nodo Manager), questo esporrà ip, porta e token per le connessioni ai worker
2. docker join [TOKEN] [IP:PORTA] ci permette di connettere nuovi nodi worker allo swarm del manager creato prima
3. docker service update --replicas 3 sleep-app ci permette di replicare 3 volte il servizio passato come secondo argomento, in questo caso "sleep-app"
4. docker node update --availability drain NODE_ID ci permette di svuotare il nodo contrassegnato da NODE_ID dai suoi container
5. docker stack services [STACK] permette di leggere tutti i servizi presenti su uno stack
6. docker service ps [SERVIZIO] permette di visualizzare tutti i task di un servizio