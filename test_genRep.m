clear
clc

% Population
  M = 10; % number of chromosomes (candidates solutions)
  N = 2; % number of genes (variables)
  
  for k = 1:M
    population.Chromosome(k).Gene(1,:) = [round(rand()),round(rand())];
    population.Chromosome(k).Fitness = fitnessFunction(population.Chromosome(k).Gene(:));
  end

  
  [parent1, parent2] = selection(population)