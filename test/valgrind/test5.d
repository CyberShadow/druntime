// Use-after-GC (escaping heap reference).

struct S
{
    ~this()
    {
        import std.stdio; writeln("Bye!");
    }
}

void main()
{
    auto arr = new S[10];
    delete arr;
}
