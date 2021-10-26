#include "ros/ros.h"
#include "std_msgs/String.h"

void writeMsgToLog(const std_msgs::String::ConstPtr& msg){

  ROS_INFO("Message Recieved: %s", msg->data.c_str());

  ros::Duration(1).sleep();
  
}


int main(int argc, char **argv){

  ros::init(argc, argv, "Subscriber");
  ros::NodeHandle nh;

  ros::Subscriber topic_sub1 = nh.subscribe("topic1", 1, writeMsgToLog);
  ros::Subscriber topic_sub2 = nh.subscribe("topic2", 1, writeMsgToLog);
  
  ros::spin();

  return 0;
  
}
