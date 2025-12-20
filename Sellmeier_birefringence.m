clc;clear;close all
colo1 = [0/255 112/255 222/255];
colo2 = [181/255 67/255 90/255];
colo3 = [51/255 142/255 202/255];
set(gcf,'position',[50, 550, 400, 345]);
tiledlayout(1,3,'TileSpacing','loose','Padding','loose');
Font_Size = 12;
L_YVO4 = 0:0.5e4:5e4;  % length of YVO4, μm
% L_YVO4 = 3e4;  % length of YVO4, μm
for j = 1:length(L_YVO4)

    L = L_YVO4(j);
    c = 3e14; % light speed, μm
    
    %%　YVO4
    lambda = 0.8; % pump  wavelength, μm
    % Sellmeier方程（λ单位µm）
    no_YVO4 = sqrt(3.77834 + 0.069736 / (lambda^2 - 0.04724) - 0.0108133*lambda^2);
    ne_YVO4 = sqrt(4.59905 + 0.110534 / (lambda^2 - 0.04813) - 0.0122676*lambda^2);
    dn = ne_YVO4 - no_YVO4;
    OP1 = dn * L;

    lambda = 1.040;  % Stokes  wavelength, μm
    no_YVO4 = sqrt(3.77834 + 0.069736 / (lambda^2 - 0.04724) - 0.0108133*lambda^2);
    ne_YVO4 = sqrt(4.59905 + 0.110534 / (lambda^2 - 0.04813) - 0.0122676*lambda^2);
    dn = ne_YVO4 - no_YVO4;
    OP2 = dn * L;

    dOP = OP1 -OP2;
    t1 = OP1/c*1e12;  % ps
    t2 = OP2/c*1e12; % ps

    Raman_shift_YVO4(j) = (dOP)*0.378;
    %%　LiNbO3
% 
%     lambda = 1.040;  % Stokes  wavelength, μm
%     no_LiNbO3 = sqrt(4.9048 + 0.11768/(lambda^2-0.04750) - 0.027169*lambda^2);
%     ne_LiNbO3 = sqrt(4.5820 + 0.099169/(lambda^2-0.04443) - 0.02195*lambda^2);
%     dn_LiNbO3 = no_LiNbO3 - ne_LiNbO3;
%     OP2_LiNbO3 = abs(dn_LiNbO3 * 4e4);

    Raman_shift(j) = (dOP )*0.378 * 1.33;

end
L = L_YVO4*1e-4;
plot(L, Raman_shift_YVO4, 'color',colo1, 'linewidth', 2); hold on  
plot(L, Raman_shift, 'color',colo2, 'linewidth', 2); hold on 
scatter([1 2 3 4], [28 57 87 112],'MarkerFaceColor',colo2,'MarkerEdgeColor', 'none',  'linewidth', 2); hold on  

   h=patch([L, fliplr(L)],[Raman_shift_YVO4, fliplr(Raman_shift_YVO4)*0],colo3);
    set(h,'edgealpha',0,'facealpha',0.2) 
   h=patch([L, fliplr(L)],[Raman_shift, fliplr(Raman_shift_YVO4)],colo2);
    set(h,'edgealpha',0,'facealpha',0.2) 

axis([0.5 4.5 10 140])
xlabel('Length of BFC (cm)')
ylabel('Raman shift difference (cm^{-1})')
legend('SF computation', 'Modified SF computation','Measurement','box','off','Location','Northwest')
set(gca,'linewidth', 1.5,'FontSize',Font_Size)
