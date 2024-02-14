-- Directions: Write a query that lists all the customers that listen to longer-than-average tracks, excluding the tracks that are longer than 15 minutes. 

-- (Below are some minor assumptions made as the directions are slightly open to interpretation): 
-- This query calculates the average track duration excluding tracks longer than 15 minutes
-- AND returns all customers who listen to tracks longer than average, BUT no longer than 15 minutes
	-- NOTE: This query will return customers who have listened to ANY track longer than the average but less than 15 minutes in length.

SELECT DISTINCT customers.*
FROM invoice_items 
JOIN invoices ON invoice_items.InvoiceId = invoices.InvoiceId
JOIN customers ON customers.CustomerId = invoices.CustomerId
JOIN tracks ON tracks.TrackId = invoice_items.TrackId
WHERE tracks.Milliseconds > (
	SELECT AVG(tracks.Milliseconds) FROM tracks 
	WHERE tracks.Milliseconds < (1000 * 60 * 15)
) AND tracks.Milliseconds < (1000 * 60 * 15)
ORDER BY customers.CustomerId;
