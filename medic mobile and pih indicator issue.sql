/*Using Contact View Metada to Calculate all households muted/unmuted*/
SELECT ch.parent_parent_parent_name, count(distinct(x.contact_uuid)) FROM public.contactview_metadata x join chw_hierarchy ch
on x.parent_uuid = ch.parent_uuid WHERE x.contact_type IN ('household')
group by ch.parent_parent_parent_name

/*
Chifunga	894
Dambe	3044
Neno DHO	5109
*/
---------------------------------------------------------------------------------------------

/*Using Contact View Metada to Calculate all households exclusive of muted*/
SELECT ch.parent_parent_parent_name, count(distinct(x.contact_uuid)) FROM public.temp_contactview_metadata x join temp_chw_hierarchy ch
on x.parent_uuid = ch.parent_uuid WHERE x.contact_type IN ('household') and x.muted is null 
group by ch.parent_parent_parent_name

/*
Chifunga	886
Dambe	        2875
Neno DHO	4522
*/
--------------------------------------------------------------------------------------------

/*Number of CHW Per Facility */
select ch.parent_parent_parent_name,count(distinct(ch."name")) 
FROM temp_chw_hierarchy ch group by ch.parent_parent_parent_name 

/*
Chifunga	86
Dambe	        89
Neno DHO	131
Null	        48
*/

/* Birth location by use of Delivery form*/

/* Forms Submitted in the FormView Report specifically looking at the under 5 screening show that there are some negative ages*/
