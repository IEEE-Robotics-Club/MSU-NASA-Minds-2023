/**
 * @file vec.hpp
 * @author Adam Cate (acate@msudenver.edu) aka pepsiman
 * @brief Some basic vector types and operations
 * @version 1.0
 * @date 2022-03-28
 * 
 * @copyright GNU GPL v3.0
 * 
 */
#ifndef VEC_H
#define VEC_H

/**********************************************************************/
  /*! @brief Holds a 2d vector, and supports many vector operations like addition and dot product
   */
  /**********************************************************************/
struct Vec2
{
    float x = 0; //!< x component
    float y = 0; //!< y component

    Vec2();
    Vec2(const Vec2& arg);
    Vec2(float x, float y);

    Vec2& operator=(const Vec2& second);        // vector assignment

    Vec2 operator+(const Vec2& second) const;   // vector addition
    Vec2 operator-(const Vec2& second) const;   // vector subtraction

    float operator*(const Vec2& second) const;  // dot product
    Vec2 operator*(const float second) const;   // vector number product
};

/**********************************************************************/
  /*! @brief Holds a 3d vector, and supports many vector operations like addition and dot product
   */
  /**********************************************************************/
struct Vec3
{
    float x = 0, y = 0, z = 0;

    Vec3();
    Vec3(const Vec3& arg);
    Vec3(float x, float y, float z);

    Vec3& operator=(const Vec3& second);

    Vec3 operator+(const Vec3& second) const;
    Vec3 operator-(const Vec3& second) const;

    float operator*(const Vec3& second) const;  // dot product
    Vec3 operator*(const float second) const;
};


float magnitude(Vec2 vec);  // calculates the magnitude of a 2d vector
float magnitude(Vec3 vec);  // calculates the magnitude of a 3d vector


Vec3 crossProduct(Vec3 first, Vec3 second); // calculate cross product between two 3d vectors
Vec3 proj(Vec3 u, Vec3 v);                  // projection of u onto v


Vec2 normalize(Vec2 vec);                   // normalize a 2d vector
Vec3 normalize(Vec3 vec);                   // normalize a 3d vector

float AngleFromHorizontal(Vec2 vec);        // angle from horizontal of a vector

#endif