ch_no = 6; %C3-P3
low_filter = 0
high_filter= 150

R1316ECLONGEPOCH612S_AD_EC_single;
R1316EOLONGEPOCH412S_AD_EO_single;

Info_ratio1 =[0]
for i = 2:10
    ratio = L_EO(i)/L_EC(i);
    Info_ratio1 =[Info_ratio1, ratio]
end

hold on
plot(round(T_EO),Info_ratio1,'r','LineWidth',2)


%%

R14162ECLONGEPOCH6_AD_EC_single;
R14162EOLONGEPOCH4_AD_EO_single;


Info_ratio2 =[0]
for i = 2:10
    ratio = L_EO(i)/L_EC(i);
    Info_ratio2 =[Info_ratio2, ratio]
end

hold on
plot(round(T_EO),Info_ratio2,'r','LineWidth',2)

%%

R15162ECLONGTRACE6_AD_EC_single;
R15162EOLONGTRACE4_AD_EO_single;

Info_ratio3 =[0]
for i = 2:10
    ratio = L_EO(i)/L_EC(i);
    Info_ratio3 =[Info_ratio3, ratio]
end

hold on
plot(round(T_EO),Info_ratio3,'r','LineWidth',2)
%%
R4216LONGEPOCHEC6_AD_EC_single;
R4216LONGEPOCHEO4_AD_EO_single;

Info_ratio4 =[0]
for i = 2:10
    ratio = L_EO(i)/L_EC(i);
    Info_ratio4 =[Info_ratio4, ratio]
end

hold on
plot(round(T_EO),Info_ratio4,'r','LineWidth',2)


%%
R4416LONGEPOCHEC6_AD_EC_single;
R4416LONGEPOCHEO4_AD_EO_single;

Info_ratio5 =[0]
for i = 2:10
    ratio = L_EO(i)/L_EC(i);
    Info_ratio5 =[Info_ratio5, ratio]
end

hold on
plot(round(T_EO),Info_ratio5,'r','LineWidth',2)

%%
R4717LONGEPOCHEC6_AD_EC_single;
R4717LONGEPOCHEO4_AD_EO_single;

Info_ratio6 =[0]
for i = 2:10
    ratio = L_EO(i)/L_EC(i);
    Info_ratio6 =[Info_ratio6, ratio]
end

hold on
plot(round(T_EO),Info_ratio6,'r','LineWidth',2)

%%

%Channel number going to change
ch_no = ch_no + 1;
R5017LONGEPOCHEC6_AD_EC_single;
ch_no = ch_no - 1;

%Channel number going to change
ch_no = ch_no + 1;
R5017LONGEPOCHEO4_AD_EO_single;
ch_no = ch_no - 1;

Info_ratio7 =[0]
for i = 2:10
    ratio = L_EO(i)/L_EC(i);
    Info_ratio7 =[Info_ratio7, ratio]
end

hold on
plot(round(T_EO),Info_ratio7,'r','LineWidth',2)

%%

R5117LONGEPOCHEC6_AD_EC_single;
R5117LONGEPOCHEO4_AD_EO_single;

Info_ratio8 =[0]
for i = 2:10
    ratio = L_EO(i)/L_EC(i);
    Info_ratio8 =[Info_ratio8, ratio]
end

hold on
plot(round(T_EO),Info_ratio8,'r','LineWidth',2)

%%
R5317LONGEPOCHEC6_AD_EC_single;
R5317LONGEPOCHEO4_AD_EO_single;

Info_ratio9 =[0]
for i = 2:10
    ratio = L_EO(i)/L_EC(i);
    Info_ratio9 =[Info_ratio9, ratio]
end

hold on
plot(round(T_EO),Info_ratio9,'r','LineWidth',2)

%%

%change in channel number
if ch_no == 2
    ch_no = 24;
     disp(ch_no);       
else
    ch_no = ch_no - 1;
    disp(ch_no);
end
  
R5617LONGEPOCHEC6_AD_EC_single;

%change in channel number
if ch_no == 2
    ch_no = 24;
     disp(ch_no);       
else
    ch_no = ch_no - 1;
    disp(ch_no);
end
  
R5617LONGEPOCHEO4_AD_EO_single;

Info_ratio10 =[0]
for i = 2:10
    ratio = L_EO(i)/L_EC(i);
    Info_ratio10 =[Info_ratio10, ratio]
end

hold on
plot(round(T_EO),Info_ratio10,'r','LineWidth',2)

% Create ylabel
ylabel({'EO-EC-Ratio'});

% Create xlabel
xlabel({'Time'});

% Create title
title({'Eyes Closed & Eyes Opened Ratio - P3-O1'});

Info_ratio_AD = [Info_ratio1;Info_ratio2;Info_ratio3;Info_ratio4;Info_ratio5;Info_ratio6;Info_ratio7;Info_ratio8;Info_ratio9;Info_ratio10];
Info_ratio_AD_table = array2table(Info_ratio_AD,'VariableNames',{'E0','E1','E2','E3','E4','E5','E6','E7','E8','E9'})


writetable(Info_ratio_AD_table,'information_length_ratio_AD.csv','WriteRowNames',true)
type 'information_length_ratio_AD.csv'














