% LATEXIFY  Script that sets graphics options to output using LaTeX.
%   Entering 'latex' allows use of LaTeX markup such as $\sin x$ in
%   labels and legends by default.

%% Ask user for input
opt = input(['Enter ''latex'' to LaTeXify plots or ''remove'' to ', ...
             'deTeXify:\n']);



%% Change output
% Graphics output.
set(groot, 'defaulttextinterpreter', opt)

% Axis labels.
set(groot, 'defaultAxesTickLabelInterpreter', opt)

% Legend text.
set(groot, 'defaultLegendInterpreter', opt)