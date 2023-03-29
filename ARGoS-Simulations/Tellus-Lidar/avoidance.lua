--Simple obstacle avoidance algorithm
--
--Let alpha and theta be angles that correspond to the positive and negative sides with respect to the face angle of the robot.
--If there is a lidar reading that is close enough and whose angle is between alpha and theta
--Then we are in the obstacle avoidance phase range
--
--Turn right untill there is no more reading within the phase range, and return an "avoid" flag.
--
--This flag will trigger a function that calculates an intermediary point relative to the destination
--
--Once we reach the intermediary point, the destination is inserted back into the point queue. 



