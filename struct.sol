// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Struct{

    struct Employee{
        uint id;
        address add;
        uint  salary;
    }


//array of employee
    Employee[]  public founder;

    function createEmployee(uint _id) public {
        Employee memory founder;
        founder.id = _id;
        founder.push(founder);
    }

    

}