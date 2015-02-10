function [matchMat] = chooseGroups(groupsSoFar, peopleRemaining, groupSize)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
global Thesis;
global people;
matchMat = zeros(1,30);
matchesFound = 1;
if(matchesFound > 1)
    return;
end
if(length(peopleRemaining) == 0)
    matchMat(matchesFound,:) = groupsSoFar;
    matchesFound = matchesFound + 1;
    return;
end

C = nchoosek(peopleRemaining,groupSize);
num = size(C,1);

for i=1:1:num
    group = C(i,:);
    submatches = Thesis(group,group);
    sumsubmatches = sum(submatches,2);
    if(all(sumsubmatches>1))
        tempGroupSoFar = [groupsSoFar, group];
        if(length(tempGroupSoFar) > 5)
            nextGroupSize = 4;
        else
            nextGroupSize = 3;
        end
        chooseGroups(tempGroupSoFar, setdiff(people,tempGroupSoFar), nextGroupSize);
    end
end

return

end

