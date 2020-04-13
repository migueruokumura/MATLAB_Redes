%vernam cipher
%codigo sacado de https://programsofmatlab.blogspot.com/2018/10/vernam-cipher-matlab-code.html
clc;
clear all;
close all;
a1=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
b1=[0:25];
tc='tangananica y tanganana';
code='ratnoiuyuge u aymetpsfy';
display(tc);
display(code);
for ii=1:length(tc)
    for jj=1:length(a1)
        if tc(ii)==a1(jj);
            w1(ii)=b1(jj);
        end
        if code(ii)==a1(jj)
           c1(ii)=b1(jj);
        end
    end
end
newcode=w1+c1;
for ii=1:length(newcode)
    if(newcode(ii)>25);
        newcode(ii)=newcode(ii)-26;
    else
        continue
    end
end
display(newcode);
for ii=1:length(newcode)
    for jj=1:length(b1)
        if newcode(ii)==b1(jj)
           finalcode(ii)=a1(jj);
        else
            continue
        end
    end
end
display(finalcode);