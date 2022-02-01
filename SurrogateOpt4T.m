
load('Data');
rng default
options = optimoptions('surrogateopt','PlotFcn','surrogateoptplot');
lb = [36,15]; % Lower bound:[perimortem body temperature, ambient temperature]
ub = [38,25]; % Upper bound:[perimortem body temperature, ambient temperature]

body = fieldnames(Data);
i = 2; % Choose body;
locs = fieldnames(Data.(body{i}));
j = 2; % Choose location;
fun = @(x)SimulateT(x,Data.(body{i}).(locs{j}));
sol = surrogateopt(fun,lb,ub,options);
formatSpec = "The estimated perimortem body temperature is: %.4f %cC\nThe estimated ambient temperature is: %.4f %cC\n";
str = sprintf(formatSpec,sol(1),char(176),sol(2), char(176));
disp(str)

