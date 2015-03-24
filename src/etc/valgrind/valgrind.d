module etc.valgrind.valgrind;

extern(C) nothrow
{
    void _d_valgrind_make_mem_noaccess (void* addr, size_t len);
    void _d_valgrind_make_mem_undefined(void* addr, size_t len);
    void _d_valgrind_make_mem_defined  (void* addr, size_t len);
}

void makeMemNoAccess (void[] mem) nothrow { _d_valgrind_make_mem_noaccess (mem.ptr, mem.length); }
void makeMemUndefined(void[] mem) nothrow { _d_valgrind_make_mem_undefined(mem.ptr, mem.length); }
void makeMemDefined  (void[] mem) nothrow { _d_valgrind_make_mem_defined  (mem.ptr, mem.length); }
