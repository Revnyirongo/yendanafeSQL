/*Time Bound; Using Contact View Metada to Calculate all household visit of muted*/
SELECT tch.parent_parent_parent_name,count(distinct(x.parent_uuid)) FROM public.temp_formview_reported x join temp_chw_hierarchy tch on 
x.reported_by = tch.uuid where x.reported between '2021-12-01' and '2021-12-31'
group by tch.parent_parent_parent_name 
