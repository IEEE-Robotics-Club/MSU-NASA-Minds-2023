#include "Motor.h"

class Motion {
    private:
    Motor motors[6];

    public:
    void forward();
    void turnLeft();
    void turnRight();
    void reverse();
    void brake();
    void sleep();

    Motion();
};