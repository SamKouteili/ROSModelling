#include "ros/ros.h"
#include "std_msgs/String.h"

void writeMsgToLog(const std_msgs::String::ConstPtr& msg){

  ROS_INFO("Message Recieved: %s", msg->data.c_str());
  
}


int main(int argc, char **argv){

  ros::init(argc, argv, "Subscriber");
  ros::NodeHandle nh;

   ros::Rate loop_rate(1);

   while (ros::ok()){

    ros::Subscriber topic_sub = nh.subscribe("topic1", 1, writeMsgToLog);
    ros::Subscriber topic_sub = nh.subscribe("topic2", 1, writeMsgToLog);

    ros::spin();
    loop_rate.sleep();

   }

  


  return 0;
  
}
