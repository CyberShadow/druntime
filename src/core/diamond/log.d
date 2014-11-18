/**
 * Binary memory log component of Diamond, the D Memory Debugger.
 *
 * Copyright: Copyright Vladimir Panteleev 2008 - 2014.
 * License:   $(WEB www.boost.org/LICENSE_1_0.txt, Boost License 1.0).
 * Authors:   Vladimir Panteleev
 */

module core.diamond.log;

import core.diamond.types;

import core.stdc.stdio;
import core.stdc.time;

nothrow:
@nogc:

// TODO: make this configurable
static const char* LOGDIR = "";

__gshared FILE* log;

void logInt(ulong i) { fwrite(&i, 4, 1, log); }
void logPtr(void* p) { logInt(cast(ulong)p); }
void logData(void[] d) { fwrite(d.ptr, d.length, 1, log); }
void logTime() { logInt(time(null)); }

// from core.runtime
void** getBasePtr()
{
    version( D_InlineAsm_X86 )
        asm @nogc nothrow { naked; mov EAX, EBP; ret; }
    else
    version( D_InlineAsm_X86_64 )
        asm @nogc nothrow { naked; mov RAX, RBP; ret; }
    else
        return null;
}

extern (C) void* thread_stackBottom();

void logStackTrace()
{
	auto  stackTop    = getBasePtr();
	auto  stackBottom = cast(void**) thread_stackBottom();
	void* dummy;

	if (stackTop && &dummy < stackTop && stackTop < stackBottom)
	{
	    for (void** stackPtr = stackTop; stackTop <= stackPtr && stackPtr < stackBottom; stackPtr = cast(void**) *stackPtr)
	    {
	        auto fp = *(stackPtr + 1);
	        if (fp)
				logPtr(fp);
	    }
	}

	logPtr(null);
}

void logOpen()
{
	time_t t = time(null);
	tm *tm = localtime(&t);
	char[256] name;
	sprintf(name.ptr, "%sdiamond_%d-%02d-%02d_%02d.%02d.%02d.mem", LOGDIR ? LOGDIR : "", 1900+tm.tm_year, tm.tm_mon, tm.tm_mday, tm.tm_hour, tm.tm_min, tm.tm_sec);
	log = fopen(name.ptr, "wb");
	logInt(LogFormatVersion);
}

void logClose()
{
	//printf("Closing memory log...\n");
	fclose(log);
}

void logFlush()
{
	fflush(log);
}
