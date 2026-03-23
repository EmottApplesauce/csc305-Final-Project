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
A/B Test Name: "NPS Prompt Timing: Post-Outfit Confirmation vs. Fixed Session Interval"
User Story Number: US6 – NPS User Interface
Metrics: Net Promoter Score (NPS), Quick 1-2 question survey response rate (Happiness)
Hypothesis:
The app currently prompts users for NPS feedback on a fixed time-based interval (e.g. every 30 days), regardless of what the user was just doing. This means the prompt often appears at a neutral or even inconvenient moment — like when a user is mid-browse — resulting in users dismissing it without responding, or submitting a rating that doesn't reflect a meaningful experience. The bottleneck isn't that users are unwilling to give feedback, it's that they're being asked at the wrong moment. We believe that if the NPS prompt is triggered immediately after a user taps "Mark as Worn" — the clearest signal that they completed a satisfying end-to-end task — response rates and score accuracy will improve, because the user is at peak satisfaction having just successfully used the app's core feature, making them far more likely to engage with the prompt meaningfully.
Single variable changed: the timing/trigger of the NPS prompt (fixed interval vs. post "Mark as Worn" confirmation).
Experiment:
Using Firebase A/B Testing via Remote Config with parameter nps_trigger_mode set to "interval" (Control) or "post_worn" (Treatment). Eligible users are those who have been using the app for at least 7 days and have added ≥ 5 items, ensuring feedback comes from users with enough experience to rate meaningfully. Split is 50/50. Firebase Analytics will track: nps_prompt_shown, nps_prompt_dismissed, nps_rating_submitted (with rating_value and trigger_context), and nps_feedback_entered. Primary metric is nps_prompt response rate (submissions ÷ prompts shown). Secondary metric is distribution of scores submitted.
Variations:
Variant A (Control) – Fixed Interval Prompt:
NPS prompt appears as a modal after 30 days of app usage, regardless of what the user was doing.
Variant B (Treatment) – Post "Mark as Worn" Prompt:
NPS prompt appears immediately after the user taps "Mark as Worn," on the confirmation screen, while satisfaction is highest.
<img width="426" height="282" alt="image" src="https://github.com/user-attachments/assets/2daaaf85-f1b7-437c-8ef1-a84e7f2fac38" />
<img width="419" height="271" alt="image" src="https://github.com/user-attachments/assets/f7a27f33-64b3-4110-9ee9-6a2b7d87abe2" />

## Test 4
