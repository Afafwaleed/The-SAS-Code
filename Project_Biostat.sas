title1 'Stat669 --- Afaf Alharbi';
title2 'PROJECT --- ';
data stroke;
              infile 'C:\Users\aali9\Desktop\BioStat\Project\stroke.csv'  firstobs=2 dsd;
              input  gender $   hypertension $ heart_disease $ smoking_status $ stroke $;
    run;

********Verify Data Properly Read into SAS Data Set stroke*********;

proc print     data=stroke ;
               title3 'Verify Data Properly Read into SAS Data Set stroke';
run;
********Droping observation related to unkown *********;
data new_stroke;
  set stroke;
   if smoking_status='Unknown' then delete; 
run;
********Verify Data The New Data Set stroke Without "unkown"response *********;

proc print     data= new_stroke;
               title3 ' The New Dataset Properly Read into SAS Without Observations related to (Unknown) ';
run;
********Droping observation related to Other *********;
data ST;
  set new_stroke;
   if gender='Other' then delete; 
run;
********Verify Data The New Data Set  Without "Other"response *********;

proc print     data= ST;
               title3 ' The New Dataset Properly Read into SAS Without Observations related to (Other)';
run;


********Tables to Study The Association between Smoking Status & having Stroke *******;
proc sort data=ST;
run;

proc freq data=ST;
  tables smoking_status*stroke ;
  title3 ' First Part:Table to Study The Association between Smoking Status & having Stroke ';
run;

********Tables to Study The Association between Smoking Status & having Stroke With respect to gender*******;
proc sort data=ST;
  by gender;
run;

proc freq data=ST;
 by gender;
  tables smoking_status*stroke ;
  title3 ' Third Part:Table to Study The Association between Smoking Status & having Stroke with respect to Gender ';
run;

********Tables to Study The Homogentity between Smoking Status & having Stroke With respect to hypertension*******;
proc sort data=ST;
  by hypertension;
run;
proc freq data=ST;
  by hypertension;
  tables smoking_status*stroke ;
  title3 ' Third Part:Table to Study The Association between Smoking Status & having Stroke with respect to Hypertension';
run;

********Tables to Study The Homogentity between Smoking Status & having Stroke With respect to heart disease*******;
proc sort data=ST;
  by heart_disease;
run;
proc freq data=ST;
by heart_disease;
   tables smoking_status*stroke  / missing out=heart_disease;
 title3 ' Third Part:Table to Study The Association between Smoking Status & having Stroke with respect to Heart disease';
run;
