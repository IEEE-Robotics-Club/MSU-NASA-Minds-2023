using namespace::std;
#include <string>

class Motor {
    private:
    int p1;
    int p2;
    string motorID;

    public:
    void sleep() {
        digitalWrite(p1, LOW);
        digitalWrite(p2, LOW);
    }

    void forward() {
        digitalWrite(p1, HIGH);
        digitalWrite(p2, LOW);
    }

    void reverse() {
        digitalWrite(p1, LOW);
        digitalWrite(p2, HIGH);
    }

    void brake() {
        digitalWrite(p1, HIGH);
        digitalWrite(p2, HIGH);
    }

    Motor(int p1, int p2, string motorID) {
        this->p1 = p1;
        this->p2 = p2;
        this->motorID = motorID;
    }
};