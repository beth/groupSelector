npop = 50;
nstudents = 30;
genes = zeros(npop,nstudents);


%%%%%INITIALIZE
for i = 1:1:npop
    genes(i,:) = randperm(nstudents);
end
scores = zeros(npop,1);
newGenes = zeros(npop,nstudents);
generations = 20000;
maxScores = zeros(generations,1);

%%%%%% Determine fitness
for j = 1:1:generations
    for i = 1:1:npop
        scores(i) = fitness(genes(i,:));
    end

    %%%%% Find overall fitness
    totalScore = sum(scores);
    maxScores(j) = max(scores);
    %%%%% Create probability 
    probability = cumsum(scores/totalScore);
    %%%%% Spin wheel npop times
    wheel = rand(npop, 1);

    %%%%% Get new genes 
    for i = 1:1:npop
        choice = find(probability>wheel(i),1);
        newGenes(i,:) = genes(choice,:);
        %TODO: Mutate
        mutprob = rand(1, nstudents);
        mutLoc = find(mutprob < 0.01);
        for k = 1:1:length(mutLoc)
            swapLoc = randi([1 nstudents]);
            temp = newGenes(i,k);
            newGenes(i, k) = newGenes(i, swapLoc);
            newGenes(i, swapLoc) = temp;
        end
        %TODO: Crossover 
    end
    
    crossoverindex = randperm(npop, 4);
    for i = 1:2:length(crossoverindex)
        ind1 = crossoverindex(i);
        ind2 = crossoverindex(i+1);
        [gene1, gene2] = crossover(newGenes(ind1,:),newGenes(ind2,:));
        newGenes(ind1,:) = gene1;
        newGenes(ind2,:) = gene2;
    end
    genes = newGenes;
end
