export const createBookmark = (event_id) => {
  return $.ajax({
    method: 'post',
    url: '/api/bookmarks',
    data: {event_id: event_id}
  });
};

export const deleteBookmark = (event_id) => {
  return $.ajax({
    method: 'delete',
    url: `/api/bookmarks/${event_id}`
  });
};
