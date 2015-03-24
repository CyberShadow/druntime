#include <valgrind/valgrind.h>
#include <valgrind/memcheck.h>
#include <stddef.h> /* size_t */

void _d_valgrind_make_mem_noaccess(void* addr, size_t len)
{
    VALGRIND_MAKE_MEM_NOACCESS(addr, len);
}

void _d_valgrind_make_mem_undefined(void* addr, size_t len)
{
    VALGRIND_MAKE_MEM_UNDEFINED(addr, len);
}

void _d_valgrind_make_mem_defined(void* addr, size_t len)
{
    VALGRIND_MAKE_MEM_DEFINED(addr, len);
}
