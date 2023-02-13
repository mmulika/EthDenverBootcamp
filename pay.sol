pragma solidity ^0.8.0;

contract PayAsYouEarn {
    address public lender;
    address public borrower;
    uint256 public principal;
    uint256 public interestRate;
    uint256 public payPeriod;
    uint256 public term;
    uint256 public nextPayment;
    uint256 public amountOwed;

    constructor(address _lender, address _borrower, uint256 _principal, uint256 _interestRate, uint256 _payPeriod, uint256 _term) public {
        lender = _lender;
        borrower = _borrower;
        principal = _principal;
        interestRate = _interestRate;
        payPeriod = _payPeriod;
        term = _term;
        nextPayment = block.timestamp + payPeriod;
        amountOwed = principal + (principal * interestRate / 100);
    }

    function repay() public payable {
        require(msg.sender == borrower, "Only the borrower can make repayments");
        require(msg.value >= amountOwed / term, "Repayment amount must be equal or greater than the owed amount");
        require(now >= nextPayment, "It is not yet time for the next repayment");
        lender.transfer(msg.value);
        nextPayment = nextPayment + payPeriod;
    }
}
