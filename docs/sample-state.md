{
  currentUser: {
    id: 1,
    username: "miles-hobby"
  },
  errors: {
    signUp: [],
    logIn: [],
    createEvent: []
  },
  eventsByCategory: {
    sports:{
      1: {
        title: "NBA Finals Game 7",
        image_url: "stephCurry.jpg", **in assets**
        date: "June 11, 2018",
        venue: "Oracle Arena"
        id: 1
      },
    2: {...}
    }
    music: {...}
  },
  eventDetails: {
    {
      title: "NBA Finals Game 7",
      short_description: "Warriors vs. Cavs",
      full_description: "Watch as the Golden State Warriors..."
      image_url: "stephCurry.jpg" **in assets**
      date: "June 11, 2018"
      time: "7:00pm"
      host_id: 1,
      id: 1
      tags: {
        1: {
          id: 1
          name: "Sports"
        }
      },
      tickets [
              {id: 1, type: frontRow, price: $150, total_quantity: 50,
              quantity_left: 5},
              ...]
  },
  tagFilters: [1, 7, 14], //if time permits
  bookmarks: [ 1, 2, 5, ...],
  userTickets: [2, 4]
}
