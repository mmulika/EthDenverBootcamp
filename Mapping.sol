// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract Mapping{

    mapping(address => uint)  store;
    event scoreSet(uint);

    function setScore(address _add, uint _i) public {
        store[_add] = _i;
        emit scoreSet(_i);
    }

    function getScore(address _add) public  view returns   (uint) {

        return store[_add];

    }

    function deleteScore(address _add) public{
        delete store[_add];
    }
}