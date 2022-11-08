OPTIONS LS = 75 PS = 58 NODATE;

LIBNAME stat480 '/home/u60747918';

DATA stat480.parks;
	INFILE '/home/u60747918/parks.txt';
	INPUT @1 REg $2.
		  @4 Type $8.
		  @13 ParkNAme $37.
		  @61 DayVisits comma12.
		  @74 Acres comma12.;
		  Hectares = 2.471 * Acres;
		  if (Type = 'NM' ) then ParkType = 'Monument';
		  else if (Type = 'NP') then ParkType = 'Park';
		  else if (Type in ('NPRE','PRE','PRESERVE')) then ParkType = 'Preserve';
		  else if (Type = 'NS') then ParkType = 'Seashore';
		  else if (Type in ('RVR', 'RIVERWAY')) then ParkType = 'River';

PROC SORT data = stat480.parks out= srtd_parks;
			by descending Acres;
		 
RUN;
		  
PROC PRINT data = srtd_parks (firstobs= 1 obs=15)  split='/' Noobs Double;
		   label ParkName = 'Name of Park';
		   label Acres = 'Number of Acres';
		   format Dayvisits comma12. Acres comma12. Hectares comma12.6;
		   where Type = 'NP';
		   id ParkName;
		   var ParkName Acres;
		   title 'Output dataset: Top 15 largest Parks';
RUN;
		  
		