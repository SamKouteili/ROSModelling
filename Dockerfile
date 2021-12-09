# inspired from:
# https://answers.ros.org/question/312577/catkin_make-command-not-found-executing-by-a-dockerfile/

FROM ros:melodic


# install build tools
RUN apt-get update && apt-get install -y \
      python-catkin-tools \
    && rm -rf /var/lib/apt/lists/*




# install ros package
RUN apt-get update && apt-get install -y \
    git && \
    rm -rf /var/lib/apt/lists/*



# clone ros package repo
ENV ROS_WS /opt/ros_ws
RUN mkdir -p $ROS_WS/src
WORKDIR $ROS_WS
RUN git clone https://github.com/SamKouteili/ROSModelling.git


RUN  chmod +x /opt/ros/melodic/setup.sh

#RUN /opt/ros/melodic/setup.sh && cd ROSModelling/1Pub1Topic2Sub && catkin_make

WORKDIR $ROS_WS/ROSModelling/1Pub1Topic2Sub
RUN rm -rf CMakeCache.txt CMakeFiles cmake_install.cmake msg_gen srv_gen build
RUN /bin/bash -c '. /opt/ros/melodic/setup.bash; catkin_make'

CMD ["roscore"]

# launch ros package
#CMD ["ros2", "launch", "demo_nodes_cpp", "talker_listener.launch.py"]

