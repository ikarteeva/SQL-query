select * from 

((select dbo.Clients.Name, dbo.Clients.Inn, dbo.Bills.num,  dbo.Bills.BDate as Bdate, dbo.Bills.PayDate as PayDate, SUM(dbo.BillContent.Paid) as BillPay, SUM(dbo.BillContent.Cost) as BillSum
from dbo.Clients full outer join dbo.Bills on dbo.Clients.cID = dbo.Bills.cID
full outer join dbo.BillContent on dbo.Bills.bID = dbo.BillContent.bID
full outer join dbo.RetailPacks on dbo.BillContent.bcID = dbo.RetailPacks.bcID
where dbo.BillContent.bID in (Select dbo.BillContent.bID From dbo.RetailPacks join dbo.BillContent on dbo.RetailPacks.bcID = dbo.BillContent.bcId Where dbo.RetailPacks.UpTo > '2021.01.01' and dbo.BillContent.Product LIKE 'Контур-Экстерн')
group by dbo.Clients.Name, dbo.Clients.Inn, dbo.Bills.num, dbo.Bills.BDate, dbo.Bills.PayDate)
union 
(select
dbo.Clients.Name, dbo.Clients.Inn, dbo.Bills.num,  dbo.Bills.BDate as Bdate, dbo.Bills.PayDate as PayDate, SUM(dbo.BillContent.Paid) as BillPay, SUM(dbo.BillContent.Cost) as BillSum
from dbo.Clients full outer join dbo.Bills on dbo.Clients.cID = dbo.Bills.cID
full outer join dbo.BillContent on dbo.Bills.bID = dbo.BillContent.bID
full outer join dbo.RetailPacks on dbo.BillContent.bcID = dbo.RetailPacks.bcID
where dbo.Clients.cID not in (Select dbo.Clients.cID From dbo.RetailPacks join dbo.BillContent on dbo.RetailPacks.bcID = dbo.BillContent.bcId join dbo.Bills on dbo.BillContent.bID = dbo.Bills.bID join dbo.Clients on dbo.Bills.cID = dbo.Clients.cID Where dbo.RetailPacks.UpTo > '2021.01.01')
and dbo.Bills.num in (select dbo.Bills.num from dbo.Bills join dbo.BillContent on dbo.Bills.bID = dbo.BillContent.bID where dbo.BillContent.Product LIKE 'Контур-Экстерн')
and dbo.Bills.PayDate >= (select max(dbo.Bills.PayDate)
from dbo.Clients full outer join dbo.Bills on dbo.Clients.cID = dbo.Bills.cID
full outer join dbo.BillContent on dbo.Bills.bID = dbo.BillContent.bID
full outer join dbo.RetailPacks on dbo.BillContent.bcID = dbo.RetailPacks.bcID
where dbo.Clients.cID not in (Select dbo.Clients.cID From dbo.RetailPacks join dbo.BillContent on dbo.RetailPacks.bcID = dbo.BillContent.bcId join dbo.Bills on dbo.BillContent.bID = dbo.Bills.bID join dbo.Clients on dbo.Bills.cID = dbo.Clients.cID Where dbo.RetailPacks.UpTo > '2021.01.01')
and dbo.BillContent.Product LIKE '%К%')
group by dbo.Clients.Name, dbo.Clients.Inn, dbo.Bills.num, dbo.Bills.BDate, dbo.Bills.PayDate)) as c
order by c.Name ASC

