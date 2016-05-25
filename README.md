# prime-factor

Find a prime factor of 3^(3^(3^3))+2^(2^(2^2))

Why this number ?

The numbers

2+3

2^2+3^3

2^(2^2)+3^(3^3)

are prime.

The number 2^(2^(2^2))+3^(3^(3^3)) is very probably composite.

Since a primility check (even a probable-prime-check) is virtually infeasible, the only hope is to find at least one prime factor to show that the number is composite.


The function necessary for checking whether a given number is a factor is :

With GAP http://www.gap-system.org/ : 

> remainder:=function(p);return (PowerMod(3,3^(3^3),p)+2^16) mod p;end;

With PARI/GP http://pari.math.u-bordeaux.fr/ : 

> remainder(p)={local(j,x);x=3;for(j=1,27,x=component(Mod(x^3,p),2));x=x+2^16;x=component(Mod(x,p),2);x}

If remainder returns the value 0 then a factor is found.

Here : http://math.stackexchange.com/questions/625576/prime-factor-of-2-uparrow-uparrow-4-3-uparrow-uparrow-4?rq=1 
it is claimed that there is no prime factor below 2*10^10, but there is no verification yet.

If you have verified that an interval (it should have at least size 10^9) does not contain a prime factor, please send an issue in the following way :

The interval [ 2 x 10^9 , 3 x 10^9 ] does not contain a prime factor.


Now, join in and have fun.
