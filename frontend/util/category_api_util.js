export const getAllCategories = () => (
  $.ajax({
  method: 'get', url: '/api/categories'
}));
