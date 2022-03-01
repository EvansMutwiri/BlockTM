// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Investment {
    uint256 totalBalance;
    uint256 totalDeposit;
    uint256 threshHold;
    uint256 roi;

    event BalanceChange(uint256 totalDeposit, uint256 totalBalance);

    constructor() {
        // set the limit deposit to earn benefits
        threshHold = 15;
        roi = 3;
    }

    function getWallet()
        public
        view
        returns (
            //wallet state
            uint256 _balanceAmount,
            uint256 _depositValue
        )
    {
        return (_balanceAmount = totalBalance, _depositValue = totalDeposit);
    }

    function addDepositAmount(uint256 deposit) public {
        totalDeposit += deposit; // increase deposit
        totalBalance -= deposit; // decrease deposit

        if (totalDeposit >= threshHold) {
            // check if will have return
            totalBalance += roi;
        }
        emit BalanceChange(totalDeposit, totalBalance); // emit event
    }

    function withdrawAmount(uint256 withdraw) public {
        require(totalBalance >= withdraw, "Insufficient funds");

        //condition met
        totalBalance -= withdraw; // deduce the withdraw amount from the balance
        totalDeposit = 0;

        emit BalanceChange(totalDeposit, totalBalance);
    }
}
