from flask import Flask,request,jsonify

from flask_mysqldb import MySQL
from flask_bcrypt import Bcrypt
from flask_jwt_extended import JWTManager,create_access_token,jwt_required,get_jwt,get_jwt_identity
from datetime import datetime,timedelta  #used for fix time duration
from flask_cors import CORS
app1=Flask(__name__)
CORS(app1)

app1.config['JWT_SECRET_KEY']="myapp123"
jwt=JWTManager(app1)

bcrypt=Bcrypt(app1)
app1.config['MYSQL_USER']="root"
app1.config['MYSQL_PASSWORD']="SOWMYA1234"
app1.config['MYSQL_DB']="mymarketing"
app1.config['MYSQL_HOST']="localhost"

mysql=MySQL(app1)

#creating routes--add,delete,view etc..
#view employess
@app1.route("/viewallemployes",methods=["GET"])
def viewallemployes():
    cur=mysql.connection.cursor()
    cur.execute("select eid,ename,eemailid,epincode from employe_table")
    rows=cur.fetchall()
    col_name=[desc[0] for desc in cur.description]
    results=[dict(zip(col_name,row))for row in rows]
    return jsonify(results)

#delete employe
@app1.route("/deleteemploye/<int:id>",methods=["delete"])
def deleteemploye(id):
    cur=mysql.connection.cursor()
    cur.execute("delete from employe_table where eid=%s ",(id,))
    mysql.connection.commit()
    rowcount=cur.rowcount
    if rowcount == 0:
        return jsonify({"error":"employe not found to delete"})#404
    return jsonify({"message":"employe deleted sucess","id":id})#200

# View all doctors
@app1.route("/viewalldoctors", methods=["GET"])
def viewalldoctors():
    cur = mysql.connection.cursor()
    cur.execute("SELECT did, dname, demailid, dpincode, daddress, dspeciality FROM doctor_table")
    rows = cur.fetchall()
    col_names = [desc[0] for desc in cur.description]
    results = [dict(zip(col_names, row)) for row in rows]
    return jsonify(results)

# Delete doctor by ID
@app1.route("/deletedoctor/<int:id>", methods=["DELETE"])
def deletedoctor(id):
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM doctor_table WHERE did = %s", (id,))
    mysql.connection.commit()
    rowcount = cur.rowcount
    if rowcount == 0:
        return jsonify({"error": "Doctor not found to delete"})  # 404
    return jsonify({"message": "Doctor deleted successfully", "id": id})  # 200


#addemploye
@app1.route("/addemploye",methods=["POST"])
def addemploye():
    data = request.json
    ename = data['ename']
    eemailid=data['emailid']
    epassword=data['epassword']
    epincode=data['epincode']
    hashed_password = bcrypt.generate_password_hash(epassword).decode('utf-8')

    cur=mysql.connection.cursor()
    cur.execute("insert into employe_table(ename,eemailid,epassword,epincode) values(%s,%s,%s,%s)", (ename, eemailid, hashed_password, epincode))
    mysql.connection.commit()
    if cur.rowcount>0:
        return jsonify({"message": "Employee added successfully"}) 
    else:
        return jsonify({"message": "Employee added failed"})
    
#adddoctor

@app1.route("/adddoctor", methods=["POST"])
def adddoctor():
    data = request.json
    dname = data['dname']
    demailid = data['demailid']
    dpincode = data['dpincode']
    daddress = data['daddress']
    dspeciality = data['dspeciality']

    cur = mysql.connection.cursor()
    cur.execute(
        "INSERT INTO doctor_table (dname, demailid, dpincode, daddress, dspeciality) VALUES (%s, %s, %s, %s, %s)",
        (dname, demailid, dpincode, daddress, dspeciality)
    )
    mysql.connection.commit()

    if cur.rowcount > 0:
        return jsonify({"message": "Doctor added successfully"})
    else:
        return jsonify({"message": "Doctor addition failed"})


#user register

@app1.route("/employeregister", methods=["POST"])
def employeregister():
    data = request.json
    ename = data.get('ename')
    eemailid = data.get('eemailid')
    epassword = data.get('epassword')
    epincode = data.get('epincode')

    if not ename or not eemailid or not epassword or not epincode:
        return jsonify({"Error": "Missing credentials"})

    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM employe_table WHERE eemailid=%s", (eemailid,))
    if cur.fetchone():
        return jsonify({"Message": "employe already exists"})

    hashed_password = bcrypt.generate_password_hash(epassword).decode('utf-8')
    cur.execute(
        "INSERT INTO employe_table (ename, eemailid, epassword, epincode) VALUES (%s, %s, %s, %s)",
        (ename, eemailid, hashed_password, epincode)
    )
    mysql.connection.commit()
    return jsonify({"Message": "employe registration successful"})

#employe login

@app1.route("/employelogin", methods=["POST"])
def employelogin():
    data = request.json
    eemailid = data.get('eemailid')
    epassword = data.get('epassword')

    if not eemailid or not epassword:
        return jsonify({"Error": "Missing credentials"})

    cur = mysql.connection.cursor()
    cur.execute("SELECT eid, ename, eemailid, epassword FROM employe_table WHERE eemailid=%s", (eemailid,))
    user = cur.fetchone()
    if not user:
        return jsonify({"Message": "employe not found"})

    eid, ename, eemailid, stored_hash = user
    if bcrypt.check_password_hash(stored_hash, epassword):
        access_token = create_access_token(identity=str(eid), expires_delta=timedelta(hours=1))
        return jsonify({"Message": "Login successful", "access_token": access_token})
    else:
        return jsonify({"Message": "Login failed"})

#employe profile#profile ki route-- decocde acces token,from that get user id,now user details from that user id

@app1.route("/eprofile",methods=["GET"])
@jwt_required()
def profile():
    jwt_data=get_jwt() #this gives you full jwt information
    current_user=get_jwt_identity() #this gives using identity (user id)
    cur=mysql.connection.cursor()
    cur.execute("select * from employe_table where eid=%s",(current_user,))
    row=cur.fetchone()
    
    return jsonify(
        {"eid":current_user,"Jwt":jwt_data,"ename":row[1],"eemailid":row[2]})

if __name__=="__main__":
    app1.run(debug=True)