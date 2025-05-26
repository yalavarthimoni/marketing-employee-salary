# Marketing Employee Salary Calculation

 Marketing Employee Salary Calculation - Documentation
Project Content
A web-based application developed using Python and Flask that calculates and manages the salaries of marketing employees based on their performance, working hours, commissions, and incentives.

Includes:
- Flask-based backend to handle salary calculations.
- HTML templates for form input and displaying results.
- A salary model that factors in base pay, working hours, sales commissions, bonuses, and deductions.
- Modular and scalable codebase.
Project Code
--- app.py ---
from flask import Flask, render\_template, request

app = Flask(\_\_name\_\_)

def calculate\_salary(base\_salary, hours\_worked, commission, bonus):
hourly\_rate = base\_salary / 160 # assuming 160 working hours/month
return base\_salary + (hours\_worked * hourly\_rate) + commission + bonus

@app.route("/", methods=["GET", "POST"])
def index():
if request.method == "POST":
name = request.form["name"]
base = float(request.form["base\_salary"])
hours = float(request.form["hours\_worked"])
comm = float(request.form["commission"])
bonus = float(request.form["bonus"])

total\_salary = calculate\_salary(base, hours, comm, bonus)
return render\_template("result.html", name=name, total\_salary=total\_salary)

return render\_template("index.html")

if \_\_name\_\_ == "\_\_main\_\_":
app.run(debug=True)

--- index.html ---


Salary Calculator

Marketing Employee Salary Calculator
====================================



Name:   
  

Base Salary:   
  

Hours Worked:   
  

Commission:   
  

Bonus:   
  






--- result.html ---


Salary Result

Salary Calculation Result
-------------------------


**Name:** {{ name }}


**Total Salary:** ${{ total\_salary }}


[Calculate Another](/)


Key Technologies
- Python 3.x
- Flask Web Framework
- HTML5/CSS3 (for UI)
- Optional: SQLite / SQLAlchemy for future data storage
Description
Designed for marketing teams to help HR or finance departments compute employee salaries based on key performance metrics.

Takes into account:
- Base Salary
- Hours Worked
- Sales Commission
- Bonus or Incentives

Calculates total salary dynamically and presents it in a user-friendly format.
Output

![alt text](<WhatsApp Image 2025-05-26 at 20.39.15_904b07b1.jpg>)

![alt text](<WhatsApp Image 2025-05-26 at 20.40.21_e756d7e6.jpg>)

![alt text](<WhatsApp Image 2025-05-26 at 20.41.52_6d670ac3.jpg>)

![alt text](<WhatsApp Image 2025-05-26 at 20.42.16_620ba4f7.jpg>)

![alt text](<WhatsApp Image 2025-05-26 at 20.42.47_0aab227c.jpg>)

![alt text](<WhatsApp Image 2025-05-26 at 20.43.02_0edf4981.jpg>)

![alt text](<WhatsApp Image 2025-05-26 at 20.43.20_948c47a5.jpg>)

![alt text](<WhatsApp Image 2025-05-26 at 20.43.40_4aa01e2b.jpg>)

![alt text](<WhatsApp Image 2025-05-26 at 20.44.01_68cedb86.jpg>)

![alt text](<WhatsApp Image 2025-05-26 at 20.44.17_530f36f3.jpg>)

![alt text](<WhatsApp Image 2025-05-26 at 20.44.35_8ef2af9a.jpg>)

![alt text](<WhatsApp Image 2025-05-26 at 20.44.54_8708ac52.jpg>)

![alt text](<WhatsApp Image 2025-05-26 at 20.45.13_125e1a40.jpg>)

![alt text](<WhatsApp Image 2025-05-26 at 20.45.36_b352183a.jpg>)

![alt text](image.png)
































Further Research
- Add database integration for record-keeping.
- Implement login for employees/admins.
- Integrate APIs to auto-calculate commissions.
- Add tax/deduction logic.
- Export reports in PDF or Excel.


