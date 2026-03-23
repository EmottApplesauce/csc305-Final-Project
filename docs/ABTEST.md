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

