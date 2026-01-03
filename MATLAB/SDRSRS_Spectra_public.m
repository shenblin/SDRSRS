clc;clear;close all

file_path = 'E:\Shenblin\SRS\Dual-SRS\data\SDRSRS-main\MATLAB';
Font_Size = 11;

ds = 1.65; % wavenumber
x_shift = 87;

colo1 = [0/255 112/255 222/255];
colo2 = [181/255 67/255 90/255];
colo3 = [51/255 142/255 202/255];
for k = 1:4
    switch k
    case 1
        I =readmatrix([file_path,'\DMSO1chn']);
        t = 301:800;
        I(:,2) = I(:,2)-min(I(:,2));
        calib = 2476;
    case 2
        I =readmatrix([file_path,'\MeOH1chn']);
        t = 201:700;
        calib = 2482;

    case 3
        I =readmatrix([file_path,'\DMSO2chn']);
        t = 221:720;
        calib = 2488;
    case 4
        I =readmatrix([file_path,'\MeOH2chn']);
        t = 481:980;
        calib = 2430;

    end

    I = single(I);
    Spectra(:,1) = I(t,1); % X demodulation
    Spectra(:,2) = I(t,2); % Y demodulation
    Spectra(:,3) = I(t,3); % R demodulation
    Spectra = Spectra*1e3;
    Wavenumber = (1:length(I(t,1)))*ds+calib;

    if k<=2
    %% uni-spectra
            figure;
        set(gcf,'position',[150+370*(k-1), 550, 380, 345]);
     nexttile
    plot(Wavenumber, Spectra(:,1), 'color',colo1, 'linewidth', 2); hold on  
    plot(Wavenumber, Spectra(:,2), 'color',colo2, 'linewidth', 2); hold on
    ylabel('Intensity (mV)')
        if k ==1
            x1 = 305:330; x2 = 220:300; % DMSO
        elseif k ==2
            x2 = 186:240; x1 = 240:320; % MeOH
        end
    
        h=fill([Wavenumber(x1), fliplr(Wavenumber(x1))],[Spectra(x1,1)', fliplr(Spectra(x1,2)')],colo3);
        set(h,'edgealpha',0,'facealpha',0.8) 
        h=fill([Wavenumber(x2), fliplr(Wavenumber(x2))],[Spectra(x2,1)', fliplr(Spectra(x2,2)')],colo2);
        set(h,'edgealpha',0,'facealpha',0.8) 

        switch k
            case 1  % DMSO
            ylim([-0.8 max(Spectra(:,2))*1.5])
            case 2  % MeOH
            ylim([-0.2 max(Spectra(:,2))*1.5])
        end
         xlim([min(Wavenumber) max(Wavenumber)])


    else
        %% dual-spectra
        figure;
        set(gcf,'position',[150+370*(k-3), 50, 380, 345]);
        t = tiledlayout(1,1);
        ax1 = axes(t);
        plot(ax1,Wavenumber, Spectra(:,2), 'color', colo2,'linewidth', 2); hold on  
         xlim([min(Wavenumber) max(Wavenumber)])
        set(gca,'xaxislocation','top','xcolor',colo2,'yaxislocation','left');
        set(gca, 'linewidth', 1.5,  'FontSize',Font_Size, 'box','off')
        ylabel('Intensity (mV)')
        switch k
            case 3
            ymin = -1.7; ymax = max(Spectra(:,2))*1.4;
            case 4
            ymin = -0.3; ymax = max(Spectra(:,2))*1.4;

        end
        ylim([ymin ymax])
        if k ==3
            x1 = 245:275; x2 = x1; % DMSO
            h=fill([Wavenumber(x1), fliplr(Wavenumber(x1))],[Spectra(x1,1)', fliplr(Spectra(x1,1)'*0)],colo3);
        elseif k ==4
            x1 = 232:260; x2 = x1; % MeOH
            h=fill([Wavenumber(x1), fliplr(Wavenumber(x1))],[Spectra(x1,1)', fliplr(Spectra(x1,1)'*0)],colo3);
        end
        set(h,'edgealpha',0,'facealpha',0.8) 


        ax2 = axes(t);
        plot(ax2,Wavenumber+x_shift, Spectra(:,1), 'color',colo1, 'linewidth', 2); hold on
         xlim([min(Wavenumber+x_shift) max(Wavenumber+x_shift)])
        set(gca, 'color', 'none','xcolor',[0/255 60/255 150/255],'xaxislocation','bottom','yaxislocation','left');
        set(gca,'yticklabel',[]);
        ylim([ymin ymax])

        if k ==3
        h=fill([Wavenumber(x2)+x_shift, fliplr(Wavenumber(x2)+x_shift)],[Spectra(x2,2)', fliplr(Spectra(x2,2)'*0)],colo2);
        elseif k ==4
        h=fill([Wavenumber(x2)+x_shift, fliplr(Wavenumber(x2)+x_shift)],[Spectra(x2,1)', fliplr(Spectra(x2,2)')],colo2);
        plot([min(Wavenumber+x_shift) max(Wavenumber+x_shift)], [0 0], ':k', 'linewidth', 2); hold on
        end
        set(h,'edgealpha',0,'facealpha',0.8) 


         line([max(Wavenumber+x_shift),max(Wavenumber+x_shift)], [ymin,ymax], 'color', 'k', 'linewidth', 1.5)
        set(gca, 'box','off')
    end
   
    xlabel('Wavenumber (cm^{-1})','color','k')
    set(gca, 'xtick',2600:200:3400)  
    % legend('In-phase X','Quadrature, Y','box','off')
    set(gca, 'linewidth', 1.5,  'FontSize',Font_Size)
end
