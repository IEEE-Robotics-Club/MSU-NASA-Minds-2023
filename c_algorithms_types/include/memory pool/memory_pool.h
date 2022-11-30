/// @file memory_pool.h
/// @copyright Thanks to Mielke of the N64Brew community for the the inspiration and underlying code structure
/// @details Memory pools are useful on embedded systems where many allocations must be made. Using a memory pool isntead of malloc
///     lets the user free a large portion of heap allocated memory all at once

#ifndef MEMORY_POOL_H
#define MEMORY_POOL_H

#include <stddef.h>
#include <stdbool.h>


#ifdef 
__cplusplus extern "C"{
#endif

/**
 * @brief Allocate a memory zone with the given size.
 *
 * @param memory_zone MemZone to use.
 * @param size Size in bytes that the MemZone will have. (eg.: '1*1024*1024' for 1MB)
 */
void mem_zone_init(MemZone *memory_zone, size_t size);

/**
 * @brief Allocate memory from the zone.
 *
 * @param memory_zone MemZone to use.
 * @param size Size in bytes of the memory. (eg.: sizeof(int))
 *
 * @return the memory allocated.
 */
void *mem_zone_alloc(MemZone *memory_zone, size_t size);

/**
 * @brief Free all objects in the zone.
 *
 * @param memory_zone MemZone to use.
 */
void mem_zone_free_all(MemZone *memory_zone);


#ifdef __cplusplus 
}
#endif