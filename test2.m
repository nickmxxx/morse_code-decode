recObj = audiorecorder(8000,8,1);
fs=8000;
n = 1000;
wn =700/(fs/2);
[b,a] = fir1(n,wn,'bandpass');
%solo esto importa
disp('Start speaking.')
%image(1)
imagen=imread('morse.png');
clf
imshow(imagen);
hold on

StopButton = uicontrol('style','pushbutton','String', 'Stop Recording','Callback',@StopLoop, ...
              'position',[300 0 200 50], ...
              'UserData', 1);
          
set(StopButton,'Visible','on')

i = 1;
while get(StopButton, 'UserData') == 1
    recordblocking(recObj, 1);
    y{i}=getaudiodata(recObj);    
    i = i + 1;
end
close()
sign=[];
for i=1:length(y)
    sign=[sign;y{i}];
end
%hasta aqui
plot(sign);
disp('End of Recording.');
sound(sign);
%y=getaudiodata(recObj);
disp('Normal');
%%sound(y,fs);
fs=8000;
bfil = fft(y);
n = 1000;
wn =700/(fs/2);
[b,a] = fir1(n,wn,'bandpass');
fvtool(b,a);
f = filter(b,a,y);
afil = fft(f);

figure
stem(f);
disp('filtrado');

sound(f,fs);
% Play back the recording.
play(recObj);

% Store data in double-precision array.
myRecording = getaudiodata(recObj);

% Plot the waveform.
plot(myRecording);
AUDIOWRITE(myRecording,'D:\wps\魏什么的云文档\grade3\通原实验\tmp.wav');
demorse('D:\wps\魏什么的云文档\grade3\通原实验\tmp.wav');

