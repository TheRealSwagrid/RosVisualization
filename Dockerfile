FROM osrf/ros:noetic-desktop-full

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y xcb git
RUN rm /opt/ros/noetic/share/rviz/default.rviz
RUN git clone https://github.com/TheRealSwagrid/PlacerRobot.git
RUN sudo apt-get update

RUN cp PlacerRobot/PlacerRobot.py PlacerRobot/ros_ws/src/robothandler/src
COPY AbstractVirtualCapability.py PlacerRobot/ros_ws/src/robothandler/src
RUN cd PlacerRobot/ros_ws && source /opt/ros/noetic/setup.bash && catkin_make
#COPY default.rviz /opt/ros/noetic/share/rviz/
ENTRYPOINT ["/ros_entrypoint.sh"]


CMD source /ros_ws/devel/setup.bash && rviz 
