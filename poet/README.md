downloaded binary


ran it, it's a poem thing

worried it was the hacker level chall from cccamp15 ctf which was format strings and such

looked at it in binary ninja, noticed that poem score increments based on eat sleep pwn repeat meme's

but also noticed that the author name variable is right next to the score variable

clobbered that variable with "A" again, saw a weird looking score that was half-clobbered with 0x41

clobbered that variable with the right amount of "A", and the correct score

win
