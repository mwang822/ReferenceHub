function u = control(yd,y)
% Specific illustration of implementation
% equation using the results of discretizing
% the example H(s) in makesscomp.m

  persistent x A B C D
  if isempty(x)
    A = [1.2857   -0.6122    0.1633;
		 0.5000         0         0;
         0    0.2500         0];
    B = [16; 0; 0];
    C = [-1.6266    4.6539   -5.3549];
    D = 27.9344;
	x = zeros(size(A,1),1);
  end
  % Note: it is probably fine to use the default number
  % of digits Matlab shows to set up these matrices.  However,
  % Matlab does all of its calculations in double precision,
  % and for very complex compensators (and or very unstable
  % plants) the truncation error can make a difference when
  % discretizing.  If you have problems, and the theory
  % all checks out, try increasing the precision of the
  % numbers in your implementation matrices (note that the
  % default Matlab precision display is still about 3 decimal
  % places short of even float accuracy in C++).

  e = yd - y;
  u = C*x + D*e;
  x = A*x + B*e;

end

