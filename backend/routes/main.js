
index = (req, res)=>{
    res.status(200)
    res.json({
        "message": "success"
    })
}

module.exports = {
    index
}