function [fitness_value] = fitnessFunction(X)
  no_blades = X(1);
  length_blades = X(2);
  fitness_value = (no_blades + length_blades * 0.13) * pi;
end