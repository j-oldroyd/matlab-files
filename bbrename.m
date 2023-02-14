function bbrename(varargin)
% BBRENAME Renames files downloaded from Blackboard.
%   BBRENAME() removes Blackboard preformatting from filenames in the
%   current directory. BBRENAME(ext) removes Blackboard preformatting from
%   filenames in the current directory with the specified extensions, where
%   ext is a string array of extensions.
%
%   See also: DIR, MOVEFILE

%% Get file information.

if nargin == 0
    % If no input arguments, change filenames of all extensions.
    FileInfoStruct = dir;

    % Now we need to filter out '.' and '..'. This is apparently a holdover
    % from DOS days. See:
    % https://www.mathworks.com/matlabcentral/answers/430793-what-are-the-extra-subdirectories-returned-by-dir-function
    FileInfoStruct = FileInfoStruct(~ismember({FileInfoStruct.name}, ... 
                                    {'.', '..'}));
else
    for i = 1:nargin
        % Loop through given extensions.
        ext = char(varargin{i});

        % Place file names of "*.ext" files into a cell array.
        fileExt = ['*.', ext];
        FileInfoStruct = dir(fileExt);
    end
end

fileNameArray = {FileInfoStruct.name};
nFiles = length(fileNameArray); % Number of files to change.

%% Change filenames.
prettyNameArray = cell(1, nFiles);
for i = 1:nFiles
    prettyNameArray{i} = prettyfilename(fileNameArray{i});
end


%% Rename files in directory.
for i = 1:nFiles
    oldFileName = [FileInfoStruct(i).folder, '\', ...
                   FileInfoStruct(i).name];
    newFileName = [FileInfoStruct(i).folder, '\', ...
                   prettyNameArray{i}];
    movefile(oldFileName, newFileName);
end


end


%% Local function(s)
function prettyName = prettyfilename(bbName)
% PRETTYFILENAME Remove Blackboard preformatting from character array.
    
% Blackboard formatting always includes a final underscore, so we get
% its position and remove everything before it.
underscoresPosition = strfind(bbName, '_');
fNameStart = underscoresPosition(end) + 1;
prettyName = bbName(fNameStart:end);
end