

index = (req, res)=>{
    res.send("Users index")
}

create = (req, res)=>{
    res.send("Create User")
}


module.exports = {
    index,
    create
}