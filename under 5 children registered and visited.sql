/*Number of children visited in the quarter*/
SELECT count(distinct(x.patient_id)) FROM public.temp_useview_under_5_screening x where x.reported between '2021-01-01' and '2021-03-31'

/*Number of children registered in the quarter*/
SELECT count(distinct(patient_id)) FROM public.temp_useview_under_5_screening x 
join contactview_metadata cm on x.patient_id = cm.uuid where cm.reported < '2021-03-31' 
and x.patient_date_of_birth between '2016-03-31' and '2021-03-31'