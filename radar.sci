clf;

clear;
t = 0:0.01:20

function ts=f(t)
    if t<2 then
        ts = sin (10*t)
    else
        ts = 0
    end
     
endfunction

subplot(221);
plot(t,f);

function ns=f2(t)
    
    ns = (sin (4*t)/5 - sin (2*t)/5 + sin (9*t)/7 - sin(8*t)/6)/2 ;
     
endfunction



rd = grand(1,1,"uin",2,9);
subplot(222)
plot(t,f2);

function rs=f1(t)
    
   // rs = (f(t-rd)*14)/15 + f2(t);
    
    if t>rd&t<(2+rd) then
        rs = (f(t-rd)*14)/15 + f2(t); //sin (4*t)/5 - sin (2*t)/5 + sin (9*t)/7 - sin(8*t)/6 ;
    else
        rs = f2(t);//sin (4*t)/5 - sin (2*t)/5 + sin (9*t)/7 - sin(8*t)/6;
    end
    
endfunction

subplot(223)
plot(t,f1);

for n = 1:11
    function ts1=f0(t)
       ts1 = f(t-n)
     
    endfunction
    function new=g(t)
        
        new = f0(t) * f1(t);
     
    endfunction
    intvalue = intg(0,20,g);
    if n==1 then
        td=n
        maxi= intvalue
    else
        if intvalue>maxi then
            td=n
            maxi=intvalue
        end
    end
end

disp(td,"Delay : ");
