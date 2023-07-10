FROM osrf/ros:noetic-desktop-full

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y xcb git
#RUN rm /opt/ros/noetic/share/rviz/default.rviz
RUN git clone https://github.com/TheRealSwagrid/PlacerRobot.git
RUN git clone https://github.com/TheRealSwagrid/BlockHandler.git
RUN git clone https://github.com/TheRealSwagrid/VirtualCopter.git
RUN sudo apt-get update

RUN cp PlacerRobot/PlacerRobot.py PlacerRobot/ros_ws/src/robothandler/src
COPY AbstractVirtualCapability.py PlacerRobot/ros_ws/src/robothandler/src
#RUN cd PlacerRobot/ros_ws && source /opt/ros/noetic/setup.bash && catkin_make

RUN cp BlockHandler/BlockHandler.py BlockHandler/ros_ws/src/blockhandler/src
COPY AbstractVirtualCapability.py BlockHandler/ros_ws/src/blockhandler/src
RUN cp -R BlockHandler/ros_ws/src/blockhandler PlacerRobot/ros_ws/src/

RUN cp VirtualCopter/VirtualCopter.py VirtualCopter/ros_ws/src/copterhandler/src
COPY AbstractVirtualCapability.py VirtualCopter/ros_ws/src/copterhandler/src
RUN cp -R VirtualCopter/ros_ws/src/copterhandler PlacerRobot/ros_ws/src/

RUN cd PlacerRobot/ros_ws && source /opt/ros/noetic/setup.bash && catkin_make
#RUN cd BlockHandler/ros_ws && source /opt/ros/noetic/setup.bash && catkin_make


COPY default.rviz /opt/ros/noetic/share/rviz
ENTRYPOINT ["/ros_entrypoint.sh"]


CMD source PlacerRobot/ros_ws/devel/setup.bash && rviz 
