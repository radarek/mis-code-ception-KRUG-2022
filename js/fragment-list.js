Reveal.addEventListener("ready", function addFragmentToLists() {
  for (const listItem of document.querySelectorAll(".fragmented-list li")) {
    listItem.classList.add("fragment");
  }
});
