# **_Voting System en Solidity_**

# **_Smart Contract de sistema de votaciones creado en lenguaje Solidity._**

## Trabajo práctico grupal final del curso de Solidity Bootcamp by Web3 Latinas y Ethereum Foundation, impartido por la academia Blockdemy en su edición Beca para 100 mujeres seleccionadas de LATAM. Creado por *Stefani Martinez Sifuentes* y *Nancy Scipioni*.

## Este sistema de votación creado en tecnología Blockchain resuelve una problemática a la hora de recontar votos, ya que la función findWinner y la función WinnerName son prácticamente automáticas y dan el resultado con tan solo presionar un botón. Además se genera una cierta anonimidad en el sistema, ya que solo se requiere del address del votante para poder habilitarlo a realizar su voto. Asimismo, solo el owner y el comité eleccionario puede darle el derecho a voto.

## Tecnologías utilizadas:

* Remix IDE 0.27.0 (https://remix.ethereum.org) Utilizado para escribir el código, probarlo y deployarlo de manera local y el la red de prueba de Goerli.
* Lenguaje Solidity (https://soliditylang.org/) Utilizado para realizar el código del Smart Contract. Actualmente la versión de este lenguaje es la v0.8.17. Nosotras hemos trabajado sobre la versión 0.8.0 por tema de mayor compatibilidad.
* Metamask virtual wallet (https://chrome.google.com/webstore/detail/metamask/nkbihfbeogaeaoehlefnkodbefgpgknn) Extensión del navegador Chrome compatible con Edge. 
* Red de prueba de Goerli

## Como utilizar este código:

1. Copiarlo o clonarlo desde este repositorio de Github.
2. Abrirlo en la plataforma **_Remix IDE_**, o crear un nuevo archivo en **_Remix_** y pegar en él el código.
3. Chequear que el código compile bien en la pestaña de **_Solidity Compiler_**.
4. Una vez realizados estos pasos, ir a la pestaña de **_Deploy & run transactions_**. Para poder deployar, el contrato pide el array de Candidatos y el array de Partidos. En ambos casos, se escriben utilizando los corchetes, las comillas en el inicio y el final de los nombres de los candidatos o del partido y coma para separarlos*. **_En caso de no cumplir esa regla, el contrato no compila._**
5. Con la función **_AppointMemberOfElectionCommittee_**, se puede especificar mediante la address a los miembros del comité eleccionario.
6. Luego de deployado, hay que autorizar al votante mediante su address con la función **_giveVotingRights_**. El sistema permite cotejar si el votante está en derecho de ejercer su voto y si no hay votado anteriormente. En caso de que se haya registrado el voto con anterioridad, el sistema arroja un mensaje de error.
7. Para abrir la votación, se debe pulsar el botón de **_StartVoting_**. El tiempo comienza a correr (se puede cotejar pulsando el botón **_vT_**).
8. El votante debe votar utilizando el número del candidato en su posición en el array, pulsando el botón **Vote**. Hay que tomar en cuenta que al ser array, el primer valor se especifica en 0 y se va sumando de a 1. En caso de no conocerlo, puede utilizar los números correspondientes en el botón **_ListOfCandidates_**.
9. Mediante el botón **_Owner_**, se puede conocer la dirección del Owner del contrato.
10. Mediante el botón **_Voter_**, y conociendo la dirección del votante, se puede cotejar si está habilitado para votar y si ya emitió el voto.
11. Una vez finalizado el plazo de votación, o si ya se presentaron todos los electores, se debe cerrar la votacón mediante el botón **_FinishVoting_**. Pulsando ese botón deja de correr el tiempo, también visible a través del botón **_vT_**.
12. Para conocer el nombre del candidato ganador, se debe pulsar el botón **_WinnerName_**.

## Licencia utilizada:

**_Licencia MIT (https://mit-license.org/)_**
