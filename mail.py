import smtplib
email="YOUR_EMIAL@gmail.com"
password="password"
send_mail="sendemail@gmail.com"
text="This is a text"


server=smtplib.SMTP("smtp.gmail.com",587)
server.starttls()
server.login(email,password)
server.sendmail(email, send_mail, text)
server.quit()