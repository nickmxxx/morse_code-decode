% clear all;
% clc;
% chargeOption=input('From file(1), Write text(2):');
% if chargeOption == 2
global text_content
global click_1
global click_2
global textEncripted
%��guiѡ���ֶ�����
if  click_2 == 1
    disp("�ֶ�����mode")
    text=text_content;
%     �ַ����滻���Ӷ����ո�ȥ��
    %fileKeyid=fopen('key.txt');
% onlyletterΪ��д�ĺ���Ŀ����ͨ��ASCII�뽫������ַ�������
% ��Сд��ĸa-z��A-Z֮�䲻���Ϲ涨��onlyL=-1���˳�������ʾonlyletter
onlyL=onlyLetters(text);
    %��ȡ���뱾���ݽ��м��ܱ�����line8��ͬ����
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
   disp("�ļ�����mode")
   disp("�����ļ���"+file_input)
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
    %��ʾ���ܺ�ı���
    disp(textEncripted);
    %�����ܺ�ı���д��mensaja.txt�ļ�
    fileTxtId=fopen('mensaje.txt','w');
    fprintf(fileTxtId,textEncripted);




