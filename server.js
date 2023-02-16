const express = require('express');
const app = new express();
const port = 3000;
app.listen(port, ()=>{
    console.log(`
    Serving Application on port ${port}
    $$\\       $$\\             $$\\               $$\\           
    $$ |      \\__|            $$ |              \\__|          
    $$ |      $$\\  $$$$$$\\  $$$$$$\\    $$$$$$\\  $$\\  $$$$$$\\  
    $$ |      $$ | \\____$$\\ \\_$$  _|  $$  __$$\\ $$ |$$  __$$\\ 
    $$ |      $$ | $$$$$$$ |  $$ |    $$ |  \\__|$$ |$$ /  $$ |
    $$ |      $$ |$$  __$$ |  $$ |$$\\ $$ |      $$ |$$ |  $$ |
    $$$$$$$$\\ $$ |\\$$$$$$$ |  \\$$$$  |$$ |      $$ |\\$$$$$$  |
    \\________|\\__| \\_______|   \\____/ \\__|      \\__| \\______/ 
    A simple API - By Drew Karriker
    `)
})

app.get("/", (req, res) => {
    console.log("New Request was made at", Date.now());
    res.json(
        {
            "message": "Automate all the things!",
            "timestamp": Date.now()
        }
                
    )
})