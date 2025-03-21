x=[1 1 1 1 1];
h=[3 2 1];

y=conv(x,h);
t=0:6;
stem(t,y);