title Create Express Folder Structure with React CRA Template
@echo off

set /p name=Folder Name: 
echo Creating Folders
mkdir %name%
cd %name%
echo ------------------------------------------
echo Creating Sub-folders
mkdir routes\api models config middleware
echo ------------------------------------------
echo Running Npm init
call npm init
echo ------------------------------------------
echo Install node modules required
call npm install express mongoose path
call npm install nodemon --save-dev
echo ------------------------------------------
echo Creating Sub-files
echo.
echo config
set /p mongoDB=Enter Mongo Database Name:
(
echo module.exports={
echo     mongoURI ^: "mongodb://localhost:27017/%mongoDB%"
echo };
)>config\config.js
echo.
echo Routes
set /p route1=Enter a Route Name : 
(
echo const express = require('express'^);
echo const router = express.Router(^);
echo.
echo // Method         : 
echo // Header         : 
echo // Params         : 
echo // Body           :
echo // Validation     : 
echo // Return         : 
echo // Description    :
echo router.get('/',(req,res^)=^>{
echo     res.send("DONE"^);
echo }^);
echo.
echo module.exports = router;
) > routes\api\"%route1%.js"
echo.
echo models
set /p model=Enter a model Name:
(
echo const mongoose = require('mongoose'^);
echo.
echo const %model%Schema = mongoose.Schema({
echo.
echo.
echo.
echo }^);
echo.
echo module.exports = %model% = mongoose.model('%model%',%model%Schema^);
) > models\"%model%.js"
echo.
echo Index.js
(
echo const express = require('express'^);
echo const app = express(^);
echo const mongoose = require('mongoose'^);
echo const path = require('path'^);
echo.
echo //Body-Parser Middleware
echo app.use(express.json(^)^);
echo.
echo //Routes
echo const %route1% = require("./routes/api/%route1%"^);
echo app.use("/api/%route1%",%route1%^);
echo.
echo //Connecting the MongoDB
echo //MongoURI
echo const MongoURI = require('./config/config.js'^).mongoURI;
echo mongoose.connect(MongoURI,{ useNewUrlParser: true, useUnifiedTopology: true, useFindAndModify: false }^)
echo     .then((^)=^>console.log("MongoDB Connected"^)^)
echo     .catch((err^)=^>console.log("Mongo Connection Error:",err^)^);
echo.
echo //Server All Non-API requests the Index.html File in the Build Directory
echo //This is used when deploying the server
echo app.use("*",(req,res^)=^>{
echo     res.sendFile(path.join(__dirname,'client/build','index.html'^)^);
echo }^);
echo.
echo //Starting the Server
echo const PORT = process.env.PORT ^|^| 5000;
echo.
echo app.listen(PORT,(^)=^>console.log(`Server is listening at ${PORT}`^)^);
) > index.js
echo.
echo ------------------------------------------
echo React Front End With CRA template
call create-react-app client
echo.
echo ------------------------------------------
cd client
echo Install Required Node Modules
call npm install react-router-dom axios sweetalert2 
echo ------------------------------------------
echo Do the Following
echo proxy:"http://localhost:5000
echo to client package.json file
echo ------------------------------------------
echo "start":"node index.js",
echo "dev":"nodemon index.js",
echo to Main package.json file scripts
pause
