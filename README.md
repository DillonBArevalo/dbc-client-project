# README

Movie Review Website
see heroku link: dbc-client-rated.herokuapp.com

Features missing in MVP:

Potential Improvements:
- you cannot rate your own content? (currently can)

Stretch feature:
- Trusted reviewer can delete other users' comments and ratings

Fixed Issues:
- reviews show could link to itself with either "view full review" if on the film or actor page, but to the title of the reviewable otherwise (can do this with passing @review_object = true where you just want the "view full review" link)
- validations for comments so people can't create an empty comment
- link to reviewed object in review
- No actor show page
- User can't delete own film comments
- Rating needs to be rounded down
- Rating needs to be validated to be an integer
- No validations to prevent user from making a rating over 5
- When unregistered users visit unauthorized pages server will give errors



Example account for anyone wanting to try the thing out:
 first name: example
 last name: account
 email: example@account.com
 password: password

 Trusted Rater: true
