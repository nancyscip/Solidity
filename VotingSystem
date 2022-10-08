//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

//Solo el owner puede hacer uso del contrato, caso contrario queda todo sin efecto
error NotOwner();

contract VotingSystem{
    
    address public OWNER;
    mapping(address => bool) internal ElectionCommittee;
    mapping(address => Voters) public Voter;

//Struct de los candidatos
    struct candidates{
        string name;
        string party;
        uint256 votes;
    }

//Array de los candidatos
    candidates[] public ListOfCandidates;

//Struct de los votantes
    struct Voters{
        uint256 CandidateChosenIndex;
        bool registeredVote;
        bool canVote;
    }

//Struct del tiempo de votación, que se une en una función para arrancar la votacion y a una para pararla
    struct VotingTime{
        uint startTime; 
        uint endTime; 
    }

        VotingTime public vT;

        bool BallotBoxAdressEnable = false;

//Constructor del owner, del comite eleccionario y de los candidatos
    constructor(string[] memory Candidates, string[] memory Parties) {
        OWNER = msg.sender;
        ElectionCommittee[OWNER] = true;
        for (uint i = 0; i < Candidates.length; i++) {
            ListOfCandidates.push(candidates({
                name: Candidates[i],
                party: Parties[i],
                votes: 0
            }));
        }
    }

//Modificador para que sea solo aplicable el contrato al owner
        modifier onlyOwner {
        if( msg.sender != OWNER) { revert NotOwner();}
        _;
    }

        function AppointMemberOfElectionCommittee(address Member) public onlyOwner {
        ElectionCommittee[Member] = true;
    }

//Funcion para iniciar la votacion
        function StartVoting() public onlyOwner{ 
        vT.startTime = block.timestamp; 
        
    }

//Funcion para finalizar la votacion
    function FinishVoting() public onlyOwner{
        vT.endTime = block.timestamp; 
        BallotBoxAdressEnable = false; 
    }

//Funcion para realizar el voto
    function Vote(uint256 ChosenIndex) public {
        Voters storage _voters = Voter[msg.sender];
        require(_voters.canVote == true , "You don't have right to vote, request from any member of Election Committee");
        require(_voters.registeredVote == false , "You have voted already!");
        _voters.registeredVote = true;
        _voters.CandidateChosenIndex = ChosenIndex;
        ListOfCandidates[ChosenIndex].votes+=1;
    }

//Funcion que permite darle derecho de voto a los votantes a traves de su direccion, tambien permite corroborar si ya voto y si puede votar
    function giveVotingRights(address _voters) public {
        require(ElectionCommittee[msg.sender] == true , "Only Member of Election Committee can give voting rights!");
        require(Voter[_voters].registeredVote == false, "This person has already voted!");
        Voter[_voters].canVote = true;
    }

//Funcion que pemite encontrar al ganador de la eleccion
    function findWinner() internal view returns(uint){
        uint WinningIndex;
        uint256 max; 
        for(uint i=0; i< ListOfCandidates.length; i++){
            if(ListOfCandidates[i].votes > max){
                WinningIndex = i;
                max = ListOfCandidates[i].votes;
            }
        }
        return WinningIndex;
    }

//Funcion que permite dar el nombre del ganador, va unida con la funcion findWinner
    function WinnerName() external view returns (string memory winner) {
        winner = ListOfCandidates[findWinner()].name;
    }


}
