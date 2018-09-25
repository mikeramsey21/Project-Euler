%This is essentially a counting argument to find all the reversible numbers
%less than 1 billion, i.e. up through the 9-digit numbers. Thus we count by
%cases by looking at the length of the numbers.

num=0;
%There are no 1-digit numbers that work (n=rev(n) so n+rev(n) is even).

num=num+20;
%There are 20 two-digit numbers that are reversible since n+rev(n) will
%give a number whose digits are both a+b (a and b being the digits of n).
%In order for this (a+b)(a+b) [that's digit notation, not multiplication]
%to be all odd, we must have a+b<10 and a+b is odd. Only 20 combinations
%work (since neither a or b can be 0).

num=num+5*20;
%For 3-digit numbers, if n=abc, n+rev(n) will give (a+c)(2b)(a+c). So we
%must have a carry over in a+c to make the (2b) odd, and a+c must be odd,
%so 2b can't have a carry over. So we have b<5, (which there are 5 choices
%for) and a+c<10 and a+c odd, which there are 20 possibilities for.

num=num+20*30;
%For 4-digit numbers if n=abcd, n+rev(n) will give (a+d)(b+c)(b+c)(a+d).
%Then we can have no carry overs, since if the inner two digits cause a
%carry over, they will be different parity, forcing the outer pair to have
%a carry over to correct for that, and then the outer pair will have
%different parity. So we have a+d<10 and a+d odd and b+c<10 and b+c odd.
%For the a+d case, this is the same as the two-digit numbers since a and d
%still can't be 0, so there's 20 possibilities. The b+c case goes up to 30
%since b and c are allowed to be 0.

num=num+0;
%For 5-digit numbers, if n=abcde, n+rev(n) will give
%(a+e)(b+d)(2c)(b+d)(a+e). Then b+d must have a carry over to correct for
%2c being even. But then the second and fourth digits will have different
%parity, so a+e must have a carry over. This however will make the first
%and last digits have different parity. Thus there are no choices that
%work.

num=num+20*30*30;
%For 6-digit numbers, if n=abcdef, n+rev(n) will give 
%(a+f)(b+e)(c+d)(c+d)(b+e)(a+f). We can make the same arguments here that
%we did with 4-digit numbers and see that we can't have any carry overs.
%This there 20 possibilities for a+f and 30 possibilities each for b+e and
%c+d.

num=num+20*25*20*5;
%This one is hard. For 7-digit numbers, if n=abcdefg, n+rev(n) will give
%(a+g)(b+f)(c+e)(2d)(c+e)(b+f)(a+g). We can see that c+e must have a carry
%over to make 2d odd. This means that b+f must be even since it will
%getting a carry over in the second digit from c+e. Then a+g must have a
%carry over to make b+f odd in the second to last digit. Then b+f CANNOT
%have a carryover, otherwise the first and last digits will have different
%parity. So we have a+g>10 and odd (20 possibilities), b+f<10 and even (25
%possibilities), c+e>10 and odd (20 possibilities), and d<5 (5
%possibilities).

num=num+20*30*30*30;
%For 8-digit numbers, we make the same arguments as 4 and 6 digit numbers,
%except now there are three inner pairs of numbers, so we need three 30s
%when counting up.

num=num+0;
%For the final case of 9-digit numbers, we notice that the argument works
%out the same as in the 5-digit case; in order to make the middle digit
%odd, every other pair of digits must have a carryover, which will result
%in the first and last digits being different parity. Thus there are
%numbers that work

num
%We print our final answer.