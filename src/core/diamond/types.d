/**
 * Common declarations used by Diamond, the D Memory Debugger.
 *
 * Copyright: Copyright Vladimir Panteleev 2008 - 2014.
 * License:   $(WEB www.boost.org/LICENSE_1_0.txt, Boost License 1.0).
 * Authors:   Vladimir Panteleev
 */

module core.diamond.types;

enum PacketType : int
{
	malloc,
	calloc,
	realloc,
	extend,
	free,
	memoryDump,
	memoryMap,
	text,
	newClass, // metainfo
}

const uint LogFormatVersion = 0x0002_0000; // format of the log file
