# kcalculus

## Description
A cross-platform (`Android` and `iOS`) app that helps you to keep an eye on calorie intake.

## Project Goal
When it comes to loosing or gaining weight, probably the only foolproof approach is to control one's energy balance.
Which means tracking your calorie intake and expenditure. Now, we're not here to track your energy expenditure.
After all, there are a plethora of activity trackers out there and, chances are, you're already using one.
Instead, we're going to concentrate on making it easier to track what you eat on a daily basis.

### Who Is This For?
I believe the app would be useful for people who have total control over their meals.
So, primarily, for home cooks.

## Planned Functionality
 - **Core**
    - User can set a daily calorie intake goal in preferences.
    - User can set a daily macro-nutrients goal.
        - For example: the daily **calorie** (energy, not weight!) intake should consist of: 40% protein, 40% carbs and 20% fat.
        - Also, for fiber, a goal could be set in grams.
    - Logging simple *ingredients* (with nutrition facts) a user consumed during the day. Such as `apples`, `bananas`, `sausages`, etc.
        - The idea here is that an *ingredient* is easy to track cause it has it's nutrition facts readily available.
    - Creation and logging of complex *meals* that consist of multiple ingredients.
        - Knowing the *amounts* of its ingredients and the meal's weight after preparation, we can determine its nutrition facts, which simplifies the logging.
    - User should be able to create *templates* (kind of a *recipes* if you will) from meals.
        - If a user creates a meal from a template, then the ingredients are prefilled (but still modifiable).
    - The list of *known* (previously logged) meals and ingredients should be available with search during logging.
        - So a user don't need to enter nutrition facts again.
    - User can see the daily log with macro-nutrients stats and a reminder of total calories consumed compared to the daily intake goal.
    - Log history (previous days logs) is available (with a calendar?).
    - Calorie intake plot is available for the whole logging history.
        - Probably with presets like: `last week`, `last month`, `last year` and `all`.
    - Integration with food DB APIs.
        - User should be able to search for nutrition facts of simple ingredients, such as `apples`, `bananas`, `eggs`, etc.
    - \[OPTIONAL\] Sign up with account data sync over multiple devices.
 - **Advanced**
    - Sort of a *pantry*: keeping track of available food supply.
        - Increased with: meal creation, manual adding.
        - Decreased with: meal creation (less available ingredients), meal / ingredient logging.
    - Getting ingredient nutrition facts automatically using device camera and ML.
 - **Very Advanced**
    - Getting the list of grocery items bought from a receipt (straight into the *pantry*).
    - Voice control
        - While prepping a meal, it would be very useful to manage ingredients, set meal weight, etc with voice control.
    - Diet planning and shopping list:
        - Knowing what is available for the user (in the *pantry*), calorie intake / macro-nutrients goals and meal recipes it should be possible to generate a (somewhat optimal) meal plan with a shopping list (for a day, week, etc).
    - Pantry sharing
        - For a family to have a single *pantry*.

## Technologies
 - Overall: Flutter
 - State management: Riverpod
 - 3rd party API integration: http
 - Sign up / Sign in: Firebase Auth
 - Data sync: Firebase Firestore or Realtime DB
 - Platform-specific Integrations
    - Camera
        - ML solution: TensorFlow? Firebase?
    - Voice control
        - ML solution: Siri? Google Assistant? Gemini? ChatGPT?
