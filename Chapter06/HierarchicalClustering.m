DataPoints = [100 100;90 90;10 10;10 20;90 70;50 50] 
DistanceCalc = pdist(DataPoints)
DistanceMatrix = squareform(DistanceCalc)
GroupsMatrix = linkage(DistanceCalc)
dendrogram(GroupsMatrix)
VerifyDistaces = cophenet(GroupsMatrix, DistanceCalc)
NewDistanceCalc = pdist(DataPoints, 'cosine')
NewGroupsMatrix = linkage(NewDistanceCalc,'weighted')
NewVerifyDistaces = cophenet(NewGroupsMatrix, NewDistanceCalc)
