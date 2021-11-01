# ROS Modelling Cases

This is a repository modelling different interesting ROS use cases. The models presented are simple yet telling of the internal mechanisms ROS employs when managing the flow and movement of data. This repository serves as part of a larger research project investigating, modelling, and analyzing the performance of ROS. 

## Compilation

After having cloned this repository, you can compile any of the presented cases to apply them yourself. This can be done by entering the repository of the model case you want to enter, at which point the following command must be run in the terminal:
```
rm -rf CMakeCache.txt CMakeFiles cmake_install.cmake msg_gen srv_gen
```
This clears all the existing cache, which will allow for the project to properly natively compile. Now, simply call the ROS catkin_make command:
```
catkin_make
```
At this point, the project should compile. *However*, if this does not work, another approach would be to create a new folder with a `src` subfolder in it, as follows:
```
mkdir -p myWorkspace/src
```
Then, run `catkin_make` in the base directory of this newly created repository. This will add `build` and `devel` folders to the repository. At this point, proceed to the `src` folder of one of the existing test cases. Proceed to copy both the `CMakeLists.txt` as well as the `pkg01` folders into the `src` folder of this newly created repository. Then proceed to run `catkin_make` once again in the root of `myWorkspace`. This will recompile the project with the added project.

## Execution

In order to actually run the project, first run:
```
roscore
```
Ensuring that the driver roscore terminal remains active, open a new terminal and run:
```
source devel/setup.bash
```
(Note that this command must be run whenever a new terminal is opened). Now, run
```
rosrun pkg01 
```
Followed by the tab button twice. This will present a list of nodes that can be run in the respective project. From here, chose the node you would like to run, and execute it. An example would be the following:
```
rosrun pkg01 publisher_node2
```
For every new node you want to run, be sure to open another terminal and once again source to setup.bash. Only then can you actually call `rosrun` and find the nodes in the packages.

### Remarks

- We cannot interpret topics as buffers as per the definition ascribed to dataflow graph buffers. Publishers and subscribers do not publish to a shared buffer - rather, they are eached constrained by their own buffered limitations when producing/consuming data to a topic, which can almost be seen as a 'cloud' of information.
- When suscriber nodes subscribe to two different topics, their subscription to said topics is independent. There is no 'competition' between publishers to have access to a subscribers limited buffer, as a indepednet subscriber object, and thus subscriber buffer, is created for each topic a subcscriber is subscribed to.
