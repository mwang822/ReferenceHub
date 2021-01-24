function u = control(yd,y)
% Stub to illustrate most general form
% of discretized implementation equations

% Note: more efficient to define numerical
% components once, when we initialize x
  persistent x A B C D
  if isempty(x)
    A = [-0.1728]; % square matrix
    B = [4]; % column vector
    C = [-6.8024]; % row vector
    D = [25.0003]; % scalar
 	x = zeros(size(A,1),1); 
	% Note: one state (xi variable) for each row of A
	%  (equivalently, for each pole in H(s))
  end

% Do the actual calculations
  e = yd - y;
  u = C*x + D*e;
  x = A*x + B*e;

end

