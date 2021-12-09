#include "ros/ros.h"
#include "std_msgs/String.h"

int main (int argc, char **argv) {

  ros::init(argc, argv, "Publisher");
  ros::NodeHandle nh;
  int  node_rate = 0;
  if (nh.getParam("node_rate", node_rate))
    {
      ROS_INFO("Got param: %d", node_rate);
    }
  else
    {
      ROS_ERROR("Failed to get param 'node_rate'");
    }
  ros::Publisher topic_pub = nh.advertise<std_msgs::String>("topic1", 1000);
  ros::Rate loop_rate(node_rate);

  int count = 0;
  while (ros::ok()){

    std_msgs::String msg;

    std::stringstream ss;
    ss << "a" << count;
    msg.data = ss.str();

    ROS_INFO("publisher_node PUSHED %s TO topic1", msg.data.c_str());
    
    topic_pub.publish(msg);
    ros::spinOnce();
    loop_rate.sleep();

    count++;
    
  }

  return 0;
    
}
