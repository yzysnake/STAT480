LIBNAME stat480 '/home/u60747918';
Filename veggies '/home/u60747918/veggies-1.dat';

DATA stat480.veggies;
  infile veggies;
  input name $ 1-8 product_code $ 10-16 germination_days 18-19 number_seeds 21-22 ;
RUN;
 
PROC PRINT data=stat480.veggies;
  title 'Output dataset: veggies';
RUN;