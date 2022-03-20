pragma solidity >=0.4.22 <0.9.0;

contract TodoList {
  uint public taskCount = 0;  //state of smart contracts in the blockchain

   struct Task {
    uint id;
    string content;
    bool completed;
  }

  mapping(uint => Task) public tasks;

  event TaskCreated(
    uint id,
    string content,
    bool completed
  );

  event TaskCompleted(
    uint id,
    bool completed
  );

  constructor() public {  //it is a default task 
    createTask("KEEP GOING !! YOU ARE SMART");
  }

//put the task inside mapping
  function createTask(string memory _content) public {
    taskCount ++;
    tasks[taskCount] = Task(taskCount, _content, false); //false because it's not completed
    emit TaskCreated(taskCount, _content, false);
  }

  function toggleCompleted(uint _id) public {
    Task memory _task = tasks[_id];
    _task.completed = !_task.completed;
    tasks[_id] = _task;
    emit TaskCompleted(_id, _task.completed);
  }

}