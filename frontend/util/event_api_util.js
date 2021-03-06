export const getEvent = (id) => {
  const eventId = parseInt(id);
  return $.ajax({
    method: "get",
    url: `/api/events/${eventId}`
  });
};

export const getEvents = (offset) => {
  offset = offset || 0;
  return $.ajax({
    method: "get",
    url: `/api/events`,
    data: {offset}
  });
};

export const createEvent = (event) => {
  return $.ajax({
    method: "post",
    url: `/api/events`,
    data: { event }
  });
};

export const deleteEvent = (id) => {
  const eventId = parseInt(id);
  return $.ajax({
    method: "delete",
    url: `/api/events/${eventId}`,
  });
};

export const updateEvent = (event) => {
  return $.ajax({
    method: "patch",
    url: `/api/events/${event.id}`,
    data: {event}
  });
};

//data will come in the form {category_ids: [1,2,5], price: 50, ...}
export const getFilteredEvents = (filters) => {
  return $.ajax({
    method: 'get',
    url: '/api/events-filtered',
    data: filters
  });
};

export const getBookmarkedEvents = () => {
  return $.ajax({
    method: 'get',
    url: '/api/events-bookmarked',
  });
};

export const getHostedEvents = () => {
  return $.ajax({
    method: 'get',
    url: '/api/events-hosted',
  });
};
export const getPurchasedEvents = () => {
  return $.ajax({
    method: 'get',
    url: '/api/events-purchased',
  });
};

export const searchEvents = (search_string) => {
  return $.ajax({
    method: 'get',
    url:'/api/events-search',
    data: {search_string}
  });
};

export const getRecommendedEvents = () => {
  return $.ajax({
    method: 'get',
    url:'/api/events-recommended',
  });
};

export const getAutoCompleteResults = (search_string) => {
  return $.ajax({
    method: 'get',
    url:'/api/events-autocomplete',
    data: {search_string}
  });
};
