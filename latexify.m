%LATEXIFY changes grpahics options to output LaTeX
%Selecting 'latex' allows use of LaTeX markup such as $\sin x$ in
%labels and legends by default.

%% Asks user to specify whether they want LaTeX output or default output
opt = input('Enter ''latex'' to LaTeXify plots or ''remove'' to deTeXify:\n');

%% Changes text output
set(groot, 'defaulttextinterpreter', opt)

%% Changes axis ticks labels
set(groot, 'defaultAxesTickLabelInterpreter', opt)

%% Changes legend output
set(groot, 'defaultLegendInterpreter', opt)