select *
from Dep 
where status like "active" and currency like "EUR" and balance > 10000
union
select *
from Dep
where status like "active" and currency like "USD" and balance > 11000
