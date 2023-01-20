# Albums = resource

## List all albums

Request:
GET /albums

Response (200 OK):
A list of albums

## Find a specific album

Request:
Get /albums/:id

Responce (200 OK):
A specific album

## Create a new album

Request:
POST /albums

With body parameters:
    title="OK computer"
    release_year="1997"
    artist_id="5"

Response (200 OK):
No content, just creates the new resource (the new album)
