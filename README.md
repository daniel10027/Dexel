# Dexel

Send Data From Flutetr App To Exel Sheet 

## Getting Started

# Configuration 

### 1- Connect to Google Sheet  (Make sur that the used email is a gmail.copm email )

### 2- Create a Blank Sheet with Column name ( In our case we have four field (nom, email, contact, feedback))

### 3- Above your sheet click on Extension > Apps Script

### 4- Get Your Sheet id
In the url of your Sheet we have : https://docs.google.com/spreadsheets/d/YOUR_SHEET_ID_HERE/edit#gid=0

### 5- Paste the code Below

```
function doGet(request) {
   var sheet = SpreadsheetApp.openById('____YOUR_SHEET_ID_HERE___');
  var result = {'status':"SUCCESS"};
  try{
    var nom = request.parameter.nom;
    var email = request.parameter.email;
    var contact = request.parameter.contact;
    var feedback = request.parameter.feedback;

    var rowData = sheet.appendRow([nom, email, contact, feedback])

  }catch(exc){

    result = {'status':"FAILED", "message":exc};
  
  }
  return ContentService
    .createTextOutput(JSON.stringify(result))
    .setMimeType(ContentService.MimeType.JSON);
}

```
### 6 - Load doGet() function

 - Above the editor click on Run 
 - Allow acces to the App
 
### 7 - Deploy your Sheet Apps Code

- On the Right_Top of the App Script Editor click on Deploy > New Deployment 
- Give Deploy Name 
- Select Web App type and deploy
- Allow all acces to anyone that have the link
- Copy the deployment url and paste it in lib > models > controller.dart in URL section

### 8 - Make Your Flutter Run and Enjoy

# Dexel
