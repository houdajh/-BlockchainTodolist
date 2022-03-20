var TodoList = artifacts.require("./TodoList.sol");
//TodoList the name of the smart contracts that we created
module.exports = function(deployer) {
  deployer.deploy(TodoList);
};