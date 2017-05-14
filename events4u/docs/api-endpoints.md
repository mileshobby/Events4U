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
  GET /api/events/:id
  DELETE /api/events/:id
  PATCH /api/events/update/:id

Tickets:
  POST /api/tickets
  GET /api/:eventId/tickets
  PATCH /api/tickets/:id (if time permits)
  DELETE /api/tickets (if time permits)
