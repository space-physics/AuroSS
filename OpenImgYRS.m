function [Image,Date,Time,Tag] = OpenImgYRS(filename)
arguments
  filename (1,1) string {mustBeFile}
end
% Reading All-sky image
% version 2.0
% Image:
% Data:
% Time:
% 'HH:MM:SS'


fid=fopen(filename,'r');

fseek(fid,84,'bof');

A = fread(fid,10);

Date=char(A'); % get file date(yyyy-mm-dd)
fseek(fid,102,'bof');

B = fread(fid,20);

file_time=char(B'); %  get file time(hh:mm:ssUT)

[~,tn] = size(file_time);

if file_time(3) ~= ':' && file_time(6) ~= ':'
  for i=2:tn-1
    if file_time(i) == 'm' && file_time(i+1) == 's'
      Time=file_time(1:i-1);
      Tag=1;
      break;
    end
  end
else
    Time=file_time(1:8);
    Tag=0;
end

fseek(fid,-512*512*2,'eof'); % 512*512*2 Bytes

C = fread(fid,[512,512],'uint16');

fclose(fid);

Image = C'; % get CCD Image Matrix

end
