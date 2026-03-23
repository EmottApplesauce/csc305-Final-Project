HEART Framework:
https://docs.google.com/presentation/d/1-5KJS9UNjniJZSqdNJ4tfLQPDK0LUkRHnq2ktM1zUwY/edit?slide=id.gc8216bd24_20_0#slide=id.gc8216bd24_20_0

- NPS: Trigger a pop-up survey using a FlutterFlow "Bottom Sheet" or "Alert" after the user clicks "Mark as Worn." Store the 1-10 integer in a user_feedback collection in Firestore. (This is just an idea on how to implement it. Will need to be changed depending on how the NPS was implemented)

- NPS Gerald: I'm planning to enable the firebase option for pop survey using flutterflow bottom sheet, currently we would want the user to add clothes and when the user adds certain amount of clothes we will Store the 1-10 integer in a user_feedback collection in Firestore. (This is just an idea on how to implement it. Will need to be changed depending on how the NPS was implemented)

- Adoption: Automatically tracked via Firebase Auth. We will count the number of new documents created in the users collection each day.
- Adoption Gerald: I will enable the option ofr Firebase authenticaiton make a seprate json file fo the user collection each day

- DAU: Tracked automatically by Firebase Analytics through the session_start and screen_view events triggered when the app is opened.
- DAU Ethan: I will be using firbase analytics and see the exact execution flow to allow the option metrics

- Retention: Measured in the Firebase Analytics Dashboard by comparing the number of users who signed up in Week 1 vs. those who logged a session_start in Week 2.
- Rentention Gerald:  Various team mates are going compare week 1 vs people who logged in the follwoign weeks
  
- CTR (Golden Path): Create a custom Firebase event called closet page. In FlutterFlow, add an "Analytics -> Log Event" action to the add clothes  button. Compare this count against total screen_view hits Outfit view page. This can be a way to measure how many users are using this function.

- CTR(Golden Path) : we in complete the golden path that the user can upload there clothes inside the application the next step is to move the front clost to a closet page so that the user can look at all the clothes compiled

- Custom Metric (Items Uploaded) Gerald: We can query the clothing_items collection (clothes uploaded to wardrobe) in Firestore. We'll calculate the total count of items for each user to track usage.

- Custom Metric(Items uploades GeralD; I will give my team mates perms for the query the clothing_items collection (clothes uploaded to wardrobe) in Firestore. We'll calculate the total count of items for each user to track usage. so that we can count how much clothes does each user uploaded
