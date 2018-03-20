pragma solidity ^0.4.2;

contract RiddleMeThis {

    event NewGuesser(uint guesserId, string name);

    bytes32 public constant hashedAnswer = a477d97b122e6356d32a064f9ee824230d42d04c7d66d8e7d125a091a42b0b25;

    struct Guesser{
        uint id;
        string name;
    }

    Guesser[] public guessers;

    function _createGuesser(uint _id, string _name) private {
        uint id = guessers.push(Guesser(_id, _name)) - 1;

        // Set off the event that there is a new guesser
        NewGuesser(_id, _name);
    }

    function () private payable {
    }

    function claim (string answer) private {
        require(keccak256(answer) == hashedAnswer);
        msg.sender.transfer(this.balance);
    }

}
