# sqrtnewton

This is a COBOL rewrite of a Fortran program that is a rewrite of a REXX script that I came across similar to the one on Wikipedia [Rexx](https://en.wikipedia.org/wiki/Rexx) to find the square root of a positive number.

I have modified the code to include:
- Correct for negative numbers
- Set a limit for iterations
- Set tolerances for 32 bit REAL numbers
- It also sanitises the input in case the user types something other than a number, also JES/JCL seems to not like numbers all that much being passed by SYSIN

This all came about as I am doing some courses on using the z/OS and writing code in REXX is one of the course modules.

I got bored.