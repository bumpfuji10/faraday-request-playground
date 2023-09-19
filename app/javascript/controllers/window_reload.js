document.addEventListener("DOMContentLoaded", function() {
  const reloadButton = document.getElementById("reload-button");

  if (reloadButton) {
    reloadButton.addEventListener("click", function() {
      location.reload();
    });
  }
});
