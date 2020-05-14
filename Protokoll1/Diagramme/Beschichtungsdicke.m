D_050=[64 58 52 53 46];
D_100=[74 74 73 68 69];
D_150=[94 88 94 92 91];

x = 50:50:150;
y = [mean(D_050)-10 mean(D_100)-10 mean(D_150)-10];
p = polyfit(x,y,1);

y1=polyval(p,x);
err =[std(D_050) std(D_100) std(D_150)];

B=table(y,err,p);
writetable(B,'Beschithtung.txt');
type Beschithtung.txt

errorbar(x,y,err,'^')
hold on
plot(x,y1);
hold off

grid on
title('Beschichtungsdicke-Rakelspalt(inkl. Standardabweichung)','FontSize',12)
xlabel('Rakelspalt','FontSize',12)
xlim([25 175])
xticks([50 100 150])
xticklabels({'50\mum','100\mum','150\mum'})
ylabel('Beschichtungsdicke(\mum)','FontSize',12)

fig=gcf;
fig.PaperUnits='centimeters';
fig.PaperPosition=[0 0 16 8];
fig.PaperSize=[16 8];
saveas(fig,'Beschichtungsdicke','pdf')