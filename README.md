# ToDOList
To Do List is a most popular app.
This app allows user to add items in a list that he/she wants to do. 


![AddViewController](https://github.com/mirhadiali/ToDOList/blob/master/ScreenShots/AddViewController.png)
![EditPopup](https://github.com/mirhadiali/ToDOList/blob/master/ScreenShots/EditPopup.png)
![ListViewController](https://github.com/mirhadiali/ToDOList/blob/master/ScreenShots/ListViewController.png)


## Implementation

The app has two view controller scenes:

- **ListItemsViewController** - has a list of items to do. Contains two buttons in a Navigation Bar, one is **Add** which is on the left side of the navigation bar, this button will take you to **AddItemsViewController** and the other button is **Edit** which allows user to drag the rows and also delete it. This Controller has the function to slide a row and you will have two button appeared one is for editing the text in a row and other one for delete it. This controller also allows user to mark the items that have been done.

- **AddItemsViewController** - allows the user to add text in a list. When user press the **Add** button right below the text field it will add the text written in the text field to list by passing it through delegation.
