// // This is where it all goes :)

const form = document.getElementById("rssForm")

form.addEventListener("submit", function(event) {
  event.preventDefault(); // Prevent the form from submitting normally

  // Get the form data
  const url = document.getElementById("url").value;

  fetch(`https://api.airtable.com/v0/${form.dataset.base}/${form.dataset.table}`, {
    method: "POST",
    headers: {
      "Authorization": "Bearer " + `${form.dataset.key}`,
      "Content-Type": "application/json"
    },
    body: JSON.stringify({
      "records": [
        {
          "fields": {
            "url": url
          }
        }
      ]
    })
  })
  .then(function(response) {
    // Handle the response
    if (response.ok) {
      // Success
      console.log("POST request succeeded");
      console.log(response);
      form.insertAdjacentHTML("afterend", `<li>${url}</li>`);
      form.reset();
    } else {
      // Error
      console.error("POST request failed");
    }
  })
  .catch(function(error) {
    console.error("An error occurred:", error);
  });
});
