OPTIONS LS = 72 PS = 20 NODATE;
LIBNAME stat480 '/home/u60747918';

DATA broadway;
  set stat480.broadway;
RUN;

PROC FREQ data= broadway;	
	tables year*type/out= yearfreq noprint;
	
RUN;

PROC PRINT NOOBS;
    title 'Summary data set';
RUN;