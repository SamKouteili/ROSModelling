# inspired from:
# https://answers.ros.org/question/312577/catkin_make-command-not-found-executing-by-a-dockerfile/

FROM ros:melodic


# install build tools
RUN apt-get update && apt-get install -y \
      python-catkin-tools git \
    && rm -rf /var/lib/apt/lists/*


# copy ros package 
ENV ROS_WS /opt/ros_ws
RUN mkdir -p $ROS_WS/src
ADD 1Pub1Topic2Sub $ROS_WS/1Pub1Topic2Sub
RUN ls $ROS_WS/
WORKDIR $ROS_WS/1Pub1Topic2Sub

# Compile it
RUN rm -rf CMakeCache.txt CMakeFiles cmake_install.cmake msg_gen srv_gen build
RUN /bin/bash -c '. /opt/ros/melodic/setup.bash; catkin_make'

# launch ros package
CMD ["/bin/bash", "-c", ". devel/setup.bash; roslaunch test.launch"]
