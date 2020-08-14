%ch_no = 13; %C3-P3
for r = 2:24
    ch_no = r
    All_L_EC = zeros(10, 10);
    All_E_EC = zeros(10, 10);

    R1316ECLONGEPOCH612S_AD_EC_single;
    % dlmwrite('information_length_AD_EC.csv',L_EC)
    % dlmwrite('E_AD_EC.csv',E_EC)
    All_L_EC(1,:) = L_EC;
    All_E_EC(1,:) = E_EC;

    %%

    R14162ECLONGEPOCH6_AD_EC_single;
    All_L_EC(2,:) = L_EC;
    All_E_EC(2,:) = E_EC;

    %%

    R15162ECLONGTRACE6_AD_EC_single;
    All_L_EC(3,:) = L_EC;
    All_E_EC(3,:) = E_EC;

    R4216LONGEPOCHEC6_AD_EC_single;
    All_L_EC(4,:) = L_EC;
    All_E_EC(4,:) = E_EC;

    R4416LONGEPOCHEC6_AD_EC_single;
    All_L_EC(5,:) = L_EC;
    All_E_EC(5,:) = E_EC;

    R4717LONGEPOCHEC6_AD_EC_single;
    All_L_EC(6,:) = L_EC;
    All_E_EC(6,:) = E_EC;

    %Channel number going to change
    ch_no = ch_no + 1;
    R5017LONGEPOCHEC6_AD_EC_single;
    ch_no = ch_no - 1;
    All_L_EC(7,:) = L_EC;
    All_E_EC(7,:) = E_EC;

    R5117LONGEPOCHEC6_AD_EC_single;
    All_L_EC(8,:) = L_EC;
    All_E_EC(8,:) = E_EC;

    R5317LONGEPOCHEC6_AD_EC_single;
    All_L_EC(9,:) = L_EC;
    All_E_EC(9,:) = E_EC;

    %change in channel number
    if ch_no == 2
        ch_no = 24;
         disp(ch_no);   


    else
        ch_no = ch_no - 1;
        disp(ch_no);
    end

    R5617LONGEPOCHEC6_AD_EC_single;
    All_L_EC(10,:) = L_EC;
    All_E_EC(10,:) = E_EC;

    %% Calculate min value for each column

    N = size(All_L_EC,1);
    min_list_L_EC = min(All_L_EC);
    max_list_L_EC = max(All_L_EC);
    range_list_L_EC = range(All_L_EC);
    mean_list_L_EC = mean(All_L_EC);
    var_list_L_EC = var(All_L_EC);
    %std_list_L_EC = std(All_L_EC)/sqrt(N);
    std__list_L_EC = std(All_L_EC);
    norm_std_list = std__list_L_EC./mean_list_L_EC; 
    norm_std_list(1)=0;
    norm_range_list = range_list_L_EC./mean_list_L_EC;
    norm_range_list(1) =0;

    % CI95 = tinv([0.025 0.975], N-1);                    
    % L_EC_CI95 = bsxfun(@times, std_list_L_EC, CI95(:));

    summary_L_EC = [min_list_L_EC;max_list_L_EC;range_list_L_EC;mean_list_L_EC;var_list_L_EC]


    min_list_E_EC = min(All_E_EC);
    max_list_E_EC = max(All_E_EC);
    range_list_E_EC = range(All_E_EC);
    mean_list_E_EC = mean(All_E_EC);
    var_list_E_EC = var(All_E_EC);
    std__list_E_EC = std(All_E_EC);


    summary_E_EC = [min_list_E_EC;max_list_E_EC;range_list_E_EC;mean_list_E_EC;var_list_E_EC]


    %% CREATING TABLE TO RECORD ALL L_EC,E_EC
    % adding rownames and column names

    summary_L_EC_table = array2table(summary_L_EC,'VariableNames',{'E0','E1','E2','E3','E4','E5','E6','E7','E8','E9'},...
                              'RowNames',{'Min';'Max';'Range';'Mean';'Variance'})

    summary_E_EC_table = array2table(summary_E_EC,'VariableNames',{'E0','E1','E2','E3','E4','E5','E6','E7','E8','E9'},...
                               'RowNames',{'Min';'Max';'Range';'Mean';'Variance'})

    %%
    writetable(summary_L_EC_table,'information_length_AD_EC_F4_Fz.csv','WriteRowNames',true)
    type 'information_length_AD_EC_F4_Fz.csv'
    writetable(summary_E_EC_table,'E_AD_EC_F4_Fz.csv','WriteRowNames',true)
    type 'E_AD_EC_F4_Fz.csv'

    %%plot mix,max,variance,range,mean

    % 
    % figure(2)
    % hold on
    % subplot(2,1,1);
    % plot(T_EC,min_list_E_EC,'c')
    %  hold on
    % plot(T_EC,max_list_E_EC,'c')
    % hold on
    % plot(T_EC,range_list_E_EC,'c')
    % hold on
    % plot(T_EC,mean_list_E_EC,'c')
    % hold on
    % plot(T_EC,var_list_E_EC,'c')


    % subplot(2,1,2);
    % plot(T_EC,min_list_L_EC,'r')
    % hold on
    % plot(T_EC,max_list_L_EC,'r')
%     hold on
%     plot(T_EC,range_list_L_EC,'r')
    hold on
    plot(T_EC,mean_list_L_EC,'r','Linewidth',2)
%     hold on
%     plot(T_EC,var_list_L_EC,'r')

    % subplot(2,1,1);
%     hold on
%     plot(T_EC,norm_std_list,'r')
%     subplot(2,1,2);
%     hold on
%     plot(T_EC,norm_range_list,'r')

    % hold on
    % plot(T_EC, L_EC_CI95+mean_list_L_EC,'r')   
end

xlabel ('Time')
ylabel('Mean of information length')
title('All HC and AD patient’s mean of Parietal Region -Eyes Closed')


