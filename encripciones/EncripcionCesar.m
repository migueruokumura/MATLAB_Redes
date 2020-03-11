clc
clear all
close all

%input
tc ='SOLO QUIERO saber si siguen ahi'

%process

ascii = double(tc)%cada caracter lo pasa a ascii
criptograma = ascii + 3
cesar = char(criptograma)%cada caracter ascii a alfabeto encriptado



%output
fprintf('Texto Claro: %s \n',tc)
fprintf('Criptograma: %s \n\n',cesar)