#include "ros/ros.h"
#include "std_msgs/String.h"

void writeMsgToLog1(const std_msgs::String::ConstPtr& msg){

  ROS_INFO("subscriber_node RECIEVED %s FROM topic1", msg->data.c_str());

  ros::Duration(1).sleep();
  
}

void writeMsgToLog2(const std_msgs::String::ConstPtr& msg){

  ROS_INFO("subscriber_node RECIEVED %s FROM topic2", msg->data.c_str());

  ros::Duration(1).sleep();
  
}

int main(int argc, char **argv){

  ros::init(argc, argv, "Subscriber");
  ros::NodeHandle nh;

  ros::Subscriber topic_sub1 = nh.subscribe("topic1", 1, writeMsgToLog1);
  ros::Subscriber topic_sub2 = nh.subscribe("topic2", 1, writeMsgToLog2);
  
  ros::spin();

  return 0;
  
}
