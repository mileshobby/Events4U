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

### Tickets & Bookmarks

Both Bookmarks and Tickets are defined by a join table between users and events. When a user buys or bookmarks an event, a new row in the respective table is created. Upon mounting of the "my events" component,

### Search & AutoComplete

Users can also search for events. This is handled by a "search bar" component. Whenever the user inputs a new character, an API call is made to the rails back-end to fetch up to 5 matching event titles using the following injection-safe SQL query:  
````ruby
@event_titles = Event.where("LOWER(title) LIKE LOWER(:search_string) OR LOWER(full_description) LIKE LOWER(:search_string)",
search_string: "%#{params[:search_string]}%").limit(5).pluck(:title);)
````
Upon submission of the form, the component sends another API call to the rails back-end upon submission of a "search string".
The resulting events will then be rendered by the index jbuilder view and will replace all events in the "events" slice of state of the store. Finally, the user is routed to the browse events page, which displays all events in the store.

### Recommendations

This application utilizes collaborative filtering to suggest events to users. Collaborative filtering is a method of predicting what one user will like based upon a sampling of other similar users. The algorithm hinges on finding users who have been interested in the same events in the past, and assumes that these users will continue to be interested in the same events.

Similarity scores between two users are calculated using the formula for the Jaccard similarity coefficient:

![Formula for Jaccard Index ](http://res.cloudinary.com/events4u/image/upload/v1495823653/Screen_Shot_2017-05-26_at_11.31.26_AM_biuoad.png)

Where A is the set of all events UserA has either saved or purchased, and B is the set of all events UserB has either saved or purchased. This formula yields a similarity score between 0 and 1, with 1 being identical users and 0 being users with nothing in common.

Events are recommended based upon events that the most similar users have either purchased or saved that the the current user has neither purchased nor saved.

As a user purchases or saves new events (and other others purchase/saved new events), the recommendation engine will make new recommendations based upon these changes.

### Google Maps Integration

This application relies on Google Maps to render the location of each event on a map. Users are required to input a full address upon creation of an event. A call to Google's Geolocation API retrieves the latitude and longitude associated with that address, which is in turn used to make an additional call to pin a marker on the "map" React component. In the event detail page, the navigator web API is used to get the current user's location, and google map's direction services is sourced to render driving directions to the event.

![Event Detail Page Google Maps Integration](https://res.cloudinary.com/events4u/image/upload/v1495730502/Screen_Shot_2017-05-25_at_9.40.54_AM_hxjzxm.png)

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
