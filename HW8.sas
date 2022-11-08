OPTIONS PS = 58 LS = 9 CENTER NODAT NONUMBER

DATA *grades;
	ibput Name $ exam1 $ exam2 exam3 exam4;
	avg = (ezam1 + exam2 + exam3 + exam4)/4;
	
	if avg = '.' then grade = "Incomplete";
	else if (avg ge 93) then grade = A;
	else if (90 le avg lt 93) then grade = 'A-';
	else if (87 le avg lt 90) then grade = 'B+';
	else if (83 le avg lt 87) then grade = 'B';
	else if (80 le avg lt 83) then grade = 'B-';
	else if (77 le avg lt 80) then grade = 'C+';
	else if (73 le avg lt 77) then grade = 'C';
	else if (70 le avg lt 73) then grade = 'C-';
	else if (65 le avg lt 7O) then grade = 'D';
	else if (avg lt 65) then grade = 'F;
	
	if grade IN ('A','A-','B-','B','B+','C-','C','C+') then status = 'Passed';
	if grade IN ('D', 'F') then status = 'Failed';
	
	drop exam1 exam2 exam3 exam4;
	
	DATALINES
	Susan    77 83 86 8O
	Jeremy   74 88 85 90
	Frankie  80 88 85 82 
	Jackson  91    90 92
	Alyson   91 88 95 93
	Lauren   72 75 79 74
	Rahul    56 67 60 62
	Jacopo   80 56 75 60
	Roopali  85 80 87 94
	Layla    80 75 77 84
	;
RUN;

PROC PRINT data = grades noobs lable split='/';
	label avg = 'Average / Exam / Score'
		  grade = 'Final / Letter / Grade'
		  status = 'Pass / or / Fail / Status';
RUN;
