function [X] = dtft(x, n, w)
% General DTFT using matrix-vector product
% x: signal values, row or column vector
% n: sample positions (must match x)
% w: vector of frequency points (rad/sample)

% 모양 맞추기
x = x(:).';     
n = n(:).';    

E = exp(-1j * (w(:) * n));   

% matrix-vector product
X = E * x.';    
end
