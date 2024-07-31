import connection from '../config/connectDB'

let addProduct = (req, res) => {
    let room = req.body;
    console.log(room);
    let sql = "INSERT INTO `room` SET ?";
    connection.query(sql, room, (err, results) => {
        if (!err) {
            return res.status(200).json({ message: "room added successfully"})
        } else {
            res.status(500).json(err)
        }
    })
}

let limitProduct = (req, res) => {
    let sql = "SELECT * FROM `room` order by id desc LIMIT 8";
    connection.query(sql, (err, results) => {
        if (!err) {
            return res.status(200).json(results)
        } else {
            res.status(500).json(err)
        }
    })
}

let getProduct = (req, res) => {
    let _name = req.query.name;
    let sql = "select * from `room`";
    if (_name) {
        sql += " WHERE name LIKE '%" + _name + "%'"
    }else{
        sql += " ORDER by id DESC"
    }

    connection.query(sql, (err, results) => {
        if (!err) {
            return res.status(200).json(results)
        } else {
            res.status(500).json(err)
        }
    })
}

let getOneProduct = (req, res)=>{
    let productId = req.params.id
    let sql = "select * from `room` where id  = ?";
    connection.query(sql, [productId], (err, results) => {
        if (!err) {
            return res.status(200).json(results)
        } else {
            res.status(500).json(err)
        }
    })
}

let getCountProduct = (req, res) => {
    let sql = "SELECT COUNT(id) FROM `room`";
    connection.query(sql, (err, results) => {
        if (!err) {
            return res.status(200).json(results)
        } else {
            res.status(500).json(err)
        }
    })
}

let searchProduct = (req, res)=>{
    let name = req.query.name;
    let sql = "select * from `room`  WHERE `name` LIKE '%" + name + "%'";
    connection.query(sql, (err, results) => {
        if (!err) {
            return res.status(200).json(results)
        } else {
            res.status(500).json(err)
        }
    })
}

let getByCategory = (req, res) => {
    let id = req.params.id;
    let sql = "select `id`, `name` from `room` where `categoryId` = ?";
    connection.query(sql, [id], (err, results) => {
        if (!err) {
            return res.status(200).json(results)
        }
        else {
            res.status(500).json(err)
        }
    })
}

let getById = (req, res) => {
    let id = req.params.id;
    let sql = "select `id`, `name`, `description`, `price` from `room` where id=?";
    connection.query(sql, [id], (err, results) => {
        if (!err) {
            return res.status(200).json(results[0])
        }
        else {
            return res.status(500).json(err)
        }
    })
}


let updateProduct = (req, res) => {
    let productId  = req.params.id
    let product = req.body;
    console.log(productId)
    let sql = "UPDATE `room` SET `name`=?,`price`=?,`code`=?,`image`=?,`category_id`=?,`status`=?,`description`=? WHERE id=?";
    connection.query(sql, [product.name, product.price, product.code, product.image, product.category_id, product.status, product.description, productId], (err, results) => {
        if (!err) {
            if (results.affectedRows == 0) {
                return res.status(404).json({ message: "room not found" })
            } else {
                return res.status(200).json({ message: "room updated successfully" })
            }
        }
        else {
            return res.status(500).json(err)
        }
    })
}

let updateStatus = (req, res) => {
    let user = req.body;
    let sql = "update `room` set `status` = ? where `id` = ?";
    connection.query(sql, [user.status, user.id], (err, results) => {
        if (!err) {
            if (results.affectedRows == 0) {
                return res.status(404).json({ message: "Room not found" })
            }
            else {
                return res.status(200).json({ message: "Room status updated successfully" })
            }
        } else {
            return res.status(500).json(err)
        }
    })
}

let deleteProduct = (req, res) => {
    const id = req.params.id;
    let sql = "delete from `room` where id=?";
    connection.query(sql, [id], (err, results) => {
        if (!err) {
            if (results.affectedRows == 0) {
                return res.status(404).json({ message: "Product not found" })
            } else {
                return res.status(200).json({ message: "delete product successfully" })
            }
        } else {
            res.status(500).json(err)
        }
    })
}


module.exports = {
    addProduct,
    getProduct,
    getOneProduct,
    getCountProduct,
    searchProduct,
    getByCategory,
    getById,
    updateProduct,
    updateStatus,
    deleteProduct,
    limitProduct
}