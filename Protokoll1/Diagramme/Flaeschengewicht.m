D_050=[15.2 14.1 13.1 13.7 12.8];
D_100=[16.2 16.1 16.1 15.6 16.1];
D_150=[19.0 18.7 18.8 18.9 18.8];

x = 50:50:150;
y = [mean(D_050) mean(D_100) mean(D_150)]/1.13-8.73;
p = polyfit(x,y,1);

y1=polyval(p,x);
err =[std(D_050) std(D_100) std(D_150)]/1.13;

F=table(y,err,p);
writetable(F,'Flaechengewicht.txt');
type Flaechengewicht.txt

errorbar(x,y,err,'^')
hold on
plot(x,y1);
hold off
grid on
title('Flächengewicht-Rakelspalt(inkl. Standardabweichung)','FontSize',12)
xlabel('Rakelspalt','FontSize',12)
xlim([25 175])
xticks([50 100 150])
xticklabels({'50\mum','100\mum','150\mum'})
ylabel('Flächengewicht(mg/cm^2)','FontSize',12)

fig=gcf;
fig.PaperUnits='centimeters';
fig.PaperPosition=[0 0 16 8];
fig.PaperSize=[16 8];
saveas(fig,'Flaechengewicht','pdf')