
clear all
num1 = [4]; 
den1 = poly([-3 0]); 
G = tf(num1,den1); 
H = 1 ;
GH = G*H; 
GH1 = feedback(G,H)
rlocus(GH)     %Respuesta a la rampa del sistema sin compensador
figure(1)
step(GH1)
xlabel('Tiempo') 
ylabel('Amplitud') 
title('Respuesta del escalón')
grid on
t=0:0.05:6;
s=tf([1],[1 0])
c=step(GH1*s,t);
figure(2)
plot(t,c,'b',t,t,'k')
xlabel('Tiempo (s)') 
ylabel('Amplitud') 
title('Respuesta de rampa')
grid on
z1 = [-3 -0.1]; 		            %Define los ceros de Gc(s)
p1 = [-26.6656 -0.01]; 		            %Define los polos de Gc(s)
k1 = [86.7878];                  %Define la ganancia de Gc(s)
Gc2 = zpk(z1,p1,k1) 		    %Crea la función de transferencia equivalente
GcG2=G*Gc2
GcGH2 = feedback(GcG2,H)  
K = 1; 
t=0:0.05:20; 
c=step(GH1*s,t);%Respuesta a la rampa del sistema con compensador gamma diferente de beta
c2=step(GcGH2*s,t);
figure(3)
plot(t,c,'r',t,c2,'g',t,t,'k')  
xlabel('Tiempo (s)') 
ylabel('Amplitud')
title('Respuesta de rampa') 
legend({'Sistema sin compensar ','Sistema compensado)'},'Location','southwest')
grid on
t=0:0.05:6;                 %Respuesta al escalon del sistema con compensador gamma diferente de beta
c=step(GH1,t);
c2=step(GcGH2,t);
figure(4)
plot(t,c,'r',t,c2,'g')
xlabel('Tiempo (s)') 
ylabel('Amplitud')
title('Respuesta de escalón')
legend({'Sistema sin compensar ','Sistema compensado)'},'Location','southwest')
grid on

grid on
z2 = [-8.6169 -0.1]; 		            %Define los ceros de Gc(s)
p2 = [-40.28 -0.0214]; 		            %Define los polos de Gc(s)
k2 = [97.6505];                  %Define la ganancia de Gc(s)
Gc3 = zpk(z2,p2,k2) 		    %Crea la función de transferencia equivalente
GcG3=G*Gc3
GcGH3 = feedback(GcG3,H)
K = 1; 
t=0:0.05:20;                %Respuesta a la rampa del sistema con compensador gamma igual a beta
c=step(GH1*s,t);
c3=step(GcGH3*s,t);
figure(5)
plot(t,c,'r',t,c3,'g',t,t,'k')  
grid on
xlabel('Tiempo (s)') 
ylabel('Amplitud')
title('Respuesta de rampa') 
legend({'Sistema sin compensar ','Sistema compensado)'},'Location','southwest')
t=0:0.05:6;                 %Respuesta al escalon del sistema con compensador gamma igual a beta
c=step(GH1,t);
c3=step(GcGH3,t);
figure(6)
plot(t,c,'r',t,c3,'g')
xlabel('Tiempo (s)') 
ylabel('Amplitud')
title('Respuesta de escalón')
legend({'Sistema sin compensar ','Sistema compensado)'},'Location','southwest')
grid on

rltool (GH,K)  

