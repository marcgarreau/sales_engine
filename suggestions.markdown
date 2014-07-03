Current:
 Almost done with the relationships code

Issues:
√ mentor helped out, but don't necessarily understand
√ failing tests -- we found the problem

 "Separate parsing / data loading logic from business logic"
   Finder behaviour is useful, but coupled to CSV persistence
   Consider handing it an array of Customers

Data integrity notes:
 Normalize incoming data before saving it in the model

Date Notes:
 require 'date'
 Date.parse '2012-03-27 14:54:09 UTC'
 # => #<Date: 2012-03-27 ((2456014j,0s,0n),+0s,2299161j)>

 # if the time isn't right, look into strptime

When implementing Business Intelligence
 It *may* (though not necessarily)
 be useful to put Enumerable module onto your repository
