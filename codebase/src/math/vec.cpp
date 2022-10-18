#include "vec.hpp"
#include <Arduino.h>


Vec2::Vec2(){x = 0, y = 0;}

Vec2::Vec2(const Vec2& arg){x = arg.x, y = arg.y;}

Vec2::Vec2(float x, float y){this->x = x, this->y = y;}

Vec2& Vec2::operator=(const Vec2& second)
{
    x = second.x, y = second.y;
    return *this;
}


Vec2 Vec2::operator+(const Vec2& second) const {return Vec2(x + second.x, y + second.y);}
Vec2 Vec2::operator-(const Vec2& second) const {return Vec2(x - second.x, y - second.y);}

float Vec2::operator*(const Vec2& second) const {return (x * second.x + y * second.y);}
Vec2 Vec2::operator*(const float second) const {return Vec2(x * second, y * second);}



Vec3::Vec3(){x = 0, y = 0, z = 0;}

Vec3::Vec3(const Vec3& arg){x = arg.x, y = arg.y, z = arg.z;}

Vec3::Vec3(float x, float y, float z){this->x = x, this->y = y, this->z = z;}

Vec3& Vec3::operator=(const Vec3& second)
{
    x = second.x, y = second.y, z = second.z;
    return *this;
}


Vec3 Vec3::operator+(const Vec3& second) const {return Vec3(x + second.x, y + second.y, z + second.z);}
Vec3 Vec3::operator-(const Vec3& second) const {return Vec3(x - second.x, y - second.y, z - second.z);}

float Vec3::operator*(const Vec3& second) const {return (x * second.x + y * second.y + z * second.z);}
Vec3 Vec3::operator*(const float second) const {return Vec3(x * second, y * second,z * second);}



float magnitude(Vec2 vec){return sqrtf(powf(vec.x,2)+powf(vec.y,2));}
float magnitude(Vec3 vec){return sqrtf(powf(vec.x,2)+powf(vec.y,2)+powf(vec.z,2));}


Vec3 proj(Vec3 u, Vec3 v)
{
    return v * ((u * v)/(pow(magnitude(v),2)));
}

Vec2 proj(Vec2 u, Vec2 v)
{
    return v * ((u * v)/(pow(magnitude(v),2)));
}

Vec2 normalize(Vec2 vec){return(vec * (1.f / magnitude(vec)));}
Vec3 normalize(Vec3 vec){return(vec * (1.f / magnitude(vec)));}
float AngleFromHorizontal(Vec2 vec)
{
    Vec2 horizontal(1.f,0.f);
    return acos((vec * horizontal)/ magnitude(vec));
}

Vec3 crossProduct(Vec3 first, Vec3 second){return Vec3(first.y * second.z - first.z * second.y,
first.z * first.x - first.x * second.z, first.x * second.y - first.y * second.x);}