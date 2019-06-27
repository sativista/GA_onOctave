function [parent1, parent2] = selection(population)
  
  M = length(population.Chromosome(:));
  if any([population.Chromosome(:).Fitness] < 0)
    % Fitness scaling f_scaled = a * f + b;
    a = 1;
    b = min([population.Chromosome(:).Fitness]); 
    b = abs(b);
    scaled_fitnes = a * [population.Chromosome(:).Fitness] + (b + 1);
    normalized_fitness_values = [scaled_fitnes] ./ sum([scaled_fitnes])
  else
    normalized_fitness_values = [population.Chromosome(:).Fitness] ./ sum([population.Chromosome(:).Fitness])
  end
  % Step 2: to sort the normalized fitness values
  [sorted_fitness_values, sorted_idx] = sort(normalized_fitness_values, 'descend');

  for i = 1:length(population.Chromosome)
    temp_population.Chromosome(i).Fitness = population.Chromosome(sorted_idx(i)).Fitness
    temp_population.Chromosome(i).Gene = population.Chromosome(sorted_idx(i)).Gene
    temp_population.Chromosome(i).normalized_Fitness = normalized_fitness_values(sorted_idx(i))
  end
  
  
  cumsum = zeros(1, M);

  for i = 1:M
    for j = i:M
      cumsum(i) = cumsum(i) + temp_population.Chromosome(j).normalized_Fitness;
    end
  end

  cumsum

  % Step 3: to select parents
  % Parent 1
  R = rand()  % in [0,1]

  for i = 1:length(cumsum)
    if R > cumsum(i)
      parent1_idx = i - 1
      break;
    end
  end




  % Parent 2
  parent2_idx = parent1_idx;
  while parent2_idx == parent1_idx
    R = rand()  % in [0,1]

    for i = 1:length(cumsum)
      if R > cumsum(i)
        parent2_idx = i - 1
        break;
      end
    end
  end
  
  %population.Chromosome(k).Gene;
  %population.Chromosome(k).Fitness;
  parent1 = temp_population.Chromosome(parent1_idx);
  parent2 = temp_population.Chromosome(parent2_idx);
endfunction
