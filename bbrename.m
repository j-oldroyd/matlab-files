function bbrename(ext)
% BBRENAME Renames files downloaded from Blackboard.
%   All files in current directory with specified extension will have
%   Blackboard pre-formatting removed. File extension must be provided as
%   character array.
%
%   See also: DIR, MOVEFILE

%% Get file information.
% Place file names of "*.ext" files into a cell array.
fileExt = ['*.', ext];
FileInfoStruct = dir(fileExt);
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