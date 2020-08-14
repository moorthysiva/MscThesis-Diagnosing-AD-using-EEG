%%

load('R1316EOLONGEPOCH412S.mat')
EEG_Array = table2array(R1316EOLONGEPOCH412S);
%  ch_no = 6% C3-P3
% 
% split_size=10

%Create empty list for Time,Information length, Distance of PDF
E_EO=[0]
L_EO=[0]
T_EO=[0]


% Insering Data
%First Column as X which is te time column
x = EEG_Array(:,1)

% 15th column is C3-P3 channel as Y
z = EEG_Array(:,ch_no)


%% Pre-Processing
% IIR Notch filter

fs = 1/(x(2)-x(1));
%filter out 50Hz - using a notch filter
Wo = 49.99/(fs/2);
BW = Wo/35; %raw 2
[bf,af] = iirnotch(Wo,BW,-0.2);

y = filter(bf,af,z); 

%% FFT
%

Fs = 2000
F=fft(y); 
%plot(real(F)),grid on  

F2=zeros(length(F),1);
LF = round((length(y)/Fs) *low_filter)
HF = round((length(y)/Fs) *high_filter)
if LF == 0
    LF=1;
else
    LF = LF
end
F2(LF:HF)=F(LF:HF);
xr =ifft(F2);
y = real(xr)
% 
% % subplot(2,1,1);
% % plot(real(F2)),grid on  
% % 
% % subplot(2,1,2);
% % plot(real(y)),grid on



%% Divide into 10 chunks

step = round(length(y)/split_size)
time_split = 1:step:length(y)
time_split(11) = length(y)

for i = 1:10
    fname = ['y',num2str(i)];
    split_data.(fname) =  y(time_split(i):time_split(i+1)-1);
end

%% find the minimum and maximum of the y1 and y2

min_y1  = min(split_data.y1)
max_y1 = max(split_data.y1)
min_y2 = min(split_data.y2)
max_y2= max(split_data.y2)

max_y_new = max(max_y1,max_y2)
min_y_new= min(min_y1,min_y2)
edges1 = linspace(min_y_new, max_y_new, 100);

%% calculating value of PDF1 and PDF2
PDF1 = ksdensity(split_data.y1,edges1,'function','pdf')
PDF2 = ksdensity(split_data.y2,edges1,'function','pdf')

%% Information length calculation 
%E1= 4 PDF2old*(sqrt(PDF1)-sqrt(PDF2old)).^2/(dt).^2

dt = x(time_split(2))-x(time_split(1))
T_EO= [T_EO,T_EO(end)+dt]

%Distance between 1st and 2nd PDF
E1 = sum(4.*sqrt(PDF1).*(sqrt(PDF2)-sqrt(PDF1)).^2/(dt).^2)
E_EO=[E_EO,E1]

%%Information length is going to be L_EO= sum(E1+E2+....E9)
L1 = sqrt(E1)
L_EO= [L_EO,L1]

%%
%Histogram for 2nd and 3rd function

% find the minimum and maximum of the y2 and y3
min_y2  = min(split_data.y2)
max_y2 = max(split_data.y2)
min_y3 = min(split_data.y3)
max_y3= max(split_data.y3)

max_y_new = max(max_y2,max_y3)
min_y_new= min(min_y2,min_y3)
edges2 = linspace(min_y_new, max_y_new, 100);

%% calculating value of PDF1 and PDF2
PDF2_old = ksdensity(split_data.y2,edges2,'function','pdf')
PDF3 = ksdensity(split_data.y3,edges2,'function','pdf')

%% Information length calculation 
%E1= 4 PDF2old*(sqrt(PDF1)-sqrt(PDF2old)).^2/(dt).^2

dt = x(time_split(3))-x(time_split(2))
T_EO= [T_EO,T_EO(end)+dt]

%Distance between 1st and 2nd PDF
E2 = sum(4.*sqrt(PDF2_old).*(sqrt(PDF3)-sqrt(PDF2_old)).^2/(dt).^2)
E_EO=[E_EO,E2]

%%Information length is going to be L_EO= sum(E1+E2+....E9)
L2 = sum(sqrt(E1)+ sqrt(E2))
L_EO= [L_EO,L2]

%% Histogram for 3nd and 4th function

% find the minimum and maximum of the y3 and y4
min_y3  = min(split_data.y3)
max_y3 = max(split_data.y3)
min_y4 = min(split_data.y4)
max_y4= max(split_data.y4)

max_y_new = max(max_y3,max_y4)
min_y_new= min(min_y3,min_y4)
edges3 = linspace(min_y_new, max_y_new, 100);

%% calculating value of PDF1 and PDF2
PDF3_old = ksdensity(split_data.y3,edges3,'function','pdf')
PDF4 = ksdensity(split_data.y4,edges3,'function','pdf')

%% Information length calculation 
%E1= 4 PDF2old*(sqrt(PDF1)-sqrt(PDF2old)).^2/(dt).^2

dt = x(time_split(4))-x(time_split(3))
T_EO= [T_EO,T_EO(end)+dt]

%Distance between 1st and 2nd PDF
E3 = sum(4.*sqrt(PDF3_old).*(sqrt(PDF4)-sqrt(PDF3_old)).^2/(dt).^2)
E_EO=[E_EO,E3]

%%Information length is going to be L_EO= sum(E1+E2+....E9)
L3 = sum(sqrt(E1)+ sqrt(E2) + sqrt(E3))
L_EO= [L_EO,L3]

%% Histogram for 4th and 5th function

% find the minimum and maximum of the y4 and y5
min_y4  = min(split_data.y4)
max_y4 = max(split_data.y4)
min_y5 = min(split_data.y5)
max_y5= max(split_data.y5)

max_y_new = max(max_y4,max_y5)
min_y_new= min(min_y4,min_y5)
edges4 = linspace(min_y_new, max_y_new, 100);

%% calculating value of PDF1 and PDF2
PDF4_old = ksdensity(split_data.y4,edges4,'function','pdf')
PDF5 = ksdensity(split_data.y5,edges4,'function','pdf')

%% Information length calculation 
%E1= 4 PDF2old*(sqrt(PDF1)-sqrt(PDF2old)).^2/(dt).^2

dt = x(time_split(5))-x(time_split(4))
T_EO= [T_EO,T_EO(end)+dt]

%Distance between 1st and 2nd PDF
E4 = sum(4.*sqrt(PDF4_old).*(sqrt(PDF5)-sqrt(PDF4_old)).^2/(dt).^2)
E_EO=[E_EO,E4]

%%Information length is going to be L_EO= sum(E1+E2+....E9)
L4 = sum(sqrt(E1)+ sqrt(E2) + sqrt(E3) + sqrt(E4))
L_EO= [L_EO,L4]

%% Histogram for 5th and 6th function

% find the minimum and maximum of the y5 and y6
min_y5  = min(split_data.y5)
max_y5 = max(split_data.y5)
min_y6 = min(split_data.y6)
max_y6= max(split_data.y6)

max_y_new = max(max_y5,max_y6)
min_y_new= min(min_y5,min_y6)
edges5 = linspace(min_y_new, max_y_new, 100);

%% calculating value of PDF1 and PDF2
PDF5_old = ksdensity(split_data.y5,edges5,'function','pdf')
PDF6 = ksdensity(split_data.y6,edges5,'function','pdf')

%% Information length calculation 
%E1= 4 PDF2old*(sqrt(PDF1)-sqrt(PDF2old)).^2/(dt).^2

dt = x(time_split(6))-x(time_split(5))
T_EO= [T_EO,T_EO(end)+dt]

%Distance between 1st and 2nd PDF
E5 = sum(4.*sqrt(PDF5_old).*(sqrt(PDF6)-sqrt(PDF5_old)).^2/(dt).^2)
E_EO=[E_EO,E5]

%%Information length is going to be L_EO= sum(E1+E2+....E9)
L5 = sum(sqrt(E1)+ sqrt(E2) + sqrt(E3) + sqrt(E4) + sqrt(E5))
L_EO= [L_EO,L5]

%% Histogram for 6th and 7th function

% find the minimum and maximum of the y6 and y7
min_y6  = min(split_data.y6)
max_y6 = max(split_data.y6)
min_y7 = min(split_data.y7)
max_y7= max(split_data.y7)

max_y_new = max(max_y6,max_y7)
min_y_new= min(min_y6,min_y7)
edges6 = linspace(min_y_new, max_y_new, 100);

%% calculating value of PDF1 and PDF2
PDF6_old = ksdensity(split_data.y6,edges6,'function','pdf')
PDF7 = ksdensity(split_data.y7,edges6,'function','pdf')

%% Information length calculation 
%E1= 4 PDF2old*(sqrt(PDF1)-sqrt(PDF2old)).^2/(dt).^2

dt = x(time_split(7))-x(time_split(6))
T_EO= [T_EO,T_EO(end)+dt]

%Distance between 1st and 2nd PDF
E6 = sum(4.*sqrt(PDF6_old).*(sqrt(PDF7)-sqrt(PDF6_old)).^2/(dt).^2)
E_EO=[E_EO,E6]

%%Information length is going to be L_EO= sum(E1+E2+....E9)
L6 = sum(sqrt(E1)+ sqrt(E2) + sqrt(E3) + sqrt(E4) + sqrt(E5) + sqrt(E6))
L_EO= [L_EO,L6]

%% Histogram for 7th and 8th function

% find the minimum and maximum of the y7 and y8
min_y7  = min(split_data.y7)
max_y7 = max(split_data.y7)
min_y8 = min(split_data.y8)
max_y8= max(split_data.y8)

max_y_new = max(max_y7,max_y8)
min_y_new= min(min_y7,min_y8)
edges7 = linspace(min_y_new, max_y_new, 100);

%% calculating value of PDF1 and PDF2
PDF7_old = ksdensity(split_data.y7,edges7,'function','pdf')
PDF8 = ksdensity(split_data.y8,edges7,'function','pdf')

%% Information length calculation 
%E1= 4 PDF2old*(sqrt(PDF1)-sqrt(PDF2old)).^2/(dt).^2

dt = x(time_split(8))-x(time_split(7))
T_EO= [T_EO,T_EO(end)+dt]

%Distance between 1st and 2nd PDF
E7 = sum(4.*sqrt(PDF7_old).*(sqrt(PDF8)-sqrt(PDF7_old)).^2/(dt).^2)
E_EO=[E_EO,E7]

%%Information length is going to be L_EO= sum(E1+E2+....E9)
L7 = sum(sqrt(E1)+ sqrt(E2) + sqrt(E3) + sqrt(E4) + sqrt(E5) + sqrt(E6) + sqrt(E7))
L_EO= [L_EO,L7]

%% Histogram for 8th and 9th function

% find the minimum and maximum of the y8 and y9
min_y8  = min(split_data.y8)
max_y8 = max(split_data.y8)
min_y9 = min(split_data.y9)
max_y9= max(split_data.y9)

max_y_new = max(max_y8,max_y9)
min_y_new= min(min_y8,min_y9)
edges8 = linspace(min_y_new, max_y_new, 100);

%% calculating value of PDF1 and PDF2
PDF8_old = ksdensity(split_data.y8,edges8,'function','pdf')
PDF9 = ksdensity(split_data.y9,edges8,'function','pdf')

%% Information length calculation 
%E1= 4 PDF2old*(sqrt(PDF1)-sqrt(PDF2old)).^2/(dt).^2

dt = x(time_split(9))-x(time_split(8))
T_EO= [T_EO,T_EO(end)+dt]

%Distance between 1st and 2nd PDF
E8 = sum(4.*sqrt(PDF8_old).*(sqrt(PDF9)-sqrt(PDF8_old)).^2/(dt).^2)
E_EO=[E_EO,E8]

%%Information length is going to be L_EO= sum(E1+E2+....E9)
L8 = sum(sqrt(E1)+ sqrt(E2) + sqrt(E3) + sqrt(E4) + sqrt(E5) + sqrt(E6) + sqrt(E7) + sqrt(E8))
L_EO= [L_EO,L8]

%% Histogram for 9th and 10th function

% find the minimum and maximum of the y9 and y10
min_y9  = min(split_data.y9)
max_y9 = max(split_data.y9)
min_y10 = min(split_data.y10)
max_y10= max(split_data.y10)

max_y_new = max(max_y9,max_y10)
min_y_new= min(min_y9,min_y10)
edges9 = linspace(min_y_new, max_y_new, 100);

%% calculating value of PDF1 and PDF2
PDF9_old = ksdensity(split_data.y9,edges9,'function','pdf')
PDF10 = ksdensity(split_data.y10,edges9,'function','pdf')

%% Information length calculation 
%E1= 4 PDF2old*(sqrt(PDF1)-sqrt(PDF2old)).^2/(dt).^2

dt = x(time_split(10))-x(time_split(9))
T_EO= [T_EO,T_EO(end)+dt]

%Distance between 1st and 2nd PDF
E9 = sum(4.*sqrt(PDF9_old).*(sqrt(PDF10)-sqrt(PDF9_old)).^2/(dt).^2)
E_EO=[E_EO,E9]

%%Information length is going to be L_EO= sum(E1+E2+....E9)
L9 = sum(sqrt(E1)+ sqrt(E2) + sqrt(E3) + sqrt(E4) + sqrt(E5) + sqrt(E6) + sqrt(E7) + sqrt(E8) + sqrt(E9))
L_EO= [L_EO,L9]

%Plot onformation length vs time
hold on
subplot(2,1,1);
plot(T_EO,E_EO,'b')

hold on
subplot(2,1,2);
plot(T_EO,L_EO,'b')

% hold on
% plot(T_EO,L_EO,'r:','LineWidth',2) 
% title('Information Flow for Parietal regions in AD and HC','FontName', 'Times','fontsize',14)
% xlabel('Time(ms)','FontName', 'Times','fontsize',12)
% ylabel('Information Length','FontName', 'Times','fontsize',12)

