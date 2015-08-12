counter = 0

date = new Date 1901 0 1
while date.get-full-year! < 2001, date.set-month date.get-month! + 1
    counter++ if date.get-day! is 0

console.log counter
