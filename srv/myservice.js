module.exports = async(srv) => {
    srv.on('greetings', (req,res) => {
        return "Good Morning " + req.data.name;
    })    
}