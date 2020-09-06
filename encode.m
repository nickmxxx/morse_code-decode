% clear all;
% clc;
% chargeOption=input('From file(1), Write text(2):');
% if chargeOption == 2
global text_content
global click_1
global click_2
global textEncripted
%在gui选择手动输入
if  click_2 == 1
    disp("手动输入mode")
    text=text_content;
%     字符串替换，从而将空格去掉
    %fileKeyid=fopen('key.txt');
% onlyletter为编写的函数目的是通过ASCII码将输入的字符串限制
% 在小写字母a-z与A-Z之间不符合规定则onlyL=-1，退出程序显示onlyletter
onlyL=onlyLetters(text);
    %读取密码本内容进行加密编码与line8共同构成
%     key=fgets(fileKeyid);
%     j=1;
    textEncripted=text;
%     disp(key(1));
%     h='a'+'a';
%     disp(h);
%     for i=1:length(text)
%         if j>length(key)
%             j=1;
%         end
%         newL=letterValue(textEncripted(i))+letterValue(key(j));
%         if(newL>26)
%             newL=newL-26;
%         end
%         textEncripted(i)=newL+96;
%         j=+1;
%  
%     end
end
%     elseif chargeOption==1
   global file_input;
if click_1 ==1
   disp("文件输入mode")
   disp("输入文件是"+file_input)
   fileTxId=fopen(file_input);
   text=fgets(fileTxId); 
   %fileKeyid=fopen('key.txt');
%     key=fgets(fileKeyid);
%     j=1;
    textEncripted=text;
%     disp(key(1));
%     h='a'+'a';
%     disp(h);
%     for i=1:length(text)
%         if j>length(key)
%             j=1;
%         end
%         newL=letterValue(textEncripted(i))+letterValue(key(j));
%         if(newL>26)
%             newL=newL-26;
%         end
%         textEncripted(i)=newL+96;
%         j=+1;
%  
%     end
end
% else
%     disp('Invalid option');
%     return; 
% end
    %显示加密后的编码
    disp(textEncripted);
    %将加密后的编码写入mensaja.txt文件
    fileTxtId=fopen('mensaje.txt','w');
    fprintf(fileTxtId,textEncripted);




