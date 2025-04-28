const express = require("express");
require("dotenv").config();
const bodyParser = require("body-parser");
const productRouter = require("./routes/product.router")
const userRouter = require("./routes/user.router")
const orderRouter = require("./routes/order.router")
const mongoose = require("./db/connection")
const app= express();
app.use(bodyParser.json());

app.use("/product",productRouter)
app.use("/user",userRouter)
app.use("/order", orderRouter)
app.use("/", (req,res)=>{
    res.status(200).send("Application is running")
})


app.use((req,res)=>{
    res.status(404).send(`<html>
    <head>
        <title>404</title>
    </head>
    <body>
        <h1>PAGE NOT FOUND</h1>
    </body>
</html>`)
 })

// Get port from environment variable, fallback to 8080 if not provided
const PORT = process.env.PORT || 8080;

// Create server with error handling
const server = app.listen(PORT, (err) => {
    if(err) {
        console.error("Error starting server:", err);
        process.exit(1); // Exit with error code
    }
    console.log(`Server listening on port ${PORT}`);
});

// Handle server errors
server.on('error', (error) => {
    if (error.code === 'EADDRINUSE') {
        console.error(`Port ${PORT} is already in use. Please try using a different port.`);
        console.error(`You can set a different port using the PORT environment variable.`);
    } else {
        console.error('Server error:', error);
    }
    process.exit(1);
});

// Handle process termination
process.on('SIGTERM', () => {
    console.log('SIGTERM received, shutting down gracefully');
    server.close(() => {
        console.log('Server closed');
    });
});