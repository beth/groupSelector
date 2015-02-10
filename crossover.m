function [newGene1, newGene2] = crossover(gene1, gene2)

crossoverpoint = randi([1 length(gene1)]);
newGene1 = gene2(1:crossoverpoint);
newGene2 = gene1(1:crossoverpoint);

[a b] = setdiff(gene1, newGene1);
newGene1 = [newGene1, gene1(sort(b))];

[a b] = setdiff(gene2, newGene2);
newGene2 = [newGene2, gene2(sort(b))];



end

