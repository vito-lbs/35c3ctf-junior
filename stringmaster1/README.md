lol

so i got "replace" and "swap" confused and tried to swap a digit that didn't exist in the string and owo what's this? some line noise?

turns out that C++'s string#find function (or at least this impl) doesn't stop you from running off the end of the buffer

so we can use this to rewrite the return pointer to `main` to instead go to `spawm_shell`

with the caveat that you gotta get the correct address to `spawn` shell in, and you might have to use `replace` multiple times to gobble up any other bytes that also match between the string and the return pointer
