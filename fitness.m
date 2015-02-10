function [score] = fitness(groupList)
global Thesis;
groupSizes = [4, 4, 4, 4, 4, 4, 3, 3];
start = 1;
score = 0;
    for i = 1:1:length(groupSizes)
        group = groupList(start:start + groupSizes(i)-1);
        start = start + groupSizes(i);

        submatches = Thesis(group,group);
        sumsubmatches = sum(submatches,2);
        score = score + sum(sumsubmatches>1);
    end
end

