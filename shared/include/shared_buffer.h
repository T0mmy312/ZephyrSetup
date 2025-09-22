#ifndef SHARED_BUFFER_H
#define SHARED_BUFFER_H

#include <stdint.h>
#include <zephyr/kernel.h>

/*
 * Shared buffer between M7 and M4 cores.
 * 
 * Why:
 * - Both cores run independently, so they cannot rely on standard RAM being coherent.
 * - The M7 core has a data cache. If we put this buffer in regular SRAM, 
 *   the M4 may read stale data from M7’s cache. 
 * - SRAM4 is an uncached memory region (or can be configured non-cached),
 *   so both cores can safely access it.
 *
 * The 'volatile' keyword ensures the compiler does not optimize away reads/writes,
 * which is critical in inter-core communication.
 */
#define SHARED_BUFFER __attribute__((section(".shared_ram"))) volatile

// example:
//SHARED_BUFFER uint32_t shared_data[16];

// --------------------------------------------------
// shared buffers:
// --------------------------------------------------

#endif