# Artists = resource

## List all artists

Request:
GET /artists

Response (200 OK):
Pixies, ABBA, Taylor Swift, Nina Simone


## Create a new artist

Request:
POST /artists

With body parameters:
    name="Wild nothing"
    genre="Indie"

Response (200 OK):
No content, just creates the new resource (the new artist)

# Then subsequent request:
GET /artists

# Expected response (200 OK)
Pixies, ABBA, Taylor Swift, Nina Simone, Wild nothing
