import connection from '../config/connectDB'
import bcrypt from 'bcrypt';

const accountController = {
    getUser: (req, res) => {
        let sql = "select id, name, email, password from account where role = 'user' "
        connection.query(sql, (err, results) => {
            console.log(err);
            if (!err) {
                return res.status(200).json(results)
            } else {
                return res.status(500).json(err)
            }
        })
    },
    
    getStatus: (req, res)=>{
        let productId = req.params.id
        let sql = "select status from account where id  = ?";
        connection.query(sql, [productId], (err, results) => {
            if (!err) {
                return res.status(200).json(results)
            } else {
                res.status(500).json(err)
            }
        })
    },
    
    updateStatus: (req, res) => {
        let userId = req.params.id
        let user = req.body;
        let sql = "update account set status = ? where id = ?";
        connection.query(sql, [user.status, userId], (err, results) => {
            if (!err) {
                if (results.affectedRows == 0) {
                    return res.status(404).json({ message: "account not found" })
                }
                else {
                    return res.status(200).json({ message: "account status updated successfully" })
                }
            } else {
                return res.status(500).json(err)
            }
        })
    },
    
    deleteUser: (req, res) => {
        const id = req.params.id;
        let sql = "delete from `account` where id = ?";
        connection.query(sql, [id], (err, results) => {
            if (!err) {
                if (results.affectedRows == 0) {
                    return res.status(404).json({ message: "account not found" })
                } else {
                    return res.status(200).json({ message: "delete account successfully" })
                }
            } else {
                res.status(500).json(err)
            }
        })
    },
    
    getAdmin: (req, res) => {
        let sql = "select `id`, `name`, `email`, `password` from `account` where role = 'admin' "
        connection.query(sql, (err, results) => {
            if (!err) {
                return res.status(200).json(results)
            } else {
                return res.status(500).json(err)
            }
        })
    },
    
    getOneAdmin: (req, res)=>{
        let adminId = req.params.id
        let sql = "select * from `account` where id  = ?";
        connection.query(sql, [adminId], (err, results) => {
            if (!err) {
                return res.status(200).json(results)
            } else {
                res.status(500).json(err)
            }
        })
    },
    
    createAdmin: (req, res) => {
        let admin = req.body;
        let sql = "INSERT INTO `account`(`name`, `email`, `password`, `role`) VALUES (?,?,?,'admin');";
        connection.query(sql, [admin.name, admin.email,admin.password], (err, results) => {
            if (!err) {
                return res.status(200).json({ message: "Admin added successfully" })
            } else {
                res.status(500).json(err)
            }
        })
    },
    
    updateAdmin: (req, res) => {
        let adminId  = req.params.id
        let admin = req.body;
        console.log(adminId)
        let sql = "UPDATE `account` SET `name`=?,`email`=?,`password`=? WHERE id=?";
        connection.query(sql, [admin.name, admin.email, admin.password,adminId], (err, results) => {
            if (!err) {
                if (results.affectedRows == 0) {
                    return res.status(404).json({ message: "Admin not found" })
                } else {
                    return res.status(200).json({ message: "Admin updated successfully" })
                }
            }
            else {
                return res.status(500).json(err)
            }
        })
    },
    
    getCountAdmin: (req, res) => {
        let sql = "SELECT COUNT(id) FROM `account` WHERE role = 'admin'"
        connection.query(sql, (err, results) => {
            if (!err) {
                return res.status(200).json(results)
            } else {
                return res.status(500).json(err)
            }
        })
    },
    
    getCountUser: (req, res) => {
        let sql = "SELECT COUNT(id) FROM `account` WHERE role = 'user'"
        connection.query(sql, (err, results) => {
            if (!err) {
                return res.status(200).json(results)
            } else {
                return res.status(500).json(err)
            }
        })
    },
    
    // search
    searchAdmin: (req, res)=>{
        let name = req.query.name;
        let sql = "select * from account  WHERE (role = 'admin') and (name LIKE '%" + name + "%')";
        connection.query(sql, (err, results) => {
            if (!err) {
                return res.status(200).json(results)
            } else {
                res.status(500).json(err)
            }
        })
    },
    searchUser: (req, res)=>{
        let name = req.query.name;
        let sql = "select * from account  WHERE (role = 'user') and (name LIKE '%" + name + "%')";
        connection.query(sql, (err, results) => {
            if (!err) {
                return res.status(200).json(results)
            } else {
                res.status(500).json(err)
            }
        })
    }

}


export default accountController;