select v.client, v.balance
from(select  Contact.client, balance*79 as balance, currency
from Contact left join Dep on Contact.client_id = Dep.client
where currency like "USD"
group by Contact.client
union all
select  Contact.client, balance*87, currency
from Contact left join Dep on Contact.client_id = Dep.client
where currency like "EUR"
group by Contact.client
union all
select  Contact.client, balance, currency
from Contact left join Dep on Contact.client_id = Dep.client
where currency like "RUR"
group by Contact.client
union all
select  Contact.client, balance*106, currency
from Contact left join Dep on Contact.client_id = Dep.client
where currency like "GBP"
group by Contact.client) as v
group by v.client
