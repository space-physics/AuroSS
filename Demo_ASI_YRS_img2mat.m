days="N20031223";
band="5577";

datadir = "~/Downloads/Raw data and reading code/RawDataForJGR";
sourcepath = "N20031223/5577";

datadir = fullfile(datadir, sourcepath);
datadir = filePermissions(expanduser(datadir)).AbsolutePath;

% will write a list of images found
imgListFile = "ImgList_" + days + band + ".txt";

fid = fopen(imgListFile, 'wt');

mustBeFolder(datadir)

files = dir(fullfile(datadir, "*.img"));

N = size(files,1);

for j = 1:N
  file = files(j).name;
  filename = fullfile(datadir, file);
  disp(file + " (" + int2str(j) + " / " + int2str(N) + ")")
  img = OpenImgYRS(filename);  % double image  
  fprintf(fid, '%s\n', filename);
end

fclose(fid);
