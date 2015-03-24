// Simply generate some garbage.
// This program should not trigger any Valgrind warnings.

void main()
{
	foreach (i; 0..1000)
	{
		string s;
		foreach (j; 0..1000)
			s ~= 'x';
	}
}
