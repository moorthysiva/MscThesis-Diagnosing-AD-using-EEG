%% Joint PDF,E,L
load('EADEOC3P3C4P4.mat')
E_AB = table2array(E_AD_EO_C3P3_C4P4);

load('informationlengthADEOC3P3C4P4.mat')
L_AB = table2array(information_length_AD_EO_C3P3_C4P4);

J_AB = zeros(10,10)
for m = 1:10
J_AB(m,:) = cumsum(E_AB(m,:))
end

%% Single PDF,E,L
load('EADEOC3P3.mat')
E_A = table2array(EADEOC3P3);

load('informationlengthADEOC3P3.mat')
L_A = table2array(informationlengthADEOC3p3);

J_A = zeros(10,10)
for m = 1:10
J_A(m,:) = cumsum(E_A(m,:))
end

load('EADEOC4P4.mat')
E_B = table2array(EADEOC4P4);

load('informationlengthADEOC4P4.mat')
L_B = table2array(informationlengthADEOC4P4);

J_B = zeros(10,10)
for m = 1:10
J_B(m,:) = cumsum(E_B(m,:))
end

T = [0,1.2,2.4,3.6,4.8,6.0,7.2,8.4,9.6,10.8]

Corr_L_AB = L_A + L_B - L_AB;
Corr_E_AB = E_A + E_B - E_AB;
Corr_J_AB = J_A + J_B - J_AB;

figure(1)
plot(T,Corr_L_AB(1,:),'r','LineWidth',2)
hold on
plot(T,Corr_L_AB(2,:),'r','LineWidth',2)
hold on
plot(T,Corr_L_AB(3,:),'r','LineWidth',2)
hold on
plot(T,Corr_L_AB(4,:),'r','LineWidth',2)
hold on
plot(T,Corr_L_AB(5,:),'r','LineWidth',2)
hold on
plot(T,Corr_L_AB(6,:),'r','LineWidth',2)
hold on
plot(T,Corr_L_AB(7,:),'r','LineWidth',2)
hold on
plot(T,Corr_L_AB(8,:),'r','LineWidth',2)
hold on
plot(T,Corr_L_AB(9,:),'r','LineWidth',2)
hold on
plot(T,Corr_L_AB(10,:),'r','LineWidth',2)

figure(2)
plot(T,Corr_E_AB(1,:),'r','LineWidth',2)
hold on
plot(T,Corr_E_AB(2,:),'r','LineWidth',2)
hold on
plot(T,Corr_E_AB(3,:),'r','LineWidth',2)
hold on
plot(T,Corr_E_AB(4,:),'r','LineWidth',2)
hold on
plot(T,Corr_E_AB(5,:),'r','LineWidth',2)
hold on
plot(T,Corr_E_AB(6,:),'r','LineWidth',2)
hold on
plot(T,Corr_E_AB(7,:),'r','LineWidth',2)
hold on
plot(T,Corr_E_AB(8,:),'r','LineWidth',2)
hold on
plot(T,Corr_E_AB(9,:),'r','LineWidth',2)
hold on
plot(T,Corr_E_AB(10,:),'r','LineWidth',2)

Corr_E_AB_AD = Corr_E_AB;
Corr_L_AB_AD = Corr_L_AB;
Corr_J_AB_AD = Corr_J_AB
