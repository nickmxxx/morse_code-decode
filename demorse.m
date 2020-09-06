%function properity of https://www.mathworks.com/matlabcentral/fileexchange/21491-demorse
%change from original:
%Demorse of Ñ
%fixed bug when the signal is empty
%correction of threshold
function outstring =  demorse(x,type)
vis_on = 0;
if (type==2)
threshold = .1;
else
    threshold = .35;
end

x2 = abs(x);
y = filter(ones(1,20)/20,1, x2);
z = y > threshold;
for j=1:length(z)-1
    if j>2
        if z(j)==1&&z(j-1)==0&&z(j+1)==0
            z(j)=0;
        end
    end
end


z = [zeros(10,1); z];
b = diff(z);
c = b(b~=0);
c2 = find(b~=0);
try
tokens = -c .* diff([0; c2]);
catch ME
    outstring='';
    return;
    rethrow(ME)
end
tokens2 = tokens;
cut_t =1300;
cut_s = -1300;
tokens2(tokens > 0 & tokens < cut_t) = 1;
tokens2(tokens > 0 & tokens > cut_t) = 2;
tokens2(tokens < 0 & tokens > cut_s) = -1;
tokens2(tokens < 0 & tokens < cut_s) = -2;
tokens2(tokens < 0 & tokens <3*cut_s)=3;
tokens2 = [tokens2(2:end); -2];
tokens2(tokens2 == -1) = [];
tokens3 = tokens2;
sp=tokens2'
index = find(tokens2==3);
z=0;
for i =1:length(index)
   tokens3=[sp(1:index(i)-1+z), -2,3,-2,  sp(index(i)+1+z:end)]
   sp=tokens3
   z=z+2;
end
if (length(index)~=0)
tokens3=tokens3';
end
tokens4 = {};
ctr = 1;
start_idx = 1;

toparse = find(tokens3(start_idx:end) == -2);

for j=1:length(toparse)
   a = toparse(j);
   temp = tokens3(start_idx:a-1);
   tokens4{j} = temp;
   start_idx = a+1;

end
code{1} = [1 2 ];
code{2} = [2 1 1 1];
code{3} = [2 1 2 1];
code{4} = [2 1 1];
code{5} = [1];
code{6} = [1 1 2 1];
code{7} = [2 2 1];
code{8} = [1 1 1 1];
code{9} = [1 1];
code{10} = [1 2 2 2];
code{11} = [2 1 2];
code{12} = [1 2 1 1];
code{13} = [2 2];
code{14} = [2 1];
code{15} = [2 2 2];
code{16} = [1 2 2 1];
code{17} = [2 2 1 2];
code{18} = [1 2 1];
code{19} = [1 1 1];
code{20} = [2];
code{21} = [1 1 2]; 
code{22} = [1 1 1 2];
code{23} = [1 2 2];
code{24} = [2 1 1 2];
code{25} = [2 1 2 2];
code{26} = [2 2 1 1];

% punct
code{27} = [1 2 1 2 1 2];
code{28} = [2 2 1 1 2 2];
code{29} = [1 1 2 2 1 1];    
code{30} = [2 1 1 2 1];

% numbers

code{31} = [1 2 2 2 2];
code{32} = [1 1 2 2 2];
code{33} = [1 1 1 2 2];
code{34} = [1 1 1 1 2];
code{35} = [1 1 1 1 1];
code{36} = [2 1 1 1 1];
code{37} = [2 2 1 1 1];
code{38} = [2 2 2 1 1];
code{39} = [2 2 2 2 1];
code{40} = [2 2 2 2 2];
code{41} = [2 2 1 2 2];
code{43} =[3];


decode{1} = 'A';
decode{2} = 'B';
decode{3} = 'C';
decode{4} = 'D';
decode{5} = 'E';
decode{6} = 'F';
decode{7} = 'G';
decode{8} = 'H';
decode{9} = 'I';
decode{10} = 'J';
decode{11} = 'K';
decode{12} = 'L';
decode{13} = 'M';
decode{14} = 'N';
decode{15} = 'O';
decode{16} = 'P';
decode{17} = 'Q';
decode{18} = 'R';
decode{19} = 'S';
decode{20} = 'T';
decode{21} = 'U';
decode{22} = 'V';
decode{23} = 'W';
decode{24} = 'X';
decode{25} = 'Y';
decode{26} = 'Z';
decode{27} = '.';
decode{28} = ',';
decode{29} = '?';
decode{30} = '/';
decode{31} = '1';
decode{32} = '2';
decode{33} = '3';
decode{34} = '4';
decode{35} = '5';
decode{36} = '6';
decode{37} = '7';
decode{38} = '8';
decode{39} = '9';
decode{40} = '0';
decode{41} = 'Ñ';
decode{43}= ' ';

out1 = [];

    for j = 1:length(tokens4)
    %zero pad temp_tok
    temp_tok = [tokens4{j}; zeros(6 - length(tokens4{j}), 1)];
    for k = 1:length(code)
        if (temp_tok == [code{k}'; zeros(6 - length(code{k}), 1)]);
            out1(j) = char(decode{k});
            %display(decode{k})
        end

    end
    if length(out1)>=j
        if isempty(out1(j))
            out1(j) = '_';
        end
    end
    
end
% outstring = 32*ones(2*length(out1),1);
% outstring(2:2:end) = out1;
outstring = char(out1);
% display('demorsed message:')




