%clear all;
%clc;
function decode3=decode2(name,type)
global decotxt;
% timeRec=input('Recording time(secs):');
% recObj = audiorecorder();
% disp('R   ecording...');
% recordblocking(recObj, timeRec);
% disp('Demorsing...');
% imagen=imread('morse.png');
% clf
% imshow(imagen);
% hold on
% StopButton = uicontrol('style','pushbutton','String', 'Stop Recording','Callback',@StopLoop, ...
%               'position',[300 0 200 50], ...
%               'UserData', 1);
% set(StopButton,'Visible','on')
% i = 1;
x=audioread(name);
% while get(StopButton, 'UserData') == 1
%     recordblocking(recObj, 1);
%     y{i}=getaudiodata(recObj);
%     i = i + 1;
% end
% x=[];
% for i=1:length(y)
%     x=[x;y{i}];
% end
f=butterFilter(x);
outstring=demorse(f,type);
%desencriptedText=strrep(outstring,' ','');
desencriptedText=outstring;
% fileKeyid=fopen('key.txt');
% key=fgets(fileKeyid);
%  j=1;
% for i=1:length(desencriptedText)
%         if j>length(key)
%             j=1;
%         end
%         newL=letterValue(desencriptedText(i))-letterValue(key(j));
%         if(newL<1)
%             newL=newL+26;
%         end
%         desencriptedText(i)=newL+64;
%         j=+1;
% end
decotxt=desencriptedText
%disp(desencriptedText);
end
