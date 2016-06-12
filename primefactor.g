# With this program
#
# gap> q:=0;a:=1; b:=25*10^6; s:=a-1; while s<b do s:=NextPrimeInt(s);
# if remainder(s)=0 then Print(s,"\n");q:=q+1;fi;
# if s mod # 10^6=1 then Print((s-1)/10^6,":",q,"\n");fi;od;Print(q);
#
# you can determine the number of prime factors in the range [a,b],
# or to be more precise in the range [a,nextprime(b)].
# Found # factors and some checkpoints will be output.

remainder:=function(p)
  return (PowerMod(3,3^(3^3),p)+2^16) mod p;
end;

PrimeFactorsOnInterval:=function(a,b)
local q,s,u,v;
q:=0;
s:=a-1;
u:=3^(3^3);
v:=2^16;
while s<b do
  s:=NextPrimeInt(s);
  if (PowerMod(3,u,s)+v) mod s = 0 then
    Print(s,"\n");
    q:=q+1;
  fi;
  if s mod 10^6=1 then
    Print((s-1)/10^6,":",q,"\n");
  fi;
od;
return q;
end;

t1:= Runtime();
q := PrimeFactorsOnInterval(1,25*10^6);
t2:= Runtime();

Print( "Number of prime factors found: ", q,"\n");
Print( "Runtime: " , t2-t1, " ms\n");


