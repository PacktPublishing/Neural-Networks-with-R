Data = xlsread('ClimaticData.xls');
gscatter(Data(:,1),Data(:,2))
GMModel = fitgmdist(Data,2)
gscatter(Data(:,1),Data(:,2))
hold on
ezcontour(@(x1,x2)pdf(GMModel,[x1 x2]),[0 45 0 30])
IdCluster = cluster(GMModel,Data);
gscatter(Data(:,1), Data(:,2), IdCluster,'bg','xo')
CenterCluster = GMModel.mu;
hold on
plot(CenterCluster(:,1),CenterCluster(:,2),'x','LineWidth',4,'MarkerEdgeColor','k','MarkerSize',25)
ezcontour(@(x1,x2)pdf(GMModel,[x1 x2]),[0 45 0 30])
mu = GMModel.mu;
sigma = GMModel.Sigma;
DistObj = gmdistribution(mu,sigma);
ezsurf(@(x,y)pdf(DistObj,[x y]),[0 45],[0 30])

































