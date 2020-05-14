D_050=[79.24736023 74.66591644 70.60778809 65.46820068 65.72544861];
D_100=[50.39896393 51.10709763 52.73698589 48.65811539 51.68948746];
D_150=[40.67362213 41.86125565 30.47481155 52.01008987 48.30031204];

x = 50:50:150;
y = [mean(D_050) mean(D_100) mean(D_150)]/0.113;
p = polyfit(x,y,2);

y1=polyval(p,x);
err =[std(D_050) std(D_100) std(D_150)]/0.113;

H=table(y,err,p);
writetable(H,'Haftfestigkeit.txt');
type Haftfestigkeit.txt

errorbar(x,y,err,'^')
hold on
plot(x,y1);
hold off
grid on
title('Haftfestigkeit-Rakelspalt(inkl. Standardabweichung)','FontSize',12)
xlabel('Rakelspalt','FontSize',12)
xlim([25 175])
xticks([50 100 150])
xticklabels({'50\mum','100\mum','150\mum'})
ylabel('Haftfestigkeit(kPa)','FontSize',12)

fig=gcf;
fig.PaperUnits='centimeters';
fig.PaperPosition=[0 0 16 8];
fig.PaperSize=[16 8];
saveas(fig,'Haftfestigkeit','pdf')