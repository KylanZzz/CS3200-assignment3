-- Directions: Define an insightful query on your own that involves at least three tables

-- This query finds the top 5 customer who have the most songs purchased

SELECT customers.*
FROM tracks
JOIN invoice_items ON tracks.TrackId = invoice_items.TrackId
JOIN invoices ON invoice_items.InvoiceId = invoices.InvoiceId
JOIN customers ON customers.CustomerId = invoices.CustomerId
GROUP BY customers.CustomerId
ORDER BY COUNT(*) DESC
LIMIT 5;