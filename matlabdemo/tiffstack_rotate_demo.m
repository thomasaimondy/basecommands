%% if you are running this in win7, you have to 
%  close the explorer folder first!!

clc;    % Clear the command window.
fromFolder = 'F:\Desktop\testimg';
toFolder = 'F:\Desktop\toimg';
rotateDegree = -90;


fileList = {};
%% GET ALL THE FILE NAMES
% Get list of all subfolders.
allSubFolders = genpath(fromFolder);
% Parse into a cell array.
remain = allSubFolders;
listOfFolderNames = {};
while true
	[singleSubFolder, remain] = strtok(remain, ';');
	if isempty(singleSubFolder)
		break;
	end
	listOfFolderNames = [listOfFolderNames singleSubFolder];
end
numberOfFolders = length(listOfFolderNames)

% Process all image files in those folders.
for k = 1 : numberOfFolders
	% Get this folder and print it out.
	thisFolder = listOfFolderNames{k};
	fprintf('Processing folder %s\n', thisFolder);
	
	% Get TIF files.
	filePattern = sprintf('%s/*.tif', thisFolder);
	baseFileNames = dir(filePattern);
	numberOfImageFiles = length(baseFileNames);
	% Now we have a list of all files in this folder.
	if numberOfImageFiles >= 1
		% Go through all those image files.
		for f = 1 : numberOfImageFiles
			fullFileName = fullfile(thisFolder, baseFileNames(f).name);
			fileList = [fileList fullFileName];
			fprintf('     Processing image file %s\n', fullFileName);
		end
	else
		fprintf('     Folder %s has no image files in it.\n', thisFolder);
	end
end


%% SAVE TO THE NEW DIRECTORY
for k = 1 : numberOfFolders
	thisFolder = listOfFolderNames{k};
	newFolder = replace(thisFolder,fromFolder,toFolder);
	mkdir(newFolder);
end


for k=1 : length(fileList)
    fprintf('processing %f percentage.\n', k/length(fileList)*100);
	fromname = fileList{k};
	toname = replace(fromname,fromFolder,toFolder);
    numimgs = size(imfinfo(fromname),1);
    for i = 1:numimgs
      img = imread(fromname,i);
      img = imrotate(img,rotateDegree); 
      if i==1
        imwrite(img,toname);
      else
        imwrite(img,toname,'WriteMode','append');
      end
    end
end

fprintf('finish.\n');
