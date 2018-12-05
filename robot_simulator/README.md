# Robot Simulator

A robot factory's test facility needs a program to verify robot movements.

The robots have three possible movements:
- turn right
- turn left
- advance

Robots are placed on a hypothetical infinite grid, facing a particular direction(north, south, east, or west) on a set of coordinates(x,y), with coordinates increasing to the north and the east.

The robot then reveives a number of instructions, at which point the testing facility verifies the robot's new position, and in which direction it is pointing.

The letter-string RAALAL means:
- turn right
- advance twice
- turn left
- advance once
- turn left yet again

Somehow, LS says that, given these instructions, a robot at {west-east, south-north facing north will ened up at {9, 4} facing west...
  -