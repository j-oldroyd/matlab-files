function notesExport
% NOTESEXPORT Converts all live scripts in directory to PDF.
%
%   See also: DIR, MOVEFILE

%% Get file information.

% If no input arguments, change filenames of all extensions.
ext = '*.mlx';
FileInfoStruct = dir(ext);

fileNameArray = {FileInfoStruct.name};
nFiles = length(fileNameArray); % Number of files to change.

%% Export live scripts to PDF.
for i = 1:nFiles
    export(fileNameArray{i})
end

end