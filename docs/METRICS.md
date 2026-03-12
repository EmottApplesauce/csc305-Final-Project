NPS: Trigger a pop-up survey using a FlutterFlow "Bottom Sheet" or "Alert" after the user clicks "Mark as Worn." Store the 1-10 integer in a user_feedback collection in Firestore. (This is just an idea on how to implement it. Will need to be changed depending on how the NPS was implemented)

Adoption: Automatically tracked via Firebase Auth. We will count the number of new documents created in the users collection each day.

DAU: Tracked automatically by Firebase Analytics through the session_start and screen_view events triggered when the app is opened.

Retention: Measured in the Firebase Analytics Dashboard by comparing the cohort of users who signed up in Week 1 vs. those who logged a session_start in Week 2.

CTR (Golden Path): Create a custom Firebase event called outfit_worn_click. In FlutterFlow, add an "Analytics -> Log Event" action to the "Mark as Worn" button. Compare this count against total screen_view hits for the Outfit Suggestion page.

Custom Metric (Items Uploaded): We will query the clothing_items collection in Firestore. We'll calculate the total count of items divided by the number of active user_ids over the last 30 days.
