1. There is not much work being done in main.lua. The code that is there is from the demo template.
2. Most of the code is encapsulated in a function from other files so the actions being done in main are mainly function calls.
3. The code is reasonably easy to follow mainly because of the state pattern used, but comments can do most of the supplementary explaining.
4. If this were a larger project, I would put the logic for checking if a card is in an illegal spot in a function so the code called in update functions are encapsulated in helping functions.
5. The update is pattern is currenly being used to actively update the position of the card. The state pattern is also used because we are tracking if the card is idle, has a mouse over it, or is grabbed. If we were implementing a whole deck of cards, maybe the flyweight pattern could be used since there could be some overlap in data between all the cards, but some differences that also set them apart.

Card can be grabbed and dropped. Try to place card in top left of screen to simulate placing in an illegal position. If you try to drop a card in the top left, it should be returned to the position it was grabbed from.