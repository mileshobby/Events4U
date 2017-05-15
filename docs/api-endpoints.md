HTML API

Root:
  GET / - loads React web app

JSON API

Users:
  POST /api/users
  PATCH /api/users
  GET /api/users/:id/tickets
  GET /api/users/:id/events
  POST /users/:id/tickets
  POST /users/:id/bookmarks
  DELETE /users/:id/bookmarks

Session:
  POST /api/session
  DELETE /api/session

Events:
  POST /api/events
  GET /api/events
  GET /api/events/filtered
    //Not Totally sure how to implement filtering API on back end***
    //Possibly takes tag_names in query params? Maybe merge this end
    //point with normal api/events GET**
  GET /api/events/:id
  DELETE /api/events/:id
  PATCH /api/events/:id
  POST /api/events/:id/


Category:
  POST /api/categories
  GET /api/categories

Tickets:
  POST /api/tickets
  GET /api/:userId/tickets

Bookmarks:
  POST /api/bookmarks
  GET /api/:userId/bookmarks
  DELETE /api/:userId/bookmarks
