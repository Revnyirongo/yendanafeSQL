/*Using Contact View Metada to Calculate all households muted/unmuted*/
SELECT ch.parent_parent_parent_name, count(distinct(x.contact_uuid)) FROM public.contactview_metadata x join chw_hierarchy ch
on x.parent_uuid = ch.parent_uuid WHERE x.contact_type IN ('household')
group by ch.parent_parent_parent_name

/*
Chifunga	894
Dambe	3044
Neno DHO	5109
*/

/*Using Contact View Metada to Calculate all households exclusive of muted*/
SELECT ch.parent_parent_parent_name, count(distinct(x.contact_uuid)) FROM public.temp_contactview_metadata x join temp_chw_hierarchy ch
on x.parent_uuid = ch.parent_uuid WHERE x.contact_type IN ('household') and x.muted is null 
group by ch.parent_parent_parent_name

/*
Chifunga	886
Dambe	        2875
Neno DHO	4522
*/

/*Time Bound; Using Contact View Metada to Calculate all households exclusive of muted*/
SELECT ch.parent_parent_parent_name, count(distinct(x.contact_uuid)) FROM public.temp_contactview_metadata x join chw_hierarchy ch
on x.parent_uuid = ch.parent_uuid WHERE x.contact_type IN ('household') and x.reported <= '2021-12-31' and (x.muted isnull or x.muted >= '2021-12-31')
group by ch.parent_parent_parent_name
