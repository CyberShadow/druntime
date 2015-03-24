module etc.valgrind.valgrind;

extern(C) nothrow
{
    void _d_valgrind_make_mem_noaccess (void* addr, size_t len);
    void _d_valgrind_make_mem_undefined(void* addr, size_t len);
    void _d_valgrind_make_mem_defined  (void* addr, size_t len);
    void _d_valgrind_get_vbits(void* addr, ubyte* bits, size_t len);
    void _d_valgrind_set_vbits(void* addr, ubyte* bits, size_t len);
    void _d_valgrind_disable_addr_reporting_in_range(void* addr, size_t len);
    void _d_valgrind_enable_addr_reporting_in_range (void* addr, size_t len);
}

void makeMemNoAccess (void[] mem) nothrow { _d_valgrind_make_mem_noaccess (mem.ptr, mem.length); }
void makeMemUndefined(void[] mem) nothrow { _d_valgrind_make_mem_undefined(mem.ptr, mem.length); }
void makeMemDefined  (void[] mem) nothrow { _d_valgrind_make_mem_defined  (mem.ptr, mem.length); }

void getVBits(void[] mem, ubyte[] bits) nothrow
{
    assert(mem.length == bits.length);
    _d_valgrind_get_vbits(mem.ptr, bits.ptr, mem.length);
}

void setVBits(void[] mem, ubyte[] bits) nothrow
{
    assert(mem.length == bits.length);
    _d_valgrind_set_vbits(mem.ptr, bits.ptr, mem.length);
}

void disableAddrReportingInRange(void[] mem) nothrow
{
    _d_valgrind_disable_addr_reporting_in_range(mem.ptr, mem.length);
}

void enableAddrReportingInRange(void[] mem) nothrow
{
    _d_valgrind_enable_addr_reporting_in_range(mem.ptr, mem.length);
}
