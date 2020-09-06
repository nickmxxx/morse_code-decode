function morseencoder(text,filename)
Fs=1500;
load wav;
Dit=audioread('dit.wav');
Dah=audioread('line.wav');
ssp = wav(2121:3133);
global morsecode;
morsecode=ssp;
global morsetext;
morsetext='';
A_text = '.-';
B_text = '-...';
C_text = '-.-.';
D_text = '-..';
E_text = '.';
F_text = '..-.';
G_text = '--.';
H_text = '....';
I_text = '..';
J_text = '.---';
K_text = '-.-';
L_text = '.-..';
M_text = '--';
N_text = '-.';
O_text = '---';
P_text = '.--.';
Q_text = '--.-';
R_text = '.-.';
S_text = '...';
T_text = '-';
U_text = '..-';
V_text = '...-';
W_text = '.--';
X_text = '-..-';
Y_text = '-.--';
Z_text = '--..';
% enie_text = '--..';
period_text = '.-.-.-';
comma_text = '--..--';
question_text = '..--..';
slash__text = '-..-.';
n1_text = '.----';
n2_text = '..---';
n3_text = '...--';
n4_text = '....-';
n5_text = '.....';
n6_text = '-....';
n7_text = '--...';
n8_text = '---..';
n9_text = '----.';
n0_text = '-----';
% enie_text='--.--';

A = [Dit;ssp;Dah];
B = [Dah;ssp;Dit;ssp;Dit;ssp;Dit];
C = [Dah;ssp;Dit;ssp;Dah;ssp;Dit];
D = [Dah;ssp;Dit;ssp;Dit];
E = [Dit];
F = [Dit;ssp;Dit;ssp;Dah;ssp;Dit];
G = [Dah;ssp;Dah;ssp;Dit];
H = [Dit;ssp;Dit;ssp;Dit;ssp;Dit];
I = [Dit;ssp;Dit];
J = [Dit;ssp;Dah;ssp;Dah;ssp;Dah];
K = [Dah;ssp;Dit;ssp;Dah];
L = [Dit;ssp;Dah;ssp;Dit;ssp;Dit];
M = [Dah;ssp;Dah];
N = [Dah;ssp;Dit];
O = [Dah;ssp;Dah;ssp;Dah];
P = [Dit;ssp;Dah;ssp;Dah;ssp;Dit];
Q = [Dah;ssp;Dah;ssp;Dit;ssp;Dah];
R = [Dit;ssp;Dah;ssp;Dit];
S = [Dit;ssp;Dit;ssp;Dit];
T = [Dah];
U = [Dit;ssp;Dit;ssp;Dah];
V = [Dit;ssp;Dit;ssp;Dit;ssp;Dah];
W = [Dit;ssp;Dah;ssp;Dah];
X = [Dah;ssp;Dit;ssp;Dit;ssp;Dah];
Y = [Dah;ssp;Dit;ssp;Dah;ssp;Dah];
Z = [Dah;ssp;Dah;ssp;Dit;ssp;Dit];
% enie = [Dah;ssp;Dah;ssp;Dit;ssp;Dit];
period = [Dit;ssp;Dah;ssp;Dit;ssp;Dah;ssp;Dit;ssp;Dah];
comma = [Dah;ssp;Dah;ssp;Dit;ssp;Dit;ssp;Dah;ssp;Dah];
question = [Dit;ssp;Dit;ssp;Dah;ssp;Dah;ssp;Dit;ssp;Dit];
slash_ = [Dah;ssp;Dit;ssp;Dit;ssp;Dah;ssp;Dit];
n1 = [Dit;ssp;Dah;ssp;Dah;ssp;Dah;ssp;Dah];
n2 = [Dit;ssp;Dit;ssp;Dah;ssp;Dah;ssp;Dah];
n3 = [Dit;ssp;Dit;ssp;Dit;ssp;Dah;ssp;Dah];
n4 = [Dit;ssp;Dit;ssp;Dit;ssp;Dit;ssp;Dah];
n5 = [Dit;ssp;Dit;ssp;Dit;ssp;Dit;ssp;Dit];
n6 = [Dah;ssp;Dit;ssp;Dit;ssp;Dit;ssp;Dit];
n7 = [Dah;ssp;Dah;ssp;Dit;ssp;Dit;ssp;Dit];
n8 = [Dah;ssp;Dah;ssp;Dah;ssp;Dit;ssp;Dit];
n9 = [Dah;ssp;Dah;ssp;Dah;ssp;Dah;ssp;Dit];
n0 = [Dah;ssp;Dah;ssp;Dah;ssp;Dah;ssp;Dah];
% enie=[Dah;ssp;Dah;ssp;Dit;ssp;Dah;ssp;Dah];
%将字符变为大写
text = upper(text);
%定义变量句号—period，逗号—comma,问号—question，斜杠—slash
vars ={'period','comma','question','slash_'};
morsecode=[];
for i=1:length(text)
    if text(i)=='脩'||text(i)=='帽';
        morsecode = [morsecode;[Dah;ssp;Dah;ssp;Dit;ssp;Dah;ssp;Dah]];
        morsetext = strcat(morsetext,'--.--');
    elseif isvarname(text(i))
        morsecode = [morsecode;eval(text(i))];
        morsetext = strcat(morsetext,eval([text(i),'_text']))
    elseif ismember(text(i),'.,?/')
        x = findstr(text(i),'.,?/');
        morsecode = [morsecode;eval(vars{x})];
        morsetext = strcat(morsetext,eval(strcat(vars{x},'_text')));
    elseif ~isempty(str2num(text(i)))
        morsecode = [morsecode;eval(['n' text(i)])];
        morsetext = strcat(morsetext,eval(['n',text(i),'_text']));
    elseif text(i)==' '
        morsecode = [morsecode;ssp;ssp;ssp];
        morsetext = strcat(morsetext,"   ");
    end
    morsecode = [morsecode;ssp;ssp];
    morsetext = strcat(morsetext," ");
end



morsecode=resample(morsecode,Fs,1500);
audiowrite(filename,morsecode,8000);

