module etc.valgrind.valgrind;

extern(C) nothrow
{
    void _d_valgrind_make_mem_noaccess(void* addr, size_t len);
    void _d_valgrind_make_mem_undefined(void* addr, size_t len);
    void _d_valgrind_make_mem_defined(void* addr, size_t len);
}

void makeMemNoAccess(void* addr, size_t len) nothrow { _d_valgrind_make_mem_noaccess(addr, len); }
void makeMemUndefined(void* addr, size_t len) nothrow { _d_valgrind_make_mem_undefined(addr, len); }
void makeMemDefined(void* addr, size_t len) nothrow { _d_valgrind_make_mem_defined(addr, len); }
