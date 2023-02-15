function pointshw(pts, varargin)
%POINTSHW Displays points earned on each question.
%   POINTSHW(PTS) produces messages letting the user know how many points
%   were earned on each question. The number of questions is determined by
%   the size of PTS and the assignment is assumed to have a default total
%   of 30 points. POINTSHW(PTS, TOTAL) assumes a total point value of
%   TOTAL.

if nargin == 1
    % Assume total points is 30.
    total = 30;
elseif nargin == 2
    % Now total is specified.
    total = varargin{1};
end


nQuestions = length(pts);

for i = 1:nQuestions
    % Print statement for each question.
    msg = 'On question %d you earned %d point(s).\n';
    fprintf(msg, i, pts(i));
end


totalMsg = 'You''ve earned %d/%d point(s) on this assignment.\n';
fprintf(totalMsg, sum(pts), total);
end
