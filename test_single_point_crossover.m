clc
clear

Parent1 = [round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand())]
Parent2 = [round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand())]

Gene_no = length(Parent1);

% single-point crossover using for
ub = length(Parent1) - 1;
lb = 1;
Cross_P = round( (ub-lb) * rand() + lb)

idx = 1;

for i = 1:Cross_P
  Child1(i) = Parent1(i);
  Child2(i) = Parent2(i);
endfor

for i = Cross_P+1:Gene_no
  Child1(i) = Parent2(i);
  Child2(i) = Parent1(i);
endfor

Child1
Child2
