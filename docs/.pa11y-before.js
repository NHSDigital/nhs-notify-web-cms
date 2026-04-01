// Remove PDF links before accessibility testing
document.querySelectorAll('a[href$=".pdf"]').forEach(function(link) {
  link.remove();
});
