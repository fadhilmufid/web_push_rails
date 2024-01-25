console.log("Hi This Is Service Worker");

self.addEventListener("push", (event) => {
  console.log("masuk notif");
  let title = (event.data && event.data.text()) || "Yay message";
  let body = "We Have Received a push message";
  let tag = "push-simple-demo-notification-tag";
  console.log(event);
  // Get the push message
  // Display a notification
  event.waitUntil(self.registration.showNotification(event.message));
});
