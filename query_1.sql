select Contact.client_id
from Contact left outer join Dep on Contact.client_id = Dep.client
where Dep.client is null 
union all
select Dep.client
from Dep left outer join Contact on Dep.client = Contact.client_id
where Contact.client_id is null 
