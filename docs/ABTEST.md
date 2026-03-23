# A/B Test Designs

## Test 1
William - A/B Test Name: "Day 1 Ads vs. Day 7 Ads"
Hypothesis:
What problem are we trying to solve? New users who see ads immediately on Day 1 may feel the app is cluttered or untrustworthy before they've experienced its core value, causing them to drop off before becoming habitual users. The bottleneck is early retention — if users churn in the first week, they never reach the point where monetization is even possible.
Impact: This is a high-stakes problem. If early ad exposure is killing retention, you're essentially trading long-term DAU (and future revenue from affiliates + premium upgrades) for short-term ad revenue that barely pays out at small user scales. For a new app targeting busy 18–35 year olds with low patience for friction, first impressions matter enormously.
The specific bottleneck: Day 1 → Day 7 retention drop-off. This is where most consumer apps lose the majority of their users, and ads are a known friction point during that window.
Hypothesis statement: If we delay showing ads until Day 7 (after users have experienced the AI outfit builder and laundry tracking), then Day 7 retention will increase, because users will have already built a habit and attached value to the app before being exposed to ads — making them more tolerant of them.
What we're watching: Day 7 retention rate.

## Test 2
James - A/B Test Name: "AI Auto-Categorization vs. Manual Categorization During Wardrobe Setup"
User Story Number: US5: User Take picture of clothes or storing there clothes
Metrics: Adoption (Signups), DAU / Retention, Total items uploaded by users
Hypothesis:
During wardrobe setup, users are required to manually categorize each clothing item after uploading a photo. This creates a bottleneck not in the number of items being added, but in the time and accuracy of the categorization step itself — users either spend too long deciding the right category, or assign the wrong one entirely, leading to a poorly organized wardrobe that undermines the quality of AI outfit suggestions down the line. We believe that if AI automatically categorizes clothing items from a photo and the user simply confirms, wardrobe setup will be completed faster and with greater categorization accuracy — because replacing active decision-making with a quick confirmation step removes the primary source of inefficiency in the flow, while still keeping the user in control of their data.
whether clothing categorization is performed manually by the user or automatically suggested by AI.
Experiment:
Using Firebase A/B Testing via Remote Config with parameter onboarding_upload_mode set to "manual" (Control) or "bulk" (Treatment). 100% of new users are eligible since this targets the adoption funnel and poses no risk to existing users. Split is 50/50. Firebase Analytics will track: onboarding_started, item_added (with item_count_total), onboarding_completed (≥5 items), onboarding_abandoned (with last_item_count), and first_outfit_generated. Primary metric is onboarding completion rate. Target ~x users per variant over 2–3 weeks.
Variations:
Variant A (Control) – Manual One-by-One Entry:
Users add items individually — photograph → categorize → save → repeat. Progress bar shows 1/5, 2/5, etc.
Variant B (Treatment) – Bulk Upload + AI Auto-Categorization:
Users select multiple photos at once from their camera roll. AI detects and categorizes each garment automatically. User reviews and confirms in one step.
<img width="427" height="283" alt="image" src="https://github.com/user-attachments/assets/33bc61c9-0731-4912-a4e1-a1089271ef0b" />
<img width="426" height="255" alt="image" src="https://github.com/user-attachments/assets/9db4cec6-5475-4cad-99ba-15371b166c2b" />

## Test 3

Ethan - A/B Test Name: "App Rating Pop-Up Timing: After 5 Clothing Items Added vs. After First Outfit Created".
User Story Number: US6: NPS UI.
Metrics: Rating received (score), pop-up response rate (rated vs. dismissed), and average star rating per variant. Hypothesis: We believe that prompting users to rate the app at different moments in their journey will yield different engagement levels with the rating prompt — showing the pop-up after a user adds 5 pieces of clothing vs. after they create their first outfit may reflect different levels of satisfaction and investment in the app, one being a setup milestone and the other being a value-realization moment. Success is measured by which timing produces a higher average rating, indicating the more optimal moment to request feedback. Experiment: Using Firebase A/B Testing via Remote Config with parameter rating_prompt_trigger set to "five_items" (Variant A) or "first_outfit" (Variant B), with a 50/50 split across 100% of new users. Firebase Analytics will track rating_prompt_shown, rating_submitted (with star value), and rating_dismissed, with average rating score as the primary metric, run over 2–3 weeks or until statistical significance is reached.
Variations: Variant A (Control) shows the rating pop-up once the user uploads their 5th clothing item; Variant B (Treatment) shows it immediately after the user generates or saves their first outfit.

<img width="522" height="557" alt="image" src="https://github.com/user-attachments/assets/c2687a63-c1ac-4348-a87f-dc0386f77a76" />

## Test 4 (main test)
Gerald
A/B Test Name: "Weather Temperature Display: Hidden vs. Visible on Outfit Card"
User Story Number: US6 – NPS User Interface
Metrics: Net Promoter Score (NPS), quick 1–2 question survey response rate (Happiness)

Hypothesis:
The app currently displays weather conditions on outfit suggestion cards — icons for sun, clouds, rain — but omits the actual temperature reading. This means users are receiving outfit recommendations without the most concrete piece of weather data they rely on when getting dressed. A suggestion like "lightweight linen shirt" is harder to evaluate when you don't know if it's 58°F or 82°F outside. The bottleneck isn't that users distrust the suggestions — it's that they can't verify them against real conditions, so they disengage. We believe that displaying the current temperature directly on the outfit card will give users a concrete anchor to validate the recommendation against their own experience, making them more likely to adopt the outfit, confirm it as worn, and submit NPS feedback that reflects genuine satisfaction rather than indifference.

Single Variable Changed: Whether or not the current temperature reading is displayed inline on the outfit suggestion card. All other UI elements, logic, and copy remain identical across both variants.

Experiment:
Using Firebase A/B Testing via Remote Config with parameter weather_temp_display set to "hidden" (Control) or "visible" (Treatment). Eligible users are those who have been active for at least 7 days and have added ≥ 5 wardrobe items, ensuring feedback reflects users who have had meaningful experience with outfit suggestions. Split is 50/50. Firebase Analytics will track: outfit_card_viewed (with temp_displayed param), nps_rating_submitted (with rating_value and variant), outfit_worn_confirmed, and nps_prompt_dismissed. Primary metric is NPS score distribution across variants. Secondary metrics are survey response rate and outfit confirmation rate after card view.

Variations:
Variant A (Control) – No Temperature Shown:
The outfit card displays weather condition icons (e.g. ☁ Partly cloudy) without a numeric temperature. Suggestions are described with general attributes like "lightweight" or "layering recommended" but are not tied to a specific reading the user can cross-reference with their own perception of the day.
Variant B (Treatment) – Temperature Displayed:
The outfit card shows the current temperature inline with the weather icon (e.g. ☁ Partly cloudy · 72°F), pulled from the user's location at the time the card is viewed. The suggestion is grounded in a specific, verifiable data point the user can immediately relate to their lived experience, increasing confidence in and adoption of the recommendation. Sonnet 4.6














