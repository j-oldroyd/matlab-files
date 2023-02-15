function lecturediary(varargin)
% LECTUREDIARY Function that starts a diary for the current lecture.
%   LECTUREDIARY by default starts a diary file with the current date as
%   the filename. If an argument is supplied to the function, then the
%   argument is used as the filename instead. This argument should be a
%   character array or string array.
%   LECTUREDIARY uses a local function getchardate() to format the date and 
%   the diary() command to produce a filename with the current date.
%
%   See also: DIARY, DATETIME

if nargin == 0
    % Default behavior. The filename is based on the current date.
    filename = ['lecture-', getchardate()];
elseif nargin == 1
    % Check to see if the argument entered is the correct class and
    % produce appropriate filename. Otherwise give an error.
    if ischar(varargin{1}) || isstring(varargin{1})
        filename = ['lecture-', varargin{1}];
    else
        error(['Incorrect argument class provided.\nThis function ', ...
              'only accepts string or character arrays as arguments, ' ...
              'but your argument is of class %s.\n'], class(varargin{1}))
    end
else
    error(['Too many input arguments provided.\nYou provided %d ', ...
          'inputs but this function supports at most 1 input.'], nargin)
end

diary(filename)

end


%% Local function(s)
function cdate = getchardate()
% GETCHARDATE Local function that gets the current date and converts it
% into a character array. Format is Month-day-year.
    cdate = char(datetime('today', 'Format', 'MMMM-d-yyyy'));
end