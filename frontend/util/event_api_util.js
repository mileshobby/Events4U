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
