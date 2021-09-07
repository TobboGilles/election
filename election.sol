pragma solidity ^0.8.4;


contract election {
    uint public Candidatecount;
    uint public votecount;
    string public electionName = "presidentielle Merenso 2022";
    address public admin;
    uint idcandidat;
    
    constructor ()  {
        admin=msg.sender;
         }

    struct Candidate {
        string name;
        string surname;
        uint8 votecount;
        uint idcandidat;
    }
    
    struct process {
        bool autorise;
        bool dejaVote;
        uint choice;
        
    }
    
    mapping(uint => Candidate) public LesCandidates;
    mapping (address=>process) public voters;
    
    function addCandidate (string memory _name, string memory _surname) public  {
        require (admin== msg.sender, "only admin can do that");
        LesCandidates[idcandidat] = Candidate(idcandidat, "_name","_surname",0);
        id++;
        
        
        }
        
        function autoriser (address _add) public view returns (bool success){
            require (admin==msg.sender, "only admin can autoriser");
            voters[_add].autorise;
            return true;
        } 
          
        function voter (uint _choice) public {
          require (voters[msg.sender].dejaVote=false , "you can vote");
          require (voters[msg.sender].autorise = true, "you are authorize");
          voters[msg.sender].choice= _choice;
          voters [msg.sender].dejaVote= true;
          votecount++;
        
        }
               
    
}
