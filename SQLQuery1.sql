

--a.	Display a list of all property names and their property id’s for Owner Id: 1426. 



select a.id, a.Name from dbo.Property a, dbo.OwnerProperty b where b.OwnerId='1426' and b.Id=a.Id



--b.	Display the current home value for each property in question a). 



select a.id, a.Name ,c.CurrentHomeValue from dbo.Property a, dbo.OwnerProperty b, dbo.PropertyFinance c where b.OwnerId='1426' and b.Id=a.Id and b.id = c.id

c.	For each property in question a), return the following:                                                                      
i.	Using rental payment amount, rental payment frequency, tenant start date and tenant end date to write a query that returns the sum of all payments from start date to end date.


select a.id, a.Name,SUM(c.PaymentAmount) Total_Amount from dbo.Property a, dbo.OwnerProperty b ,dbo.TenantProperty c where b.OwnerId='1426' and b.Id=a.Id and b.PropertyId=c.PropertyId 
and (b.UpdatedOn between c.StartDate and c.EndDate)
Group By a.Id,a.Name,c.PaymentAmount  


ii.	Display the yield. 


select a.id, a.Name ,c.CurrentHomeValue,c.Yield from dbo.Property a, dbo.OwnerProperty b, dbo.PropertyFinance c where b.OwnerId='1426' and b.Id=a.Id and b.id = c.id



d.	Display all the jobs available

select * from dbo.Role

e.	Display all property names, current tenants first and last names and rental payments per week/ fortnight/month for the properties in question a). 

select a.ID ,a.Name PropertyName ,d.FirstName,d.LastName ,c.Code from  dbo.Property a, dbo.OwnerProperty b, dbo.TenantPaymentFrequencies c, dbo.Person d  
where b.OwnerId='1426' 
and b.Id=a.Id and a.TargetRentTypeId=c.Id and b.Id=d.Id

2.

			
Select a.Description as Expense ,b.Amount,CONVERT(varchar,b.date,106) as Date
 from dbo.Property a,dbo.PropertyExpense b Where a.Name='ABDC'
