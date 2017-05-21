export const getEvent = (id) => {
  const eventId = parseInt(id);
  return $.ajax({
    method: "get",
    url: `/api/events/${eventId}`
  });
};

export const getEvents = () => {
  return $.ajax({
    method: "get",
    url: `/api/events`
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
