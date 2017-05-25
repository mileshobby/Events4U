# Events4u

#### [Events4u live](https://events4u.herokuapp.com "Events4U Homepage")

Events4u is a full-stack web application inspired by EventBrite. It utilizes Ruby on Rails on the backend, a PostgreSQL database, and React.js with a Redux architectural framework on the frontend.

The event allows users to create events, browse events, and "buy" tickets for an event (actual transaction was not implemented).

## Features & Implementation

### Events Overview

Events are stored in the database with their id, title, address, date, description, price, host_id and image url. The host_id is a foreign key pointing to the user who created the event. Images are stored using Cloudinary's image management service. If a user does not upload an image when creating an event, a default image will be attributed to that event at the Model level on the back-end, before saving to the database. Event prices are allowed to be unspecified, in which case the event is assumed to be free.

### Event Categories & Filtering

Events are related to different Categories via a join table in the database: EventCategories. Categories are a simple table with columns for only id and name. This is a many-to-many relation, as an event can have many categories and a category can have many events.

On the browse events page of the application, users can filter events by category. On the front-end, a "filter" component listens for selection of a category in its list. When a category is clicked, a change in the route triggers an API call to a controller action, which fetches all of events associated with the particular category clicked on.

![Browse Events Page](http://res.cloudinary.com/events4u/image/upload/v1495660853/BrowseByTopCategory_dvzaxu.png)

The above image depicts images which allow users to view events filtered by their categories.

### Tickets && Bookmarks

Both Bookmarks and Tickets are defined by a join table between users and events. When a user buys or bookmarks an event, a new row in the respective table is created. Upon mounting of the "my events" component,

### Search

Users can also search for events. This is handled by a "search bar" component, which sends an API call to the rails back-end upon submission of a "search string". A SQL query is then performed as follows:
````ruby
@events = Event.where("title LIKE ? OR full_description LIKE ?",
          "%#{params[:search_string]}%", "%#{params[:search_string]}%")
````
The question marks replace pure strings to protect against SQL injection attacks. This query will return all events whose title or description contain the search fragment. The resulting events will then be rendered by the index jbuilder view and will replace all events in the "events" slice of state of the store. Finally, the user is routed to the browse events page, which displays all events in the store.


### Google Maps Integration

This application relies on Google Maps to render the location of each event on a map. Users are required to input a full address upon creation of an event. A call to Google's Geolocation API retrieves the latitude and longitude associated with that address, which is in turn used to make an additional call to pin a marker on the "map" React component. In the event detail page, the navigator web API is used to get the current user's location, and google map's direction services is sourced to render driving directions to the event.

![Event Detail Page Google Maps Integration](http://res.cloudinary.com/events4u/image/upload/v1495662320/Screen_Shot_2017-05-24_at_2.36.56_PM_i7tgvp.png)

Google maps was integrated into both the event browse page and the event detail page (shown above). Figaro was used to hide the API keys on Github.


## Future Directions

Next steps for Events4u the following:

### Database Population

In order to provide a true search/browsing experience, it would be necessary to add a lot more data to the database. Perhaps sourcing this job to an external API (perhaps event EventBrite's API) would make sense.

### Tags

While currently, events are tagged with categories, it would make sense to allow for other tags as well. This would enhance search capabilities for users.

### Calendar

I would also like to add a calendar page in order to view events by date, for both their own events and for all events.

### Cross-Browser/Mobile Compatibility

This web application was developed in about a week, and due to these constraints was mainly built for use on laptop's using Chrome. With more time, I would like to optimize the app for viewing on mobile devices or other browsers, like Safari and Firefox.
