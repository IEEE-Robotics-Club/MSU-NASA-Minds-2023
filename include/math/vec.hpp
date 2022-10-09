// vec.h
#ifndef VEC_H
#define VEC_H

struct Vec2
{
    float i = 0, j = 0;

    Vec2();
    Vec2(const Vec2& arg);
    Vec2(float x, float y);

    Vec2& operator=(const Vec2& second);

    Vec2 operator+(const Vec2& second) const;
    Vec2 operator-(const Vec2& second) const;

    float operator*(const Vec2& second) const;  // dot product
    Vec2 operator*(const float second) const;
};


struct Vec3
{
    float i = 0, j = 0, k = 0;

    Vec3();
    Vec3(const Vec3& arg);
    Vec3(float x, float y, float z);

    Vec3& operator=(const Vec3& second);

    Vec3 operator+(const Vec3& second) const;
    Vec3 operator-(const Vec3& second) const;

    float operator*(const Vec3& second) const;  // dot product
    Vec3 operator*(const float second) const;
};


float magnitude(Vec2 vec);
float magnitude(Vec3 vec);


Vec3 crossProduct(Vec3 first, Vec3 second);
Vec3 proj(Vec3 u, Vec3 v);


Vec2 normalize(Vec2 vec);
Vec3 normalize(Vec3 vec);

float AngleFromHorizontal(Vec2 vec);

#endif