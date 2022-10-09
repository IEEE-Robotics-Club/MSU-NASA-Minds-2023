#include "vec.h"
#include <Arduino.h>


Vec2::Vec2(){i = 0, j = 0;}

Vec2::Vec2(const Vec2& arg){i = arg.i, j = arg.j;}

Vec2::Vec2(float x, float y){i = x, j = y;}

Vec2& Vec2::operator=(const Vec2& second)
{
    i = second.i, j = second.j;
    return *this;
}


Vec2 Vec2::operator+(const Vec2& second) const {return Vec2(i + second.i, j + second.j);}
Vec2 Vec2::operator-(const Vec2& second) const {return Vec2(i - second.i, j - second.j);}

float Vec2::operator*(const Vec2& second) const {return (i * second.i + j * second.j);}
Vec2 Vec2::operator*(const float second) const {return Vec2(i * second, j * second);}



Vec3::Vec3(){i = 0, j = 0, k = 0;}

Vec3::Vec3(const Vec3& arg){i = arg.i, j = arg.j, k = arg.k;}

Vec3::Vec3(float x, float y, float z){i = x, j = y, k = z;}

Vec3& Vec3::operator=(const Vec3& second)
{
    i = second.i, j = second.j, k = second.k;
    return *this;
}


Vec3 Vec3::operator+(const Vec3& second) const {return Vec3(i + second.i, j + second.j, k + second.k);}
Vec3 Vec3::operator-(const Vec3& second) const {return Vec3(i - second.i, j - second.j, k - second.k);}

float Vec3::operator*(const Vec3& second) const {return (i * second.i + j * second.j + k * second.k);}
Vec3 Vec3::operator*(const float second) const {return Vec3(i * second, j * second,k * second);}



float magnitude(Vec2 vec){return sqrtf(powf(vec.i,2)+powf(vec.j,2));}
float magnitude(Vec3 vec){return sqrtf(powf(vec.i,2)+powf(vec.j,2)+powf(vec.k,2));}


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

Vec3 crossProduct(Vec3 first, Vec3 second){return Vec3(first.j * second.k - first.k * second.j,
first.k * first.i - first.i * second.k, first.i * second.j - first.j * second.i);}