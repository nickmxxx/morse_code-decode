function onlyL = onlyLetters( s )
for i=1:length(s)
    if s(i)<65 || s(i)>90
        if s(i)<97 ||s(i)>122
            %%if s(i)~='ñ'&&s(i)~='Ñ'
                onlyL=-1;
                return;
            %%end
        end
    end
end
onlyL=1;
return;
end

