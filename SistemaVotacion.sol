//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract VotingSystem{

    struct candidates{
        uint8 id;
        string name;
        string party;
        uint256 votes;
    }

    struct Voters{
     
        bool registeredVote;
        bool canVote;
    }

    struct VotingTime{
        uint startTime; 
        uint endTime; 
    }

    mapping(address => Voters) public voters;

    mapping(uint256 => bool) public votersExists;

    mapping(uint256 => bool) hasVoted;

    candidates public c1;
    candidates public c2;

    /*Voters public v1;*/

    VotingTime public vT;

    bool internal isVoterVoting;

    bool internal isVotesCounted;

    bool BallotBoxAdressEnable = false;

    address public owner;

    constructor(
         string memory _name, string memory _party, uint8 _id, string memory _name2, string memory _party2, uint8 _id2){
        owner = msg.sender;
       

        c1.name = _name;
        c1.party = _party;
        c1.id = _id;

        c2.name = _name2;
        c2.party = _party2;
        c2.id =_id2;
    }

    // The modifier that allows only the election owner to access the functions
    modifier onlyElectionOwner() {
        require(msg.sender == owner,"Only the election owner can access this function.");
        _;
    }

      function StartVoting() public onlyElectionOwner(){ 
    
        vT.startTime = block.timestamp; 
        
    }

    function FinishVoting() public onlyElectionOwner(){
        vT.endTime = block.timestamp; 
        BallotBoxAdressEnable = false; 
    }

     // The modifier that allows to count vote only after the end time
    modifier onlyAfterEndTime() {
        require(vT.endTime <= block.timestamp, "Counting can not be started now.");
        isVotesCounted = true;
        _;
    }

    // The modifier that allows to view results only after the votes have been counted
    modifier onlyAfterCountingVotes() {
        require(isVotesCounted, "Results can be viewed only after the counting has been done.");
        _;
    }

   

     function giveRightToVote(address voter) public onlyElectionOwner{
        require(owner == msg.sender, "No eres el INE DEX");
        voters[voter].canVote = true;
    }


    /*/ The function to vote by the voters
    function vote(uint256 voterId, uint8 idCandidato) public {
        uint256 id = voterId;
        require(votersExists[id], "This voter is not atunticated by the election owner.");
        require(!hasVoted[id], "This voter has already voted.");
        hasVoted[id] = true;
         if(idCandidato == c1.id){
           c1.votes += 1;
       } else{
           c2.votes += 1;
       }*/

        function addvoter(address _voters, uint256 _voterId) public  {
        Voters memory v1;
        v1.voterId = _voterId;
        v1.hasVoted = false;
        
        
    }
    }
