// menu_response.js

document.addEventListener("turbo:load", () => {
  const dinnerCheckbox = document.getElementById("menu_response_dinner");
  const chapatiDiv = document.getElementById("chapati-count-div");

  if (!dinnerCheckbox || !chapatiDiv) return;

  function toggleChapatiCount() {
    if (dinnerCheckbox.checked) {
      chapatiDiv.style.display = "block";
    } else {
      chapatiDiv.style.display = "none";
    }
  }

  // Initialize on page load
  toggleChapatiCount();

  // Listen for changes
  dinnerCheckbox.addEventListener("change", toggleChapatiCount);
});
