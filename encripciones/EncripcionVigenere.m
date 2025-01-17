clc;
clear all;
close all;
function v = vigenere
% VIGENERE Return a Vigenere square in a 27x27 matrix.

    % Square 27 on a side
    count = 27;
    % Map letters to numbers, A=1, B=2, ... SPACE=27
    alpha = 1:count;
    % Create a matrix with 27 shifted substitution alphabets
    %   1 2 3 4 5 ... 26 27
    %   2 3 4 5 6 ... 27  1
    %   3 4 5 6 7 ...  1  2
    % etc.
    v = arrayfun(@(n) circshift(alpha, [0, -n]), 0:count-1, ...
                 'UniformOutput', false);
    v = reshape([v{:}], count, count);
end
function ciphertext = encrypt(plaintext, key)
    v = vigenere;

    % Squeeze out everything except letters and the space character
    exclude = regexp(plaintext, '[^a-zA-Z ]');
    plaintext(exclude) = [];

    % Make the key and the plaintext lower case, and convert to
    % numeric values.
    key = lower(key) - double('a') + 1;
    key(key < 0) = 27;
    plaintext = lower(plaintext) - double('a') + 1;
    plaintext(plaintext < 0) = 27;

    % Replicate the key so that it is as long as the plaintext.
    keyIndex = mod(0:(numel(plaintext)-1), numel(key))+1;
    k = key(keyIndex);

    % Encrypt: C(n) = V(k(n), plaintext(n))
    ciphertext = arrayfun(@(m,n) v(m,n), k, plaintext) - 1;
    ciphertext(ciphertext == 26) = double(' ') - double('a');
    ciphertext = upper(char(ciphertext + double('a')));
end
function plaintext = decrypt(ciphertext, key)
    v = vigenere;

    % Convert the key and the ciphertext to one-based numeric values;
    % A=1, B=2, etc. SPACE=27
    key = lower(key) - double('a') + 1;
    key(key < 0) = 27;
    ciphertext = lower(ciphertext) - double('a') + 1;
    ciphertext(ciphertext < 0) = 27;

    % Replicate the key so that it is as long as the ciphertext.
    keyIndex = mod(0:(numel(ciphertext)-1), numel(key))+1;
    k = key(keyIndex);

    % Decrypt. Each letter of the key determines a row in the Vigenere
    % square. In that row, find the column index of the corresponding
    % ciphertext letter. Convert the index back to a letter to determine
    % the decrypted character (1=A, 2=B, etc.).
    plaintext = arrayfun(@(m,n) find(v(m,:) == n), k, ciphertext) - 1;
    plaintext(plaintext == 26) = double(' ') - double('a');
    plaintext = upper(char(plaintext + double('a')));
end

