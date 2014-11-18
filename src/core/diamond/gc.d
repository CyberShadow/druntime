/**
 * GC interface component of Diamond, the D Memory Debugger.
 *
 * Copyright: Copyright Vladimir Panteleev 2008 - 2014.
 * License:   $(WEB www.boost.org/LICENSE_1_0.txt, Boost License 1.0).
 * Authors:   Vladimir Panteleev
 */

module core.diamond.gc;

import core.diamond.log;
import core.diamond.types;

nothrow:
@nogc:

// TODO: make this configurable at runtime,
// e.g. through an environment variable
enum bool logEnabled = true;

void initialize()
{
	if (logEnabled)
		logOpen();
}

void finalize()
{
	if (logEnabled)
		logClose();
}

void logMalloc(size_t size, void* p)
{
	//printf("Allocated %d bytes at %08X\n", size, p); printStackTrace();
	if (logEnabled)
		if (p)
		{
			logInt(PacketType.malloc);
			logTime();
			logStackTrace();
			logPtr(p);
			logInt(size);
		}
}

void logCalloc(size_t size, void* p)
{
	//printf("Allocated %d initialized bytes at %08X\n", size, p); printStackTrace();
	if (logEnabled)
		if (p)
		{
			logInt(PacketType.calloc);
			logTime();
			logStackTrace();
			logPtr(p);
			logInt(size);
		}
}

void logRealloc(size_t size, void* p1, void* p2)
{
	//printf("Reallocated %d bytes from %08X to %08X\n", size, p1, p2); printStackTrace();
	if (logEnabled)
		if (p2)
		{
			logInt(PacketType.realloc);
			logTime();
			logStackTrace();
			logPtr(p1);
			logPtr(p2);
			logInt(size);
		}
}

void logExtend(void* p, size_t newSize)
{
	if (logEnabled)
		if (newSize)
		{
			logInt(PacketType.extend);
			logTime();
			logStackTrace();
			logPtr(p);
			logInt(newSize);
		}
}

void logFree(void *p)
{
	if (logEnabled)
	{
		logInt(PacketType.free);
		logTime();
		logStackTrace();
		logPtr(p);
	}
}

void logVerbose()
{
	// ...
}
